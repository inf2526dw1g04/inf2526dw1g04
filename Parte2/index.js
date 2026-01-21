const express = require('express');
const app = express();

// app.get('/consultas', (req, res) => {
//   res.json({ mensagem: 'Lista de consultas' });
// });

app.listen(3000, () => {
  console.log('API - porta 3000');
});
