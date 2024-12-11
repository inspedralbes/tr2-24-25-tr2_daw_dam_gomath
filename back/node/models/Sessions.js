const mongoose = require('mongoose');

const SessionSchema = new mongoose.Schema({
    code: {type: Number, required: true},
    operation: {type: String, required: true},
    mode: {type: String, required: true},
    quantity: {type: Number, required: true},
    level: {type: String, required: true}
});

module.exports = mongoose.model('Sessions', SessionSchema, 'Sessions-Games');