const mongoose= require('mongoose');
const dbConection= async() =>{
    try{
        console.log('Conectando DB.........');
        // Creamos la conexion a la base de datos mongodb con contraseña y usuario root
        await mongoose.connect('mongodb://root:root@127.0.0.1:27017/servicio', {
            useCreateIndex: true,
            useFindAndModify: false,
            useNewUrlParser: true,
            useUnifiedTopology: true
        });
        console.log('Conectado a DB');
    }catch (error){
        throw new Error(error);
    }

    

}
module.exports= {
    dbConection
}