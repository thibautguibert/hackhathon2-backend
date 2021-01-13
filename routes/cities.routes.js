const router = require("express").Router();
const connection = require("../database");

router.get("/", (req, res) => {
    const { lat1, long1, lat2, long2, clients_only } = req.query;
    let sql = `SELECT c.id, c.city, c.zipcode, c.lat, c.longitude, f.id AS farmer_id, f.farm_size, t.id AS transaction_id, t.product_id
            FROM cities AS c
            JOIN farmers AS  f ON f.city_id = c.id
            LEFT JOIN transactions AS t ON f.id=t.farmer_id
            WHERE c.lat >= ${lat1} AND c.lat < ${lat2} AND c.longitude >${long1} AND c.longitude < ${long2}
            ORDER BY c.id ASC`;
    connection.query(sql, (err, result) => {
        if (err) {
            res.status(500).json({ error: err.message })
        } else {
            const cities = [];
            let i = 0;
            // on transforme notre réponse en tableau de villes comportant un tableau de fermiers
            result.forEach((farmer, index) => {
                const { farmer_id, farm_size, transaction_id, product_id, ...city } = farmer;
                // si ville déjà dans notre tableau "cities", on rajoute le fermier à cette ville
                if (index > 0 && farmer.id === result[index - 1].id) {
                    let lastFarmerIndex = cities[i].farmers.length - 1;
                    // gestion de la query clients_only
                    if (clients_only) {
                        // si le fermier n'a pas déjà fait une transaction, on l'ajoute
                        if (transaction_id && farmer_id !== cities[i].farmers[lastFarmerIndex].id) {
                            cities[i].farmers.push({
                                id: farmer_id,
                                farm_size: farm_size,
                                client: transaction_id ? true : false
                            });
                        } else {
                            // le fermier a déjà fait une transaction
                            console.log("ajouter la seconde transaction du fermier")
                        }
                    } else {
                        // pas de query client_only : si le fermier a déjà fait une transaction
                        if (farmer_id !== cities[i].farmers[lastFarmerIndex].id) {
                            cities[i].farmers.push({
                                id: farmer_id,
                                farm_size: farm_size,
                                client: transaction_id ? true : false
                            });
                        }
                    }
                    // si ville n'est pas encore dans notre tableau "cities", on la crée
                } else {
                    if (clients_only) {
                        if (index > 0 && transaction_id) {
                            i++;
                            city.farmers = [
                                {
                                    id: farmer_id,
                                    farm_size: farm_size,
                                    client: transaction_id ? true : false,
                                    products: [product_id]
                                }
                            ];
                            cities.push(city);
                        } else if (transaction_id) {
                            city.farmers = [
                                {
                                    id: farmer_id,
                                    farm_size: farm_size,
                                    client: transaction_id ? true : false,
                                    products: [product_id]

                                }
                            ];
                            cities.push(city);
                        }
                    } else {
                        if (index > 0) {
                            i++;
                        }
                        city.farmers = [
                            {
                                id: farmer_id,
                                farm_size: farm_size,
                                client: transaction_id ? true : false
                            }
                        ];
                        cities.push(city);
                    }
                }
            });
            res.status(200).json(cities.length > 0 ? cities : result);
        }
    })
})

module.exports = router;