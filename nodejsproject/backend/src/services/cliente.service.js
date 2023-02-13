const clienteModel = require('../models/cliente.model');

class ClienteService{
    ClienteService() {}
    async consultarClientes(){
        try{
            return await clienteModel.find();
        }catch(error){
            return error;
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

    async eliminarCliente(id){
        console.log(id);
        var clienteEliminado;
        try{
            await clienteModel.findOneAndRemove({_id: idc}).then((value)=>{
                clienteEliminado = value;
            });
        }catch(error){
            console.log(error);
        }
    }

    async modificarCliente(newCliente){
        var clienteModificado;
        try{
            await clienteModel.findOneAndUpdate({_id: newCliente._id}, newCliente).then((value)=>{
                clienteModificado = value;
        });
        return clienteModificado;
        }catch(error){
            console.log(error);
        }

    }

}

module.exports = new ClienteService();