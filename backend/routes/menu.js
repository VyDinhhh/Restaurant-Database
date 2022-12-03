const express = require("express");
const router = express.Router();

const { con } = require('../startup/db')

router.get('/', (req, res) => {
    con.query("SELECT * FROM menu", function (error, result, fields) {
        res.send(result);
    })

})

module.exports = router;