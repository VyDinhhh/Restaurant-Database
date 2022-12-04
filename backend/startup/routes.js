const express = require("express");

const menu = require('../routes/menu')
const order = require('../routes/order')
const cart = require('../routes/cart')
const employee = require('../routes/employee')

module.exports = function (app) {
    app.use(express.json());
    app.use('/menu', menu)
    app.use('/order', order)
    app.use('/employee', employee)
};
