const {Router} = require = require('express');
const {consultarClientes} = require = require('../controllers/cliente.controller');
const router = Router();

router.get('/api/clientes', consultarClientes);
router.post('/api/clientes/registro', guardarCliente);

module.exports = router;