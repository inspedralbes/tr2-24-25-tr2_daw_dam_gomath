const express = require('express');
const router = express.Router();
const OnlineGame = require('../models/OnlineGame');

// Crear una nueva partida online
router.post('/', async (req, res) => {
    try {
        const newGame = new OnlineGame({
            session_id: req.body.session_id,
            players_id: req.body.players_id,
            game_type: req.body.game_type,
            total_rounds: req.body.total_rounds,
            session_time: req.body.session_time,
            leaderboard: req.body.leaderboard.map(lb => ({
                position: lb.position,
                player_id: lb.player_id,
                score: lb.score,
                questions: lb.questions,
            })),
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

// Obtener partida online por session_id
router.get('/:session_id', async (req, res) => {
    try {
        const game = await OnlineGame.findOne({ session_id: req.params.session_id });
        if (!game) return res.status(404).json({ missatge: 'Partida no encontrada para este session_id' });
        res.json(game);
    } catch (error) {
        res.status(500).json({ missatge: 'Error al obtener la partida online', error });
    }
});

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
