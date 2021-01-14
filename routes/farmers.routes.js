const router = require("express").Router();
const connection = require("../database");

router.get("/", (req, res) => {
  const sql = "SELECT farmer_id FROM transactions JOIN farmers ON transactions";
  connection.query(sql, (err, result) => {
    if (err) {
      res.status(500).json({ errorMessage: err.message });
    } else {
      res.status(200).json(result);
    }
  });
});

module.exports = router;
