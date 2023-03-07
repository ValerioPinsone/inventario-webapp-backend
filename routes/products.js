var express = require('express');
var router = express.Router();
var cors = require('cors');
const mysql = require('mysql')
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'inventario'
})
connection.connect();

let products = [];

/* let products = [
    {
      id: 1,
      name: "Tubo Plastica",
      desc: "Tubo di plastica da 1.5m",
      quantity: 58,
    },
    {
      id: 2,
      name: "Bullone 30mm",
      desc: "Bullone da 30mm",
      quantity: 2,
    },
    {
      id: 3,
      name: "Guaina Doppio Strato",
      desc: "Guaina doppio strato da 1.5m",
      quantity: 3,
    },
    {
      id: 4,
      name: "Centralina 12V per cancelli",
      desc: "Centralina 12V per cancelli",
      quantity: 12,
    },
    {
      id: 5,
      name: "Cavo 2x1.5mm",
      desc: "Cavo 2x1.5mm",
      quantity: 78,
    },
    {
      id: 6,
      name: "Cavo 2x2.5mm",
      desc: "Cavo 2x2.5mm",
      quantity: 45,
    },
    {
      id: 7,
      name: "Cavo 2x4mm",
      desc: "Cavo 2x4mm",
      quantity: 1,
    },
    {
      id: 8,
      name: "Piattina 1x1",
      desc: "Piattina 1x1",
      quantity: 56,
    },
    {
      id: 9,
      name: "Piattina 1x2",
      desc: "Piattina 1x2",
      quantity: 34,
    },
    {
      id: 10,
      name: "Set Chiavi",
      desc: "Set Chiavi",
      quantity: 2,
    },
    {
      id: 11,
      name: "Cavo 2x6mm",
      desc: "Cavo 2x6mm",
      quantity: 12,
    },
    {
      id: 12,
      name: "Tubo PVC 50mm",
      desc: "Tubo PVC 50mm",
      quantity: 12,
    },
    {
      id: 13,
      name: "Tubo PVC 75mm",
      desc: "Tubo PVC 75mm",
      quantity: 0,
    },
    {
      id: 14,
      name: "Tubo PVC 100mm",
      desc: "Tubo PVC 100mm",
      quantity: 12,
    },
    {
      id: 15,
      name: "Plexiglass 1.5m",
      desc: "Plexiglass 1.5m",
      quantity: 12,
    },
    {
      id: 16,
      name: "Plexiglass 2m",
      desc: "Plexiglass 2m be",
      quantity: 12,
    }
  ];
 */
/* GET products listing. */
router.get('/', cors(), function(req, res, next) {
   
     

    connection.query('SELECT * FROM product ', (err, result, fields) => {
    if (err) throw err;

        console.log(result);
         products = JSON.stringify(result);
        products = JSON.parse(products);     
       
        res.json(products);
    }) 


});


router.get('/:filtro', cors(), function(req, res, next) {

    
    let filtro = req.params.filtro;
    connection.query('SELECT * FROM product WHERE product_name LIKE \"%'+filtro+'%\"', (err, result, fields) => {
    if (err) throw err;

        console.log(result);
        products = JSON.stringify(result);
        products = JSON.parse(products);    
       
        res.json(products);
    })


});

router.get('/setquantity/:id/:quantity', cors(), function(req, res, next) {
    let id = req.params.id;
    let quantity = req.params.quantity;
    connection.query('UPDATE product SET product_quantity = '+quantity+' WHERE product_id = '+id, (err, result, fields) => {
    if (err) throw err;

        console.log(result);
        products = JSON.stringify(result);
        products = JSON.parse(products);
        
        res.json(products);
    })
});

//post product
router.post('/', cors(), function(req, res, next) {
    let product = req.body;
    console.log(product);
    connection.query('INSERT INTO product (product_name, product_desc, product_quantity) VALUES ("'+product.name+'", "'+product.description+'", '+product.quantity+')', (err, result, fields) => {
    if (err) throw err;

        console.log(result);
        products = JSON.stringify(result);
        products = JSON.parse(products);

        res.json(products);

    })
});

//update product
router.put('/:id', cors(), function(req, res, next) {
    let id = req.params.id;
    let product = req.body;
    console.log(product);
    connection.query('UPDATE product SET product_name = "'+product.name+'", product_desc = "'+product.descriprion+'", product_quantity = '+product.quantity+' WHERE product_id = '+id, (err, result, fields) => {
    if (err) throw err;

        console.log(result);
        products = JSON.stringify(result);
        products = JSON.parse(products);
        
        res.json(products);
    })
});

//delete product
router.delete('/:id', cors(), function(req, res, next) {
    let id = req.params.id;
    connection.query('DELETE FROM product WHERE product_id = '+id, (err, result, fields) => {
    if (err) throw err;

        console.log(result);
        products = JSON.stringify(result);
        products = JSON.parse(products);

        res.json(products);
    })
});


module.exports = router;
