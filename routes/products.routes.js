const router = require("express").Router();
const connection = require("../database");

router.get("/", (_, res) => {
  const sql = "SELECT * FROM products";
  connection.query(sql, (err, result) => {
    if (err) {
      res.status(500).json({ errorMessage: err.message });
    } else {
      res.status(200).json(result);
    }
  });
});

module.exports = router;
