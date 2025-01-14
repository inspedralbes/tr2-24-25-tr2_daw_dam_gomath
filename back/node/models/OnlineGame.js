const mongoose = require('mongoose');

const OnlineGameSchema = new mongoose.Schema({
    session_id: { type: String, required: true },
    player_name: { type: String, required: true },
    preguntasAcertadas: { type: Number, required: true },
    preguntasFallidas: { type: Number, required: true },
    session_time: { type: Number, required: false },
    created_at: { 
        type: Date, 
        default: () => {
            const today = new Date();
            today.setHours(0, 0, 0, 0); // Eliminar hora, minutos y segundos
            return today;
        } 
    }
});

// Middleware para formatear la salida
OnlineGameSchema.set('toJSON', {
    transform: (doc, ret) => {
        if (ret.created_at) {
            const localDate = new Date(ret.created_at);
            localDate.setMinutes(localDate.getMinutes() - localDate.getTimezoneOffset()); // Ajustar a tu zona horaria
            ret.created_at = localDate.toISOString().split('T')[0]; // Extraer solo YYYY-MM-DD
        }
        return ret;
    }
});

module.exports = mongoose.model('OnlineGame', OnlineGameSchema, 'Online-Games');
