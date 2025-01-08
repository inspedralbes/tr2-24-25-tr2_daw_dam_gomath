const express = require("express");
const http = require("http");
const { Server } = require("socket.io");
const { v4: uuidv4 } = require("uuid");
const cors = require("cors");

const app = express();
const server = http.createServer(app);
const PORT = 3000;

const io = new Server(server, {
    cors: {
        origin: "http://localhost:5173",
        methods: ["GET", "POST", "DELETE", "PUT", "PATCH"],
        credentials: true,
    },
});

app.use(express.json());
app.use(cors({
    origin: "http://localhost:5173",
    methods: ["GET", "POST", "DELETE", "PUT", "PATCH"],
    credentials: true,
}));

const rooms = {};

app.post('/api/create-room', (req, res) => {
    const { email } = req.body;
    if (!email) {
        return res.status(400).json({ success: false, message: "Email es requerido" });
    }

    const roomCode = uuidv4().slice(0, 6);
    rooms[roomCode] = { members: [], messages: [], tipoPartida: null };

    res.json({ roomCode, email });
});

app.get('/api/salas/:roomCode', (req, res) => {
    const { roomCode } = req.params;

    if (rooms[roomCode]) {
        res.json({ existe: true, roomCode });
    } else {
        res.status(404).json({ existe: false, mensaje: "La sala no existe" });
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

io.on("connection", (socket) => {
    console.log("Nuevo cliente conectado:", socket.id);

    socket.on("create-room", (username) => {
        if (!username) {
            return socket.emit("error", "El nombre de usuario es requerido para crear la sala");
        }

        const roomCode = uuidv4().slice(0, 6);
        rooms[roomCode] = {
            members: [{ id: socket.id, name: username, isHost: true }],
            messages: [],
            tipoPartida: null,
        };

        socket.join(roomCode);
        console.log(`${username} creó la sala ${roomCode}`);
        socket.emit("room-created", roomCode);
    });

    socket.on("join-room", ({ roomCode, username }) => {
        if (!username) {
            return socket.emit("error", "El nombre de usuario es requerido para unirse a la sala");
        }

        if (rooms[roomCode]) {
            const isAlreadyMember = rooms[roomCode].members.some((member) => member.id === socket.id);
            if (!isAlreadyMember) {
                rooms[roomCode].members.push({ id: socket.id, name: username, isHost: false });
                console.log(`${username} se unió a la sala ${roomCode}`);
            }

            socket.join(roomCode);
            io.to(roomCode).emit("update-users", rooms[roomCode].members);
            socket.emit("joined-success", {
                roomCode,
                members: rooms[roomCode].members,
                messages: rooms[roomCode].messages,
                tipoPartida: rooms[roomCode].tipoPartida,
            });
        } else {
            socket.emit("error", "La sala no existe");
        }
    });

    socket.on("update-tipoPartida", ({ roomCode, tipoPartida }) => {
        if (rooms[roomCode]) {
            rooms[roomCode].tipoPartida = tipoPartida;
            io.to(roomCode).emit("tipoPartida-updated", tipoPartida);
        } else {
            socket.emit("error", "La sala no existe");
        }
    });

    socket.on("start-game", (roomCode) => {
        console.log("Evento 'start-game' recibido con los siguientes datos:", roomCode, roomCode.roomCode)
        const room = roomCode.roomCode;
            console.log(`Iniciando partida en la sala: ${room}`);
            io.to(room).emit("game-started");
    });

    socket.on("disconnect", () => {
        for (const roomCode in rooms) {
            const room = rooms[roomCode];
            const member = room.members.find((m) => m.id === socket.id);

            if (member) {
                room.members = room.members.filter((m) => m.id !== socket.id);
                io.to(roomCode).emit("update-users", room.members);

                if (member.isHost) {
                    console.log(`El host se desconectó de la sala ${roomCode}`);
                    if (room.members.length > 0) {
                        // Asignar nuevo host si quedan miembros
                        room.members[0].isHost = true;
                        io.to(roomCode).emit("new-host", room.members[0]);
                    } else {
                        // Eliminar la sala si está vacía
                        delete rooms[roomCode];
                    }
                } else {
                    console.log(`${member.name} se desconectó de la sala ${roomCode}`);
                }
            }
        }
        console.log(`Cliente desconectado: ${socket.id}`);
    });
});

server.listen(PORT, () => {
    console.log(`Servidor en ejecución en http://localhost:${PORT}`);
});
