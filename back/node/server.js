const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const path = require('path');
const http = require('http');
const { v4: uuidv4 } = require("uuid");
const { Server } = require('socket.io');
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
const detailsRoom = {};

io.on('connection', (socket) => {
  console.log(`Usuario conectado: ${socket.id}`);

  socket.on("create-room", (username) => {
    const roomCode = uuidv4().slice(0, 6); 
    rooms[roomCode] = { members: [{ id: socket.id, name: username }], messages: [] };
    socket.join(roomCode); 
    console.log(`${username} creó la sala ${roomCode}`);
    socket.emit("room-created", roomCode); 
  });
  
  socket.on('join-room', ({ roomCode, username }) => {
      
      socket.data.username = username || "Usuario_" + socket.id;  // Nombre por defecto
      
      console.log(roomCode + " " + username)

      if (!rooms[roomCode]) {
        socket.emit("error", "La sala no existe.");
        return;
      }
    
      const user = { id: socket.id, name: socket.data.username };
      rooms[roomCode].members.push(user);
      
      socket.join(roomCode);
      console.log(`Usuario ${socket.data.username} se unió a la sala: ${roomCode}`);
    
      // Notificar a todos los usuarios de la sala
      io.to(roomCode).emit('userJoined', {
        roomCode,
        members: rooms[roomCode].members
      });
  });
  

  socket.on('kickUser', () => {
    const { roomCode, idUser } = data;
    if (rooms[roomCode]) {
      rooms[roomCode] = rooms[roomCode].filter(user => user.id !== idUser);
      console.log(`Usuario con id ${idUser} fue expulsado de la sala ${roomCode}`);
    }
  });

  socket.on('disconnect', () => {
    for (const roomCode in rooms) {
      rooms[roomCode].members = rooms[roomCode].members.filter((member) => member.id !== socket.id);
      io.to(roomCode).emit("update-users", JSON.stringify(rooms[roomCode].members));

      if (rooms[roomCode].members.length === 0) {
        delete rooms[roomCode];
      }
    }
    console.log(`Cliente desconectado: ${socket.id}`);
  });
});

// Iniciar el servidor
const PORT = process.env.PORT || 3011;
server.listen(PORT, () => {
  console.log(`Servidor en funcionament a http://localhost:${PORT}`);
});