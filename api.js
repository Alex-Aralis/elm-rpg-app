let jsonServer = require('json-server');

let app = jsonServer.create();

app.use(jsonServer.defaults());

app.use(jsonServer.router('db.json'));

const PORT = 4000

console.log(`Listening on port ${PORT}.`);
app.listen(PORT);