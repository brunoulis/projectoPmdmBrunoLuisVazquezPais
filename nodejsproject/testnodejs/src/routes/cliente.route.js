const { Router } = require('express');
const { consultarclientes, agregarclientes, modificarcliente, eliminarcliente} = require('../controllers/cliente.controller')
const router = Router();


router.get('/api/clientes', consultarclientes);
router.post('/api/clientes/add', agregarclientes);
router.delete('/api/clientes/delete/:id',eliminarcliente);
router.put('/api/clientes/mod', modificarcliente);



module.exports = router;