const express = require('express');
const router = express.Router();
const OnlineGame = require('../models/OnlineGame');

// Crear una nueva partida online
router.post('/', async (req, res) => {
    try {
        const newGame = new OnlineGame({
            nombre: req.body.nombre,
            aciertos: req.body.aciertos,
            errores: req.body.errores,
            puntos: req.body.puntos
        });

        const savedGame = await newGame.save();
        res.status(201).json(savedGame);
    } catch (error) {
        res.status(500).json({ missatge: 'Error al crear la partida online', error });
    }
});

// Obtener todas las partidas online
router.get('/', async (req, res) => {
    try {
        const games = await OnlineGame.find();
        res.json(games);
    } catch (error) {
        res.status(500).json({ missatge: 'Error al obtener las partidas online', error });
    }
});

// Obtener partida online por nombre
// router.get('/session/:session_id', async (req, res) => {
//     try {
//         const game = await OnlineGame.findOne({ session_id: req.params.session_id });
//         if (!game) return res.status(404).json({ missatge: 'Partida no encontrada para este session_id' });
//         res.json(game);
//     } catch (error) {
//         res.status(500).json({ missatge: 'Error al obtener la partida online', error });
//     }
// });

// Obtenir partides per player_id (per ser part d'un array de players_id)
router.get('/player/:nombre', async (req, res) => {
    try {
        // Obtenir el player_id de la petició
        const playerId = req.params.nombre;

        // Cercar partides on player_id estigui dins de l'array players_id
        const games = await OnlineGame.find({ nombre: playerId });

        // Si no hi ha partides, retornar un error
        if (games.length === 0) {
            return res.status(404).json({ missatge: 'No s’han trobat partides per aquest player_id' });
        }

        // Retornar les partides trobades
        res.json(games);
    } catch (error) {
        // Gestionar errors
        res.status(500).json({ missatge: 'Error al obtenir les partides', error });
    }
});

// // Obtenir totes les partides per un player_id i data
// router.get('/player/:player_id/:date', async (req, res) => {
//     try {
//         const playerId = req.params.player_id;
//         const date = req.params.date; // Fecha en formato YYYY-MM-DD
  
//         // Crear un objeto de fecha sin horas, minutos, segundos ni milisegundos
//         const startDate = new Date(date);
//         startDate.setHours(0, 0, 0, 0); // Asegura que solo se considere la fecha
  
//         const endDate = new Date(date);
//         endDate.setHours(23, 59, 59, 999); // Asegura que la fecha termine al final del día
  
//         // Buscar partidas por player_id y por rango de fecha
//         const games = await OnlineGame.find({
//             players_id: playerId,
//             created_at: { $gte: startDate, $lte: endDate } // Filtrar por fecha
//         });
  
//         if (games.length === 0) {
//             return res.status(404).json({ missatge: 'No s’han trobat partides per aquest player_id i data' });
//         }
  
//         res.json(games);
//     } catch (error) {
//         res.status(500).json({ missatge: 'Error al obtenir les partides', error });
//     }
//   });

// Eliminar una partida online por ID
router.delete('/:id', async (req, res) => {
    try {
        const gameDeleted = await OnlineGame.findByIdAndDelete(req.params.id);
        if (!gameDeleted) return res.status(404).json({ missatge: 'Partida no encontrada' });
        res.json({ missatge: 'Partida online eliminada' });
    } catch (error) {
        res.status(500).json({ missatge: 'Error al eliminar la partida online', error });
    }
});

module.exports = router;
