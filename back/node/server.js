const express = require("express");
const http = require("http");
const { Server } = require("socket.io");
const { v4: uuidv4 } = require("uuid");
const cors = require("cors");  // Importa el paquete cors
const app = express();
const server = http.createServer(app);
const io = new Server(server);

const PORT = 3000;

// Middleware para parsear JSON en el cuerpo de la solicitud
app.use(express.json());

// Middleware para habilitar CORS
app.use(cors());  // Permitir CORS desde todos los orígenes (puedes personalizarlo si lo necesitas)

// Middleware para servir archivos estáticos
app.use(express.static("public"));

// Objeto para almacenar salas activas
const rooms = {};

// Ruta para crear una sala desde la API (con correo del usuario)
app.post('/api/create-room', (req, res) => {
    const { email } = req.body;  // Obtener el correo del cuerpo de la solicitud

    // Generar un código único para la sala
    const roomCode = uuidv4().slice(0, 6);

    // Crear la sala en el objeto `rooms`
    rooms[roomCode] = { members: [], messages: [] };

    // Responder con el código de la sala y el correo del usuario (aunque no lo utilices por ahora)
    res.json({ roomCode, email });
});

// Manejo de conexiones de WebSocket
io.on("connection", (socket) => {
    console.log("Nuevo cliente conectado:", socket.id);

    // Crear sala
    socket.on("create-room", (username) => {
        const roomCode = uuidv4().slice(0, 6);
        rooms[roomCode] = { members: [{ id: socket.id, name: username }], messages: [] };
        socket.join(roomCode);
        console.log(`${username} creó la sala ${roomCode}`);
        socket.emit("room-created", roomCode);
    });

    // Unirse a sala
    socket.on("join-room", ({ roomCode, username }) => {
        if (rooms[roomCode]) {
            // Agregar jugador a la sala
            rooms[roomCode].members.push({ id: socket.id, name: username });
            socket.join(roomCode);
            console.log(`${username} se unió a la sala ${roomCode}`);
            
            // Emitir evento para actualizar la lista de jugadores a todos los clientes en la sala
            io.to(roomCode).emit("update-users", rooms[roomCode].members);
        
            // Emitir a quien se unió los detalles de la sala
            socket.emit("joined-success", {
                roomCode,
                members: rooms[roomCode].members,
                messages: rooms[roomCode].messages
            });
        } else {
            socket.emit("error", "La sala no existe");
        }
    });

    socket.on("send-message", ({ roomCode, message, username }) => {
        const chatMessage = { user: username, text: message, timestamp: new Date().toLocaleTimeString() };
        if (rooms[roomCode]) {
            rooms[roomCode].messages.push(chatMessage); // Guardar mensaje en la sala
            io.to(roomCode).emit("new-message", chatMessage); // Enviar mensaje a todos
        }
    });

    // Cuando un usuario sale de la sala
    socket.on("leave-room", ({ roomCode, username }) => {
        if (rooms[roomCode]) {
            // Eliminar al usuario de la sala
            rooms[roomCode].members = rooms[roomCode].members.filter((member) => member.id !== socket.id);
            socket.leave(roomCode);
            console.log(`${username} salió de la sala ${roomCode}`);
            // Notificar a los demás usuarios de la sala
            io.to(roomCode).emit("update-users", rooms[roomCode].members);

            // Eliminar la sala si no hay más usuarios
            if (rooms[roomCode].members.length === 0) {
                delete rooms[roomCode];
            }
        }
    });

    // Manejar desconexión
    socket.on("disconnect", () => {
        for (const roomCode in rooms) {
            rooms[roomCode].members = rooms[roomCode].members.filter((member) => member.id !== socket.id);
            io.to(roomCode).emit("update-users", rooms[roomCode].members);
            if (rooms[roomCode].members.length === 0) delete rooms[roomCode];
        }
        console.log(`Cliente desconectado: ${socket.id}`);
    });
});

// Iniciar el servidor
server.listen(PORT, () => {
    console.log(`Servidor en http://localhost:${PORT}`);
});
