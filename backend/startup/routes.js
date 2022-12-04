const express = require("express");

const menu = require('../routes/menu')
const order = require('../routes/order')
const cart = require('../routes/cart')

module.exports = function (app) {
    app.use(express.json());
    app.use('/menu', menu)
    app.use('/order', order)
    app.use('/cart', cart)
};
