const router = require("express").Router();
const exampleRoutes = require("./example.routes");
const citiesRoutes = require("./cities.routes");

router.use("/example", exampleRoutes);
router.use("/cities", citiesRoutes);



module.exports = router;