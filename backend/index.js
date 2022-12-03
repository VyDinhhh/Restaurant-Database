const express = require("express");
const app = express();


// startup
// db


// routes
require("./startup/routes")(app);

const port = process.env.PORT || 3900;
app.listen(port, () => (`Listening on port ${port}`));
