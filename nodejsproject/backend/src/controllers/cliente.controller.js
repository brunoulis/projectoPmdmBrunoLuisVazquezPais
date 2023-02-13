const ClienteService = require('../services/cliente.service');


const consultarClientes = async (req, res) => {
    res.json({clientes: await ClienteService.consultarClientes()});
}

const guardarCliente = async (req, res) => {
    console.log(req.body);
    res.json({cliente: await ClienteService.guardarCliente(req.body)});

}

const eliminarCliente = async (req, res) => {
    res.json({cliente: await ClienteService.eliminarCliente(req.params.id)});
}

const modificarCliente = async (req, res) => {
    res.json({cliente: await ClienteService.modificarCliente(req.body)});
}

module.exports = {consultarClientes,guardarCliente, eliminarCliente, modificarCliente};