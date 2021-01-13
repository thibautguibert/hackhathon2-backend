const express = require("express");
require("dotenv").config();
const { inTestEnv, SERVER_PORT, CLIENT_URL } = require('./env');
const app = express();
const cors = require("cors");

//pre-route middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors({
    origin: CLIENT_URL,
    optionsSucessStatus: 200
}))

const mainRoutes = require("./routes");
app.use("/api", mainRoutes);

app.get('/', (req, res) => {
    res.send('Hello World!')
});

app.listen(SERVER_PORT, () => {
    if (!inTestEnv) {
        console.log(`Server running on port ${SERVER_PORT}!`)
    }
})