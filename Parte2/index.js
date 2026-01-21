const express = require('express');
const cors = require('cors');
const swaggerUi = require('swagger-ui-express');
const swaggerSpec = require('./src/swagger');
const pacientesRoutes = require('./src/routes/pacientes.routes');
const medicosRoutes = require('./src/routes/medicos.routes');
const especialidadesRoutes = require('./src/routes/especialidades.routes');
const consultasRoutes = require('./src/routes/consultas.routes');


const app = express();
app.use(cors());
app.use(express.json());

// Rotas
app.use('/pacientes', pacientesRoutes);
app.use('/medicos', medicosRoutes);
app.use('/especialidades', especialidadesRoutes);
app.use('/consultas', consultasRoutes);


// Rota raiz
app.get('/', (req, res) => {
  res.json({ mensagem: 'API 100%' });
});

// Swagger
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`API na porta ${PORT}`);
  console.log(`Swagger disponível em http://localhost:${PORT}/api-docs`);
});
