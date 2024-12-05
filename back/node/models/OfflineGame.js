const mongoose = require('mongoose');

const OfflineGameSchema = new mongoose.Schema({
    player_id: { type: String, required: true },
    game_type: { type: String, required: true },
    total_rounds: { type: Number, required: true },
    session_time: { type: Number, required: false },
    questions: [
        new mongoose.Schema(
            {
                question: { type: String, required: true },
                correct_response: { type: String, required: true },
                current_response: { type: String, required: true },
                time_to_response: { type: Number, required: true },
            },
            { _id: false } // Desactivar la generació automàtica d'_id
        )
    ]
});

module.exports = mongoose.model('Game', OfflineGameSchema, 'Offline-Games');