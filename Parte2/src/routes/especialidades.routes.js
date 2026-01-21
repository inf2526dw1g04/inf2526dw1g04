const express = require('express');
const router = express.Router();
const especialidadesController = require('../controllers/especialidades.controller');

/**
 * @openapi
 * components:
 *   schemas:
 *     Especialidade:
 *       type: object
 *       properties:
 *         id:
 *           type: integer
 *         nome:
 *           type: string
 *       required:
 *         - nome
 */

/**
 * @openapi
 * /especialidades:
 *   get:
 *     summary: Faz uma lista de todas as especialidades
 *     responses:
 *       200:
 *         description: Faz uma lista das especialidades
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Especialidade'
 *   post:
 *     summary: Cria uma nova especialidade
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Especialidade'
 *     responses:
 *       201:
 *         description: Especialidade criada com sucesso
 */

router.get('/', especialidadesController.listar);
router.post('/', especialidadesController.criar);

module.exports = router;
