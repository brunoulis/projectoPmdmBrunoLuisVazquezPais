const mongoose= require('mongoose');
const dbConection= async() =>{
    try{
        console.log('Conectando DB.........');
        await mongoose.connect('mongodb://localhost/myDataBase', {
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