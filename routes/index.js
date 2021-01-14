const router = require("express").Router();
const productsRoutes = require("./products.routes");
const farmersRoutes = require("./farmers.routes");

router.use("/products", productsRoutes);
router.use("/farmers", farmersRoutes);

module.exports = router;
