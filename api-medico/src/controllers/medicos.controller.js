const db = require('../database/db');

// GET /medicos
exports.listar = (req, res) => {
  const sql = 'SELECT * FROM medicos';
  db.query(sql, (err, resultados) => {
    if (err) return res.status(500).json(err);
    res.json(resultados);
  });
};

// POST /medicos
exports.criar = (req, res) => {
  const { nome, telefone, email, especialidade_id } = req.body;
  const sql = `
    INSERT INTO medicos (nome, telefone, email, especialidade_id)
    VALUES (?, ?, ?, ?)
  `;
  db.query(sql, [nome, telefone, email, especialidade_id], (err, resultado) => {
    if (err) return res.status(500).json(err);
    res.status(201).json({ mensagem: 'Médico criado', id: resultado.insertId });
  });
};

// PUT /medicos/:id
exports.atualizar = (req, res) => {
  const { id } = req.params;
  const { nome, telefone, email, especialidade_id } = req.body;
  const sql = `
    UPDATE medicos
    SET nome = ?, telefone = ?, email = ?, especialidade_id = ?
    WHERE id = ?
  `;
  db.query(sql, [nome, telefone, email, especialidade_id, id], (err) => {
    if (err) return res.status(500).json(err);
    res.json({ mensagem: 'Médico atualizado' });
  });
};

// DELETE /medicos/:id
exports.apagar = (req, res) => {
  const { id } = req.params;
  const sql = 'DELETE FROM medicos WHERE id = ?';
  db.query(sql, [id], (err) => {
    if (err) return res.status(500).json(err);
    res.json({ mensagem: 'Médico removido' });
  });
};
