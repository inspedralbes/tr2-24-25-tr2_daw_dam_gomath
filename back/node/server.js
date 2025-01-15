const express = require("express");
const http = require("http");
const mongoose = require("mongoose");
const { Server } = require("socket.io");
const { v4: uuidv4 } = require("uuid");
const cors = require("cors");
const { exec } = require("child_process"); // Para ejecutar comandos de Python

const app = express();
const server = http.createServer(app);
const offlineGamesRoutes = require('./routes/offlineGames');
const onlineGamesRoutes = require('./routes/onlineGames');

const path = require("path");
app.use('/graphs', express.static(path.join(__dirname, 'public/graphs')));

const io = new Server(server, {
    cors: {
        origin: ["http://localhost:5173"], 
        methods: ["GET", "POST"],       
        credentials: true               
    }
});

const PORT = 3000;

app.use(express.json()); 
app.use(cors({
    origin: ["http://localhost:5173", "http://localhost:3001"], 
    methods: ["GET", "POST"],       
    credentials: true               
}));
app.use(express.static("public"));
app.use('/api/onlineGames', onlineGamesRoutes);

// Conexión a la base de datos MongoDB
mongoose.connect('mongodb+srv://a18marcastru:mongodb@cluster24-25.38noo.mongodb.net/GoMath', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

const rooms = {};

app.post('/api/create-room', (req, res) => {
    const { email } = req.body;
    const roomCode = uuidv4().slice(0, 6);
    rooms[roomCode] = { members: [], messages: [] };
    res.json({ roomCode, email });
});

// Ruta para generar los gráficos
app.get('/api/generar-graficos', (req, res) => {
    exec("python ./Python/statistics.py", (error, stdout, stderr) => {
        if (error || stderr) {
            console.error(`Error: ${error || stderr}`);
            return res.status(500).json({ message: "Error al generar gráficos" });
        }
        // Responder con las URLs de los gráficos generados
        res.json({
            graficoPuntosUrl: "/graphs/puntos_por_jugador.png",
            graficoAciertosErroresUrl: "/graphs/aciertos_vs_errores.png"
        });
    });
});

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
            console.log(`${username} salió de la sala ${roomCode}`);
            io.to(roomCode).emit("update-users", rooms[roomCode].members);
            if (rooms[roomCode].members.length === 0) {
                delete rooms[roomCode];
            }
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

server.listen(PORT, () => {
    console.log(`Servidor en ejecución en http://localhost:${PORT}`);
});
