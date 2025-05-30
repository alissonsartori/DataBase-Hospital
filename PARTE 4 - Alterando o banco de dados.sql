-- Adicionar a coluna 'em_atividade' à tabela medicos
ALTER TABLE medicos
ADD COLUMN em_atividade BOOLEAN DEFAULT TRUE;

---

-- Atualizar médicos como inativos e ativos
UPDATE medicos
SET em_atividade = FALSE
WHERE nome IN ('Dra. Ana Costa', 'Dra. Gabriela Lima'); -- Dois médicos inativos

UPDATE medicos
SET em_atividade = TRUE
WHERE nome NOT IN ('Dra. Ana Costa', 'Dra. Gabriela Lima'); -- Os demais em atividade
