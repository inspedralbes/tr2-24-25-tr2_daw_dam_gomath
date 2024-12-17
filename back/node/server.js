const express = require("express");
const http = require("http");
const { Server } = require("socket.io");
const { v4: uuidv4 } = require("uuid");

const app = express();
const server = http.createServer(app);
const io = new Server(server);

const PORT = 3000;

// Middleware para servir archivos estáticos
app.use(express.static("public"));

// Objeto para almacenar salas activas
const rooms = {};

// Manejo de conexiones
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
            rooms[roomCode].members.push({ id: socket.id, name: username });
            socket.join(roomCode);
            console.log(`${username} se unió a la sala ${roomCode}`);
            io.to(roomCode).emit("update-users", rooms[roomCode].members);
            socket.emit("joined-success", { roomCode, members: rooms[roomCode].members, messages: rooms[roomCode].messages });
        } else {
            socket.emit("error", "La sala no existe");
        }
    });

    // Enviar mensaje en el chat
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
