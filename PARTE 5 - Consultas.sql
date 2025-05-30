-- Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.
SELECT
  c.*,
  AVG(c.valor) OVER () AS valor_medio_2020_convenio
FROM consultas AS c
WHERE
  EXTRACT(YEAR FROM c.data_hora) = 2020 AND c.convenio_id IS NOT NULL;

---

-- Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.
SELECT
  *
FROM internacoes
WHERE
  data_efetiva_alta > data_prevista_alta;

---

-- Receituário completo da primeira consulta registrada com receituário associado.
SELECT
  r.*
FROM receitas AS r
WHERE
  r.consulta_id = (
    SELECT
      MIN(id)
    FROM consultas
    WHERE
      id IN (
        SELECT DISTINCT
          consulta_id
        FROM receitas
      )
  );

---

-- Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).
(
  SELECT
    *
  FROM consultas
  WHERE
    convenio_id IS NULL
  ORDER BY
    valor DESC
  LIMIT 1
)
UNION ALL
(
  SELECT
    *
  FROM consultas
  WHERE
    convenio_id IS NULL
  ORDER BY
    valor ASC
  LIMIT 1
);

---

-- Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.
SELECT
  i.*,
  q.numero AS numero_quarto,
  q.tipo AS tipo_quarto,
  q.valor_diario,
  DATEDIFF(i.data_efetiva_alta, i.data_entrada) AS dias_internacao,
  (
    DATEDIFF(i.data_efetiva_alta, i.data_entrada) * q.valor_diario
  ) AS valor_total_internacao
FROM internacoes AS i
JOIN quartos AS q
  ON i.quarto_id = q.id
WHERE
  i.data_efetiva_alta IS NOT NULL;

---

-- Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.
SELECT
  i.data_entrada,
  i.descricao_procedimentos,
  q.numero AS numero_quarto
FROM internacoes AS i
JOIN quartos AS q
  ON i.quarto_id = q.id
WHERE
  q.tipo = 'apartamento';

---

-- Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.
SELECT
  p.nome AS nome_paciente,
  c.data_hora AS data_consulta,
  e.nome AS especialidade
FROM consultas AS c
JOIN pacientes AS p
  ON c.paciente_id = p.id
JOIN especialidades AS e
  ON c.especialidade_id = e.id
WHERE
  TIMESTAMPDIFF(YEAR, p.data_nascimento, c.data_hora) < 18 AND e.nome <> 'Pediatria'
ORDER BY
  c.data_hora;

---

-- Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.
SELECT
  p.nome AS nome_paciente,
  m.nome AS nome_medico,
  i.data_entrada AS data_internacao,
  i.descricao_procedimentos AS procedimentos
FROM internacoes AS i
JOIN pacientes AS p
  ON i.paciente_id = p.id
JOIN medicos AS m
  ON i.medico_id = m.id
JOIN medicos_especialidades AS me
  ON m.id = me.medico_id
JOIN especialidades AS esp
  ON me.especialidade_id = esp.id
JOIN quartos AS q
  ON i.quarto_id = q.id
WHERE
  esp.nome = 'Gastrenterologia' AND q.tipo = 'enfermaria';

---

-- Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.
-- Note: A tabela `medicos` no DDL fornecido não possui uma coluna para CRM.
-- Assumindo que 'CRM' pode ser representado pelo nome do médico ou uma coluna fictícia para este propósito.
-- Para o propósito deste script, vou usar o nome do médico no lugar de CRM, ou você pode adicionar uma coluna CRM à tabela 'medicos'.
SELECT
  m.nome AS nome_medico,
  -- m.crm AS crm_medico, -- Descomente se adicionar a coluna CRM
  COUNT(c.id) AS quantidade_consultas
FROM medicos AS m
LEFT JOIN consultas AS c
  ON m.id = c.medico_id
GROUP BY
  m.id,
  m.nome;

---

-- Todos os médicos que tenham "Gabriel" no nome.
SELECT
  *
FROM medicos
WHERE
  nome LIKE '%Gabriel%';

---

-- Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.
SELECT
  e.nome AS nome_enfermeiro,
  e.coren AS coren_enfermeiro,
  COUNT(ie.internacao_id) AS numero_internacoes
FROM enfermeiros AS e
JOIN internacoes_enfermeiros AS ie
  ON e.id = ie.enfermeiro_id
GROUP BY
  e.id,
  e.nome,
  e.coren
HAVING
  COUNT(ie.internacao_id) > 1;
