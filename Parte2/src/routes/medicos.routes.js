const express = require('express');
const router = express.Router();
const medicosController = require('../controllers/medicos.controller');

/**
 * @openapi
 * components:
 *   schemas:
 *     Medico:
 *       type: object
 *       properties:
 *         id:
 *           type: integer
 *         nome:
 *           type: string
 *         crm:
 *           type: string
 *         especialidade_id:
 *           type: integer
 *       required:
 *         - nome
 *         - crm
 *         - especialidade_id
 */

/**
 * @openapi
 * /medicos:
 *   get:
 *     summary: Faz uma lista de todos os médicos
 *     responses:
 *       200:
 *         description: Lista de médicos
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Medico'
 *   post:
 *     summary: Cria um novo médico
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Medico'
 *     responses:
 *       201:
 *         description: Médico criado com sucesso
 *
 * /medicos/{id}:
 *   put:
 *     summary: Atualiza um médico pelo ID
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: integer
 *         required: true
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Medico'
 *     responses:
 *       200:
 *         description: Médico atualizado
 *   delete:
 *     summary: Apaga um médico pelo ID
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: integer
 *         required: true
 *     responses:
 *       204:
 *         description: Médico apagado
 */

router.get('/', medicosController.listar);
router.post('/', medicosController.criar);
router.put('/:id', medicosController.atualizar);
router.delete('/:id', medicosController.apagar);

module.exports = router;
