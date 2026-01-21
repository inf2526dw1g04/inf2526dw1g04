const swaggerJsdoc = require('swagger-jsdoc');

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'API - Clínica Médica',
      version: '1.0.0',
      description: 'API REST de gestão para uma clínica médica',
    },
    servers: [
      { url: 'http://localhost:3000' }
    ]
  },
  apis: [__dirname + '/routes/**/*.js']
};

const swaggerSpec = swaggerJsdoc(options);

module.exports = swaggerSpec;
