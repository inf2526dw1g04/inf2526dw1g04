const express = require('express');
const router = express.Router();
const consultasController = require('../controllers/consultas.controller');

/**
 * @openapi
 * components:
 *   schemas:
 *     Consulta:
 *       type: object
 *       properties:
 *         id:
 *           type: integer
 *         paciente_id:
 *           type: integer
 *         medico_id:
 *           type: integer
 *         data:
 *           type: string
 *           format: date-time
 *       required:
 *         - paciente_id
 *         - medico_id
 *         - data
 */

/**
 * @openapi
 * /consultas:
 *   get:
 *     summary: Faz uma lista de todas as consultas
 *     responses:
 *       200:
 *         description: Lista de consultas
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Consulta'
 *   post:
 *     summary: Cria uma nova consulta
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Consulta'
 *     responses:
 *       201:
 *         description: Consulta criada com sucesso
 *
 * /consultas/{id}:
 *   delete:
 *     summary: Apaga uma consulta pelo ID
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: integer
 *         required: true
 *     responses:
 *       204:
 *         description: Consulta apagada com sucesso
 */

router.get('/', consultasController.listar);
router.post('/', consultasController.criar);
router.delete('/:id', consultasController.apagar);

module.exports = router;
