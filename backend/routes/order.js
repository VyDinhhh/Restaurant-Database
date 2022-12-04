const express = require("express");
const router = express.Router();

const { con } = require('../startup/db')

router.get('/', (req, res) => {
    con.query("SELECT * FROM `order`", function (error, result, fields) {
        if (error) return res.status(400).send(error)
        res.send(result);
    })

})
router.post('/', (req, res) => {
    const date = new Date().toISOString().slice(0, 19).replace('T', ' ');
    con.execute("INSERT INTO `order` (Order_method_ID, Customer_ID, Order_date, Order_time) VALUES (?,?,?,?)", [req.body.method, req.body.customer, date, date], function (error, result, fields) {
        if (error) return res.status(400).send(error)

        res.send(result);
    })
})

router.get('/item/:id', (req, res) => {
    con.execute('SELECT i.Item_ID, i.Quantity FROM `order` as o JOIN order_item as i on o.Order_number = i.Order_number WHERE o.Order_number = ?',
        [req.params.id],
        function (error, result, fields) {
            if (error) return res.status(400).send(error);
            res.send(result)
        })
})
router.post('/item/:id', (req, res) => {
    con.execute('INSERT INTO `Order_item`(Order_number, Item_ID, Quantity) VALUES(?,?,?)', [req.params.id, req.body.item, req.body.quantity], function (error, result, fields) {
        if (error) return res.status(400).send(error)
        res.send(result);
    })
})

router.get('/:id', (req, res) => {
    con.execute("SELECT * FROM `order` WHERE `Order_number` = ?", [req.params.id], function (error, result, fields) {
        if (error) return res.status(400).send(error)
        res.send(result)
    })
})

module.exports = router;