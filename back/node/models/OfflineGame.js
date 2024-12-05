const mongoose = require('mongoose');

const OfflineGameSchema = new mongoose.Schema({
    player_id: { type: String, required: true },
    game_type: { type: String, required: true },
    total_rounds: { type: Number, required: true },
    session_time: { type: Number, required: false },
    created_at: { 
        type: Date, 
        default: () => {
            const today = new Date();
            today.setHours(0, 0, 0, 0); // Eliminar hora, minutos y segundos
            return today;
        } 
    },
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

// Middleware para formatear la salida
OfflineGameSchema.set('toJSON', {
    transform: (doc, ret) => {
        if (ret.created_at) {
            const localDate = new Date(ret.created_at);
            localDate.setMinutes(localDate.getMinutes() - localDate.getTimezoneOffset()); // Ajustar a tu zona horaria
            ret.created_at = localDate.toISOString().split('T')[0]; // Extraer solo YYYY-MM-DD
        }
        return ret;
    }
});

module.exports = mongoose.model('Game', OfflineGameSchema, 'Offline-Games');