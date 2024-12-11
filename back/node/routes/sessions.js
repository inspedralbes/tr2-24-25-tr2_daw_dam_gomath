const express = require('express');
const router = express.Router();
const Session = require('../models/Sessions');

router.post('/newSession', async (req, res) => {
    try {
        const newSession = new Session({
            code: req.body.code,
            operation: req.body.operation,
            mode: req.body.mode,
            quantity: req.body.quantity,
            level: req.body.level
        });

        const savedSession = await newSession.save();
        res.status(201).json(savedSession);
    } catch (err) {
        console.log(err);
    }
});

module.exports = router;