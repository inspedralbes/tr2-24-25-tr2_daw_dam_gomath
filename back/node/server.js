const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const path = require('path');
const http = require('http');
const { Server } = require('socket.io');
const { v4: uuidv4 } = require("uuid");
const offlineGamesRoutes = require('./routes/offlineGames');
const onlineGamesRoutes = require('./routes/onlineGames')

const app = express();
const server = http.createServer(app);
const io = new Server(server, {
  cors: { origin: "*" },
});

// Middleware
app.use(express.json());
app.use(cors()); // Habilitar CORS per a qualsevol origen
app.use('/api/offlineGames', offlineGamesRoutes);
app.use('/api/onlineGames', onlineGamesRoutes);

// Connexió a la base de dades MongoDB
mongoose.connect('mongodb+srv://a18marcastru:mongodb@cluster24-25.38noo.mongodb.net/GoMath', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})
.then(() => console.log('Connectat a MongoDB'))
.catch((err) => console.error('Error al connectar a MongoDB', err));

// Rutes
app.get('/', (req, res) => {
    res.send('Benvingut al servidor de jocs offline');
});

app.post('/api/userLogin',(req, res) => {
  const {email} = req.body;

  res.json({"email": email, "role": "admin"});
});

app.post('/api/create-room', (req, res) => {
  const { email } = req.body;

  const roomCode = uuidv4().slice(0, 6);

  rooms[roomCode] = { members: [], messages: [] };

  res.json({ roomCode, email });
});

const rooms = {};

io.on('connection', (socket) => {
  console.log(`Usuario conectado: ${socket.id}`);

  socket.on("join-room", ({ roomCode, username }) => {
    if (rooms[roomCode]) {
      rooms[roomCode].members.push({ id: socket.id, name: username });
      socket.join(roomCode); 
      console.log(`${username} se unió a la sala ${roomCode}`);
        
      io.to(roomCode).emit("update-users", rooms[roomCode].members);

      socket.emit("joined-success", {
        roomCode,
        members: rooms[roomCode].members
      });
    } else {
      socket.emit("error", "La sala no existe"); 
    }
  });

  socket.on('kickUser', (data) => {
    const { targetEmail, room } = data;
    if (roomUsers[room]) {
      roomUsers[room] = roomUsers[room].filter(user => user.email !== targetEmail);
      io.to(room).emit('roomUserDetails', {
        room,
        users: roomUsers[room],
      });
      console.log(`Usuario con email ${targetEmail} fue expulsado de la sala ${room}`);
    }
  });

  socket.on('disconnect', () => {
    for (const roomCode in rooms) {
      rooms[roomCode].members = rooms[roomCode].members.filter((member) => member.id !== socket.id);
      io.to(roomCode).emit("update-users", rooms[roomCode].members);
      io.to(roomCode).emit('userLeft', {
        roomCode,
        users: rooms[roomCode].members,
      });

      if (rooms[roomCode].members.length === 0) {
        delete rooms[roomCode];
      }
    }
    console.log(`Cliente desconectado: ${socket.id}`);
  });
});

// Iniciar el servidor
const PORT = process.env.PORT || 3010;
server.listen(PORT, () => {
  console.log(`Servidor en funcionament a http://localhost:${PORT}`);
});