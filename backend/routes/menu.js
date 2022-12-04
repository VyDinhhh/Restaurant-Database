const express = require("express");
const router = express.Router();

const { con } = require('../startup/db')

// get all item in the menu
router.get('/', (req, res) => {
    con.query("SELECT * FROM `menu`", function (error, result, fields) {
        if (error) return res.status(400).send(error);
        res.send(result);
    })

})

// get specific item
router.get('/:id', (req, res) => {
    con.execute("SELECT * FROM menu WHERE `Item_ID` = ?", [req.params.id], function (error, result, fields) {
        if (error) return res.status(400).send(error);
        res.send(result)
    })
})

module.exports = router;