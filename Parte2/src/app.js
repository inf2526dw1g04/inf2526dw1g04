require('dotenv').config();
const express = require('express');
const cors = require('cors');

const swaggerUi = require('swagger-ui-express');
const swaggerSpec = require('./swagger');

const app = express();
app.use(cors());
app.use(express.json());

// Swagger
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

app.use('/pacientes', require('./routes/pacientes.routes'));
app.use('/medicos', require('./routes/medicos.routes'));
app.use('/especialidades', require('./routes/especialidades.routes'));
app.use('/consultas', require('./routes/consultas.routes'));

app.get('/', (req, res) => {
  res.json({ mensagem: 'API 100%' });
});

module.exports = app;
