const express = require("express");
const cors = require("cors");
const { inTestEnv, SERVER_PORT } = require("./env");

const app = express();
const router = require("./routes");

// pre-route middlewares
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// routes
app.use("/api", router);

// server setup
const server = app.listen(SERVER_PORT, () => {
  if (!inTestEnv) {
    console.log(`Server running on port ${SERVER_PORT}`);
  }
});

module.exports = server;
