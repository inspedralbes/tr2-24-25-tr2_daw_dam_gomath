const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const path = require('path');
const http = require('http');
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

const roomUsers = {};
const detailsRoom = {};

io.on('connection', (socket) => {
  console.log(`Usuario conectado: ${socket.id}`);

  socket.on('joinRoom', (data) => {
    const { room, username, role, email } = data;

    // Validación de datos
    if (!email) {
        socket.emit('message', 'Por favor, proporciona un email válido.');
        return;
    }

    // Guardar datos del usuario
    socket.data.username = username || `Usuario-${socket.id}`;
    socket.data.role = role || 'user';
    socket.data.email = email;
    socket.data.room = room; // Guardar la sala en socket.data

    // Unir al usuario al room
    socket.join(room);

    if (!roomUsers[room]) {
        roomUsers[room] = [];
    }

    // Añadir al usuario a la lista del room
    const user = { username: socket.data.username, email: socket.data.email, role: socket.data.role };
    roomUsers[room].push(user);

    console.log(`Usuario ${socket.data.username} se unió a la sala: ${room}`);

    // Filtrar usuarios (excluir admins, si es necesario)
    const filteredUsers = roomUsers[room].filter((user) => user.role !== 'admin');

    // Notificar a todos los usuarios de la sala
    io.to(room).emit('userJoined', {
        email,
        username: socket.data.username,
        room,
        users: filteredUsers, // Lista sin admins
    });
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
      const userRoom = socket.data.room; // Obtener la sala del socket desconectado

      if (userRoom && roomUsers[userRoom]) {
          // Eliminar al usuario de la lista
          roomUsers[userRoom] = roomUsers[userRoom].filter(user => user.email !== socket.data.email);

          // Emitir el evento de desconexión
          io.to(userRoom).emit('userLeft', {
              email: socket.data.email,
              username: socket.data.username,
              room: userRoom,
              users: roomUsers[userRoom],
          });

          console.log(`Usuario ${socket.data.username} salió de la sala: ${userRoom}`);
      }

      console.log(`Usuario desconectado: ${socket.id}`);
  });
});

// Iniciar el servidor
const PORT = process.env.PORT || 3010;
server.listen(PORT, () => {
  console.log(`Servidor en funcionament a http://localhost:${PORT}`);
});