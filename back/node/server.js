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
  // Asignar email
  socket.data.email = null;

  console.log(`Usuario conectado: ${socket.id}`);

  // Unirse a un room
  socket.on('joinRoom', (data) => {
    const { room, username, role, email } = data;
    
    // Guardar el email, nombre de usuario y el rol en socket.data
    socket.data.username = username || `Usuario-${socket.id}`;
    socket.data.role = role || 'user'; // Establecer 'user' como rol por defecto
    socket.data.email = email;

    if (!socket.data.email) {
      socket.emit('message', 'Por favor, proporciona un email válido.');
      return;
    }

    socket.join(room);

    // Añadir usuario al room en la estructura centralizada
    if (!roomUsers[room]) {
      roomUsers[room] = [];
    }
    const user = { username, email, role }
    roomUsers[room].push(user);

    console.log(`${socket.data.username} se unió al room: ${room}, Rol: ${socket.data.role}, Email: ${socket.data.email}`);
    io.to(room).emit('roomMessage', {
      sender: 'Servidor',
      message: `${socket.data.username} se unió al room con el rol de ${socket.data.role}.`,
      users: roomUsers[room], // Enviar la lista de usuarios en el room
    });
    console.log(roomUsers)
  });

  // Fer JSON
  socket.on('requestUserList', ({ room }) => {
    // Verifica si la sala existeix i retorna la llista d'usuaris
    if (roomUsers[room]) {
        const userList = roomUsers[room];
        socket.emit('userList', userList);
    } else {
        socket.emit('userList', []);
    }
  });

  // Enviar un mensaje a un room
  socket.on('sendMessage', (data) => {
    const { room, message } = data;

    // Verificamos si el mensaje es válido
    if (message.trim() === '') {
      socket.emit('message', 'El mensaje no puede estar vacío.');
      return;
    }

    console.log(`Mensaje de ${socket.data.username}: ${message}`);
    console.log(roomUsers[room])
    io.to(room).emit('roomMessage', {
      sender: socket.data.username,
      role: socket.data.role,
      email: socket.data.email,
      message: message,
    });
  });

  // Expulsar a un usuario (solo administradores)
  socket.on('kickUser', (data) => {
    const { targetEmail, room } = data;

    // Verificar si el que realiza la acción es un administrador
    if (socket.data.role === 'admin') {
      // Buscar al socket con el email objetivo
      const targetSocket = [...io.sockets.sockets.values()].find(
        (s) => s.data.email === targetEmail
      );

      if (targetSocket) {
        const targetUsername = targetSocket.data.username || 'Usuario desconocido';
        targetSocket.leave(room);

        // Eliminar usuario del room
        roomUsers[room] = roomUsers[room].filter(email => email !== targetEmail);

        console.log(`Usuario ${targetUsername} (${targetSocket.data.email}) fue expulsado del room ${room}`);
        io.to(room).emit('roomMessage', {
          sender: 'Servidor',
          message: `${targetUsername} fue expulsado del room por ${socket.data.username || 'un administrador'}.`,
          users: roomUsers[room], // Actualizar la lista de usuarios en el room
        });

        targetSocket.emit('message', 'Has sido expulsado del room.');
      } else {
        socket.emit('message', 'No se encontró al usuario con ese email.');
      }
    } else {
      socket.emit('message', 'No tienes permisos para realizar esta acción.');
    }
  });

  socket.on('leaveRoom', (data) => {
    const {room, email} = data;
    const targetSocket = [...io.sockets.sockets.values()].find(
      (s) => s.data.email === email
    );
    if (targetSocket) {
      const targetUsername = targetSocket.data.username || 'Usuario desconocido';
      targetSocket.leave(room);

      // Eliminar usuario del room
      roomUsers[room] = roomUsers[room].filter(mail => mail !== email);

      console.log(`Usuario ${targetUsername} (${targetSocket.data.email}) salio del room ${room}`);
      io.to(room).emit('roomMessage', {
        sender: 'Servidor',
        message: `${targetUsername} salio del room.`,
        users: roomUsers[room], // Actualizar la lista de usuarios en el room
      });

      targetSocket.emit('message', 'Has salido del room.');
    } else {
      socket.emit('message', 'No se encontró al usuario con ese email.');
    }
  });

  socket.on('getRoomUserDetails', (data) => {
    const { room } = data;

    // Verificar si la sala existeix
    if (roomUsers[room]) {
        // Generar la llista d'usuaris amb email i rol
        const userDetails = roomUsers[room].map(user => ({
            email: user.email,
            role: user.role,
            username: user.username
        }));

        // Enviar la llista al client que ho ha demanat
        socket.emit('roomUserDetails', {
            room: room,
            users: userDetails,
        });
    } else {
        // Informar que la sala no existeix
        socket.emit('roomUserDetails', {
            room: room,
            users: [],
            message: 'La sala no existeix o no té usuaris.',
        });
    }
});

  // Evento de desconexión
  socket.on('disconnect', () => {
    console.log(`Usuario desconectado: Email ${socket.data.email}`);
    for (room in roomUsers) {
      console.log(roomUsers[room]);
      roomUsers[room] = roomUsers[room].filter(user => user.email !== socket.data.email);
      // Informar al room sobre la desconexión
      io.to(room).emit('roomMessage', {
        sender: 'Servidor',
        message: `${socket.data.username || 'Un usuario'} se desconectó.`,
        users: roomUsers[room], // Actualizar la lista de usuarios en el room
      });
    }
    console.log(roomUsers);
  });
});

// Iniciar el servidor
const PORT = process.env.PORT || 3010;
server.listen(PORT, () => {
  console.log(`Servidor en funcionament a http://localhost:${PORT}`);
});