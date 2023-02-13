const { app } = require('./app');
const { dbConection } = require('./database');

async function main() {
    // Conectando a la base de datos
    await dbConection();
    // Iniciando el servidor
    await app.listen(4002);
}

main();