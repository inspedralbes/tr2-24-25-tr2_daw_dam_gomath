import express from 'express';
import cors from 'cors';
import { createServer } from 'node:http';
import { Server } from 'socket.io';
import fs from 'fs';

const app = express();
app.use(cors());

const server = createServer(app);
const io = new Server(server, {
  cors: {
    origin: '*', // Replace with the actual origin of your client application
    methods: ['GET', 'POST'],
  }
});

io.on('connection', (socket) => {

  //quan hi ha una connexió llegim el fitxer i avisem de una actualització de vots
  fs.readFile('votos.json', 'utf8', (err, data) => {
    const votos = JSON.parse(data);
    io.emit('actualizacionVotos', votos);
  });


  socket.on('votacion', (idVoto) => {
    // Leer el archivo JSON
    console.log("llega una votacion")
    console.log(idVoto)
    fs.readFile('votos.json', 'utf8', (err, data) => {
      if (err) throw err;

      // Parsear el JSON
      const votos = JSON.parse(data);
      console.log(votos)
      // Actualizar el recuento de votos
      votos[idVoto]++;

      // Guardar el JSON actualizado
      fs.writeFile('votos.json', JSON.stringify(votos), (err) => {
        if (err) throw err;

        // Emitir el JSON actualizado
        io.emit('actualizacionVotos', votos);
        console.log("se ha emitido actualizacion")
        console.log(votos)
      });
    });
  });
});

server.listen(3001, () => {
  console.log('Server running at http://localhost:3001');
});
