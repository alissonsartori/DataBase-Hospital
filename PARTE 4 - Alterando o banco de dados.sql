SET SQL_SAFE_UPDATES = 0; -- Disable safe update mode for the current session

-- Adicionar a coluna 'em_atividade' à tabela medicos
ALTER TABLE medicos
ADD COLUMN em_atividade BOOLEAN DEFAULT TRUE;

-- Atualizar médicos como inativos e ativos
UPDATE medicos
SET em_atividade = FALSE
WHERE nome IN ('Dra. Ana Costa', 'Dra. Gabriela Lima');

UPDATE medicos
SET em_atividade = TRUE
WHERE nome NOT IN ('Dra. Ana Costa', 'Dra. Gabriela Lima');

SET SQL_SAFE_UPDATES = 1; -- Re-enable safe update mode
