const { app } = require('./app');
const { dbConection } = require('./database');

async function main() {
    await dbConection();
    await app.listen(3000);
    
}

main();