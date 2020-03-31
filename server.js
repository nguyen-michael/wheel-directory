const express = require("express");
const app = express();
const cors = require("cors");

require("dotenv").config();

app.use(cors);

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
    console.log(`Server up on port ${PORT}`);
})
