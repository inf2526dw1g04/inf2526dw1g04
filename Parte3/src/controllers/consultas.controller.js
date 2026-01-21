const db = require('../database/db');

// GET /consultas
exports.listar = (req, res) => {
  const sql = 'SELECT * FROM consultas';
  db.query(sql, (err, resultados) => {
    if (err) return res.status(500).json(err);
    res.json(resultados);
  });
};

// POST /consultas
exports.criar = (req, res) => {
  const { data, hora, paciente_id, medico_id, observacoes } = req.body;
  const sql = `
    INSERT INTO consultas (data, hora, paciente_id, medico_id, observacoes)
    VALUES (?, ?, ?, ?, ?)
  `;
  db.query(sql, [data, hora, paciente_id, medico_id, observacoes], (err, resultado) => {
    if (err) return res.status(500).json(err);
    res.status(201).json({ mensagem: 'Consulta criada', id: resultado.insertId });
  });
};

// DELETE /consultas/:id
exports.apagar = (req, res) => {
  const { id } = req.params;
  const sql = 'DELETE FROM consultas WHERE id = ?';
  db.query(sql, [id], (err) => {
    if (err) return res.status(500).json(err);
    res.json({ mensagem: 'Consulta removida' });
  });
};
