const mongoose = require('mongoose');

const QuestionSchema = new mongoose.Schema(
    {
        question: { type: String, required: true },
        correct_response: { type: String, required: true },
        current_response: { type: String, required: true },
        time_to_response: { type: Number, required: true },
    },
    { _id: false } // Desactiva la generación automática de _id
);

const LeaderboardSchema = new mongoose.Schema(
    {
        position: { type: Number, required: true },
        player_id: { type: String, required: true },
        score: { type: Number, required: true },
        questions: { type: Map, of: QuestionSchema },
    },
    { _id: false }
);

const OnlineGameSchema = new mongoose.Schema({
    session_id: { type: String, required: true },
    players_id: { type: [String], required: true },
    game_type: { type: String, required: true },
    total_rounds: { type: Number, required: true },
    session_time: { type: Number, required: false },
    leaderboard: { type: [LeaderboardSchema], required: true },
});

module.exports = mongoose.model('OnlineGame', OnlineGameSchema, 'Online-Games');
