const express = require("express");
const router = express.Router();

const { con } = require('../startup/db')

router.get('/', (req, res) => {
    const query = con.query("SELECT * FROM `cart`", function (error, result, fields) {
        if (error) return res.status(400).send(error);
        res.send(result);
    })

})

// create a new cart
router.post('/', (req, res) => {
    con.query("INSERT INTO cart` VALUES ()", function (error, result, fields) {
        if (error) return res.status(400).send(error);
        res.send(result);
    })

})

// get a specific cart
router.get('/:id', async (req, res) => {
    con.execute("SELECT * FROM menu WHERE `Item_ID` = ?", [req.params.id], function (error, result, fields) {
        if (error) return res.status(400).send(error);
        res.send(result)
    })
})

// add item to cart
router.post('/item/:id', (req, res) => {
    con.execute('INSERT INTO `Cart_item`(Cart_ID, Item_ID) VALUES', [req.params.id, req.body.item, 1], function (error, result, fields) {
        if (error) return res.status(400).send(error);
        res.send(result)
    })
})

// update quantity of an item in cart
router.put('/:id/item/:itemId', (req, res) => {
    con.execute('UPDATE `cart_item` SET quantity= ? WHERE `Item_ID` = ? AND `Cart_ID`=?', [req.body.quantity, req.params.itemId, req.params.id], function (error, result, fields) {
        if (error) return res.status(400).send(error);
        res.send(result)
    })
})

// get cart items
router.get('/item/:id', (req, res) => {
    con.execute(`
    SELECT i.Cart_item_ID, i.item_ID, i.Quantity FROM cart as c 
    JOIN cart_item as i on c.Cart_ID=i.Cart_ID
    WHERE c.CART_ID=?
    `,
        [req.params.id],
        function (error, result, fields) {
            if (error) return res.status(400).send(error);
            res.send(result)
        })
})



module.exports = router;