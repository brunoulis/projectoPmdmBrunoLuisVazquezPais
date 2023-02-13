const clienteModel = require('../models/cliente.model');

class ClienteService{
    ClienteService() {}
    async consultarClientes(){
        try{
            return await clienteModel.find();
        }catch(error){
            throw new Error(error);
        }
    }

    async guardarCliente(cliente = new clienteModel()){
        try{
            var clienteGuardado;
            await clienteModel.create(cliente).then((value)=>{
                clienteGuardado = value;
            }); 
            return clienteGuardado;
        }catch(error){
            console.log(error);
        }
    }

}

module.exports = new ClienteService();