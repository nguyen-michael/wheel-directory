const express = require("express");
const cors = require("cors");
// const { pool } = require('./dbConfig.js');
const apiRoutes = require('./backend/apiRoutes');
require("dotenv").config();

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use("/api", apiRoutes);

// Change during dev to not conflict with react dev server
// const PORT = process.env.PORT || 8000;
const PORT = 8000;

app.listen(PORT, () => {
    console.log(`Server up on port ${PORT}`);
});
