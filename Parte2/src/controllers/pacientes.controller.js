const db = require('../database/db');

// GET /pacientes
exports.listar = (req, res) => {
  let sql = 'SELECT * FROM pacientes';
  const params = [];
  const filtros = [];

  if (req.query.idade) {
    filtros.push('idade = ?');
    params.push(req.query.idade);
  }
  if (req.query.nome) {
    filtros.push('nome LIKE ?');
    params.push(`%${req.query.nome}%`);
  }

  if (filtros.length > 0) {
    sql += ' WHERE ' + filtros.join(' AND ');
  }

  db.query(sql, params, (err, resultados) => {
    if (err) return res.status(500).json(err);
    res.json(resultados);
  });
};


// POST /pacientes
exports.criar = (req, res) => {
  const { nome, data_nascimento, sexo, telefone, email } = req.body;
  const sql = `
    INSERT INTO pacientes (nome, data_nascimento, sexo, telefone, email)
    VALUES (?, ?, ?, ?, ?)
  `;
  db.query(sql, [nome, data_nascimento, sexo, telefone, email], (err, resultado) => {
    if (err) return res.status(500).json(err);
    res.status(201).json({ mensagem: 'Paciente criado', id: resultado.insertId });
  });
};

// PUT /pacientes/:id
exports.atualizar = (req, res) => {
  const { id } = req.params;
  const { nome, data_nascimento, sexo, telefone, email } = req.body;
  const sql = `
    UPDATE pacientes
    SET nome = ?, data_nascimento = ?, sexo = ?, telefone = ?, email = ?
    WHERE id = ?
  `;
  db.query(sql, [nome, data_nascimento, sexo, telefone, email, id], (err) => {
    if (err) return res.status(500).json(err);
    res.json({ mensagem: 'Paciente atualizado' });
  });
};

// DELETE /pacientes/:id
exports.apagar = (req, res) => {
  const { id } = req.params;
  const sql = 'DELETE FROM pacientes WHERE id = ?';
  db.query(sql, [id], (err) => {
    if (err) return res.status(500).json(err);
    res.json({ mensagem: 'Paciente removido' });
  });
};


