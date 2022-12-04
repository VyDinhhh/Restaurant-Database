const express = require("express");
const router = express.Router();

const { con } = require('../startup/db')

// create a specific employee
router.get('/:id', (req, res) => {
    con.execute("SELECT * FROM `employee` WHERE Employee_ID = ?", [req.params.id], function (error, result, fields) {
        if (error) return res.status(400).send(error)
        if (result.length === 0) return res.status(404).send("No employee with given id");
        res.send(result);
    })

})

module.exports = router;