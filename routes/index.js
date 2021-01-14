const router = require("express").Router();
const productsRoutes = require("./products.routes");
const farmersRoutes = require("./farmers.routes");

router.use("/products", productsRoutes);
router.use("/farmers", farmersRoutes);
const exampleRoutes = require("./example.routes");
const citiesRoutes = require("./cities.routes");

router.use("/example", exampleRoutes);
router.use("/cities", citiesRoutes);

module.exports = router;
