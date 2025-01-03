const express = require("express");
const http = require("http");
const { Server } = require("socket.io");
const { v4: uuidv4 } = require("uuid");
const cors = require("cors");

// Configuración inicial
const app = express();
const server = http.createServer(app);
const PORT = 3000;

// Configuración de Socket.io con CORS
const io = new Server(server, {
    cors: {
        origin: "http://localhost:5173", 
        methods: ["GET", "POST", "DELETE", "PUT", "PATCH"],     
        credentials: true               
    }
});

// Middleware
app.use(express.json());
app.use(cors({
    origin: "http://localhost:5173",
    methods: ["GET", "POST", "DELETE", "PUT", "PATCH"],  
    credentials: true
}));
app.use(express.static("public"));

// Almacenamiento en memoria para salas
const rooms = {};

// Rutas REST

// Crear sala
app.post('/api/create-room', (req, res) => {
    const { email } = req.body;

    const roomCode = uuidv4().slice(0, 6); // Generar código único de sala
    rooms[roomCode] = { members: [], messages: [] }; // Inicializar sala

    res.json({ roomCode, email });
});

// Obtener información de una sala por su código
app.get('/api/salas/:roomCode', (req, res) => {
    const { roomCode } = req.params;

    if (rooms[roomCode]) {
        res.json({ existe: true, roomCode });
    } else {
        res.status(404).json({ existe: false, mensaje: "La sala no existe" });
    }
});

// Eventos de Socket.io
io.on("connection", (socket) => {
    console.log("Nuevo cliente conectado:", socket.id);

    socket.on("create-room", (username) => {
        const roomCode = uuidv4().slice(0, 6);
        rooms[roomCode] = { members: [{ id: socket.id, name: username }], messages: [] };
        socket.join(roomCode);
        console.log(`${username} creó la sala ${roomCode}`);
        socket.emit("room-created", roomCode);
    });

    socket.on("join-room", ({ roomCode, username }) => {
        if (rooms[roomCode]) {
            rooms[roomCode].members.push({ id: socket.id, name: username });
            socket.join(roomCode);
            console.log(`${username} se unió a la sala ${roomCode}`);
            
            io.to(roomCode).emit("update-users", rooms[roomCode].members);
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
            rooms[roomCode].messages.push(chatMessage);
            io.to(roomCode).emit("new-message", chatMessage);
        }
    });

    socket.on("leave-room", ({ roomCode, username }) => {
        if (rooms[roomCode]) {
            rooms[roomCode].members = rooms[roomCode].members.filter((member) => member.id !== socket.id);
            socket.leave(roomCode);
            io.to(roomCode).emit("update-users", rooms[roomCode].members);
            if (rooms[roomCode].members.length === 0) {
                delete rooms[roomCode];
            }
        }
    });
    app.delete('/api/salas/:roomCode', (req, res) => {
        const { roomCode } = req.params;
    
        if (rooms[roomCode]) {
            delete rooms[roomCode]; 
            res.json({ success: true, message: "Sala eliminada exitosamente" });
        } else {
            res.status(404).json({ success: false, message: "Sala no encontrada" });
        }
    });
    
    socket.on("disconnect", () => {
        for (const roomCode in rooms) {
            rooms[roomCode].members = rooms[roomCode].members.filter((member) => member.id !== socket.id);
            io.to(roomCode).emit("update-users", rooms[roomCode].members);
            if (rooms[roomCode].members.length === 0) {
                delete rooms[roomCode];
            }
        }
        console.log(`Cliente desconectado: ${socket.id}`);
    });
});

// Iniciar el servidor
server.listen(PORT, () => {
    console.log(`Servidor en ejecución en http://localhost:${PORT}`);
});
