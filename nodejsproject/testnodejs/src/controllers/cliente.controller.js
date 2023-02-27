const clienteService = require('../services/cliente.service');


const consultarClientes = async (req, res) => {
    res.json({clientes: await clienteService.consultarClientes()});
}

const guardarCliente = async (req, res) => {
    console.log(req.body);
    res.json({cliente: await clienteService.guardarCliente(req.body)});

}

module.exports = {consultarClientes, guardarCliente};