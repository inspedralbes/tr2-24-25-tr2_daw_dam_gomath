const express = require('express');
const router = express.Router();
const path = require('path');
const OfflineGame = require('../models/OfflineGame');

// Crear una nova motocicleta
router.post('/', async (req, res) => {
  try {

    const newGame = new OfflineGame({
        player_id: req.body.player_id,
        game_type: req.body.game_type,
        total_rounds: req.body.total_rounds,
        session_time: req.body.session_time,
        questions: req.body.questions.map(q => ({
            question: q.question,
            correct_response: q.correct_response,
            current_response: q.current_response,
            time_to_response: q.time_to_response
        }))
    });

    const GameSave = await newGame.save();
    res.status(201).json(GameSave);
  } catch (error) {
    res.status(500).json({ missatge: 'Error al crear el registre de la Partida', error });
  }
});

// Obtenir totes les motocicletes
router.get('/', async (req, res) => {
  try {
    const games = await OfflineGame.find();
    res.json(games);
  } catch (error) {
    res.status(500).json({ missatge: 'Error al obtenir les Partides', error });
  }
});

// Obtenir totes les partides per player_id
router.get('/:player_id', async (req, res) => {
  try {
      const games = await OfflineGame.find({ player_id: req.params.player_id }); // Cerca totes les coincidències
      if (games.length === 0) return res.status(404).json({ missatge: 'No s’han trobat partides per aquest player_id' });
      res.json(games);
  } catch (error) {
      res.status(500).json({ missatge: 'Error al obtenir les partides', error });
  }
});

// Eliminar una motocicleta per ID
router.delete('/:id', async (req, res) => {
  try {
    const gameEliminat = await OfflineGame.findByIdAndDelete(req.params.id);
    if (!gameEliminat) return res.status(404).json({ missatge: 'Partida no trobada' });
    res.json({ missatge: 'Partida eliminada' });
  } catch (error) {
    res.status(500).json({ missatge: 'Error al eliminar la Partida', error });
  }
});

module.exports = router;