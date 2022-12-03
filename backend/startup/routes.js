const express = require("express");

const menu = require('../routes/menu')

module.exports = function (app) {
    app.use(express.json());
    app.use('/menu', menu)
};
