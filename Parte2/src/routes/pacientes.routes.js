const express = require('express');
const router = express.Router();
const pacientesController = require('../controllers/pacientes.controller');

/**
 * @openapi
 * components:
 *   schemas:
 *     Paciente:
 *       type: object
 *       properties:
 *         id:
 *           type: integer
 *           description: ID do paciente
 *         nome:
 *           type: string
 *           description: Nome do paciente
 *         idade:
 *           type: integer
 *           description: Idade do paciente
 *         telefone:
 *           type: string
 *           description: Telefone do paciente
 *       required:
 *         - nome
 *         - idade
 */

/**
 * @openapi
 * /pacientes:
 *   get:
 *     summary: Lista todos os pacientes
 *     responses:
 *       200:
 *         description: Lista de pacientes
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Paciente'
 *   post:
 *     summary: Cria um novo paciente
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Paciente'
 *     responses:
 *       201:
 *         description: Paciente criado com sucesso
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Paciente'
 *
 * /pacientes/{id}:
 *   get:
 *     summary: Obtém um paciente pelo ID
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: integer
 *         required: true
 *         description: ID do paciente
 *     responses:
 *       200:
 *         description: Paciente encontrado
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Paciente'
 *   put:
 *     summary: Atualiza um paciente pelo ID
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: integer
 *         required: true
 *         description: ID do paciente
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Paciente'
 *     responses:
 *       200:
 *         description: Paciente atualizado com sucesso
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Paciente'
 *   delete:
 *     summary: Apaga um paciente pelo ID
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: integer
 *         required: true
 *         description: ID do paciente
 *     responses:
 *       204:
 *         description: Paciente apagado com sucesso
 */

router.get('/', pacientesController.listar);
router.post('/', pacientesController.criar);
router.put('/:id', pacientesController.atualizar);
router.delete('/:id', pacientesController.apagar);

module.exports = router;
