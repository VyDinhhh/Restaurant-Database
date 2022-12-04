const express = require("express");
const app = express();
const cors = require("cors")

// startup
// cors
app.use(cors());
require("./startup/cors")(app);
// routes
require("./startup/routes")(app);

const port = process.env.PORT || 3900;
app.listen(port, () => (`Listening on port ${port}`));
