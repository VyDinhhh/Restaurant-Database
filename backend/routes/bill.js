const express = require("express");
const router = express.Router();

const { con } = require('../startup/db')

// create bill
router.post('/', (req, res) => {
    const date = new Date().toISOString().slice(0, 19).replace('T', ' ');
    con.execute("INSERT INTO `Bill`(Order_number, Customer_ID, Bill_date, Time, Area_ID, Discount_ID) VALUES(?,?,?,?,?,?) ", [req.body.order, req.body.customer, date, date, req.body.area, req.body.discount], function (error, result, fields) {
        if (error) return res.status(400).send(error);
        res.send(result);
    })

})

module.exports = router;