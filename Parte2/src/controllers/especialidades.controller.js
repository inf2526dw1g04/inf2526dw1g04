const db = require('../database/db');

// GET /especialidades
exports.listar = (req, res) => {
  const sql = 'SELECT * FROM especialidades';
  db.query(sql, (err, resultados) => {
    if (err) return res.status(500).json(err);
    res.json(resultados);
  });
};

// POST /especialidades
exports.criar = (req, res) => {
  const { nome, descricao } = req.body;
  const sql = `
    INSERT INTO especialidades (nome, descricao)
    VALUES (?, ?)
  `;
  db.query(sql, [nome, descricao], (err, resultado) => {
    if (err) return res.status(500).json(err);
    res.status(201).json({ mensagem: 'Especialidade criada', id: resultado.insertId });
  });
};
