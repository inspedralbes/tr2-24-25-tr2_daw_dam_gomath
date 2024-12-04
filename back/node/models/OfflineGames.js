const mongoose = require('mongoose');

const OfflineGameSchema = new mongoose.Schema({
    player_id: { type: String, required: true },
    game_type: { type: String, required: true },
    total_rounds: { type: Number, required: true },
    session_time: { type: Number, required: false },
    questions: {
        question_1: {
            question: { type: String, required: true },
            correct_response: { type: String, required: true },
            current_response: { type: String, required: true },
            time_to_response: { type: String, required: true }
        },
    }
});

module.exports = mongoose.model('Game', OfflineGameSchema);