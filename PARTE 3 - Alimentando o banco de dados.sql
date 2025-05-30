-- Povoamento da Tabela de Especialidades
INSERT INTO especialidades (nome) VALUES
('Pediatria'),
('Clínica Geral'),
('Gastrenterologia'),
('Dermatologia'),
('Cardiologia'),
('Ortopedia'),
('Oftalmologia');

---

-- Povoamento da Tabela de Médicos
INSERT INTO medicos (nome, tipo) VALUES
('Dr. João Silva', 'especialista'),          -- Pediatria
('Dra. Maria Oliveira', 'generalista'),
('Dr. Pedro Souza', 'especialista'),         -- Gastrenterologia
('Dra. Ana Costa', 'residente'),
('Dr. Carlos Pereira', 'especialista'),       -- Dermatologia
('Dra. Sofia Mendes', 'especialista'),       -- Cardiologia
('Dr. Ricardo Santos', 'generalista'),
('Dra. Laura Almeida', 'especialista'),      -- Ortopedia
('Dr. Fernando Rocha', 'especialista'),      -- Oftalmologia
('Dra. Gabriela Lima', 'residente');

---

-- Povoamento da Tabela de Relacionamento Médico-Especialidade
INSERT INTO medicos_especialidades (medico_id, especialidade_id) VALUES
((SELECT id FROM medicos WHERE nome = 'Dr. João Silva'), (SELECT id FROM especialidades WHERE nome = 'Pediatria')),
((SELECT id FROM medicos WHERE nome = 'Dra. Maria Oliveira'), (SELECT id FROM especialidades WHERE nome = 'Clínica Geral')),
((SELECT id FROM medicos WHERE nome = 'Dr. Pedro Souza'), (SELECT id FROM especialidades WHERE nome = 'Gastrenterologia')),
((SELECT id FROM medicos WHERE nome = 'Dra. Ana Costa'), (SELECT id FROM especialidades WHERE nome = 'Clínica Geral')), -- Residente em Clínica Geral
((SELECT id FROM medicos WHERE nome = 'Dr. Carlos Pereira'), (SELECT id FROM especialidades WHERE nome = 'Dermatologia')),
((SELECT id FROM medicos WHERE nome = 'Dra. Sofia Mendes'), (SELECT id FROM especialidades WHERE nome = 'Cardiologia')),
((SELECT id FROM medicos WHERE nome = 'Dr. Ricardo Santos'), (SELECT id FROM especialidades WHERE nome = 'Clínica Geral')),
((SELECT id FROM medicos WHERE nome = 'Dra. Laura Almeida'), (SELECT id FROM especialidades WHERE nome = 'Ortopedia')),
((SELECT id FROM medicos WHERE nome = 'Dr. Fernando Rocha'), (SELECT id FROM especialidades WHERE nome = 'Oftalmologia')),
((SELECT id FROM medicos WHERE nome = 'Dra. Gabriela Lima'), (SELECT id FROM especialidades WHERE nome = 'Pediatria')); -- Residente em Pediatria

---

-- Povoamento da Tabela de Pacientes
INSERT INTO pacientes (nome, data_nascimento, endereco, telefone, email, cpf, rg) VALUES
('Mariana Ferreira', '1990-05-15', 'Rua das Flores, 123', '11987654321', 'mariana.f@email.com', '123.456.789-00', '11.222.333-4'),
('Lucas Mendes', '1985-11-20', 'Av. Central, 456', '11998765432', 'lucas.m@email.com', '987.654.321-00', '55.666.777-8'),
('Isabela Santos', '1978-03-01', 'Rua da Paz, 789', '11976543210', 'isabela.s@email.com', '456.789.123-00', '22.333.444-5'),
('Gabriel Oliveira', '2000-07-22', 'Travessa Alegria, 101', '11965432109', 'gabriel.o@email.com', '321.654.987-00', '66.777.888-9'),
('Camila Lima', '1993-01-10', 'Alameda dos Sonhos, 202', '11954321098', 'camila.l@email.com', '789.123.456-00', '33.444.555-6'),
('Rafael Costa', '1965-09-03', 'Rua do Sol, 303', '11943210987', 'rafael.c@email.com', '012.345.678-00', '77.888.999-0'),
('Julia Pereira', '2005-12-08', 'Av. da Liberdade, 404', '11932109876', 'julia.p@email.com', '109.876.543-00', '44.555.666-7'),
('Daniel Rodrigues', '1980-02-29', 'Praça da Matriz, 505', '11921098765', 'daniel.r@email.com', '654.321.098-00', '88.999.000-1'),
('Larissa Martins', '1997-06-18', 'Estrada Velha, 606', '11910987654', 'larissa.m@email.com', '111.222.333-44', '99.000.111-2'),
('Thiago Fernandes', '1972-04-25', 'Rua Nova, 707', '11909876543', 'thiago.f@email.com', '555.666.777-88', '10.111.222-3'),
('Amanda Gomes', '1988-10-02', 'Av. Principal, 808', '11900112233', 'amanda.g@email.com', '222.333.444-55', '12.345.678-9'),
('Bruno Dias', '1995-03-12', 'Rua Secundária, 909', '11911223344', 'bruno.d@email.com', '666.777.888-99', '13.456.789-0'),
('Carolina Nogueira', '1970-08-07', 'Travessa Escondida, 111', '11922334455', 'carolina.n@email.com', '999.000.111-22', '14.567.890-1'),
('Felipe Viana', '2001-01-28', 'Rua Larga, 222', '11933445566', 'felipe.v@email.com', '333.444.555-66', '15.678.901-2'),
('Giovanna Brito', '1982-05-09', 'Alameda Estreita, 333', '11944556677', 'giovanna.b@email.com', '777.888.999-00', '16.789.012-3');

---

-- Povoamento da Tabela de Convênios
INSERT INTO convenios (nome, cnpj, tempo_carencia) VALUES
('Saúde Feliz', '00.000.000/0001-01', 30),
('Bem Estar Saúde', '01.011.111/0001-02', 60),
('Vida Plena Convênios', '02.222.222/0001-03', 90),
('União Saúde', '03.333.333/0001-04', 120);

---

-- Povoamento da Tabela de Pacientes_Convênios
INSERT INTO pacientes_convenios (paciente_id, convenio_id) VALUES
((SELECT id FROM pacientes WHERE nome = 'Mariana Ferreira'), (SELECT id FROM convenios WHERE nome = 'Saúde Feliz')),
((SELECT id FROM pacientes WHERE nome = 'Lucas Mendes'), (SELECT id FROM convenios WHERE nome = 'Bem Estar Saúde')),
((SELECT id FROM pacientes WHERE nome = 'Isabela Santos'), (SELECT id FROM convenios WHERE nome = 'Vida Plena Convênios')),
((SELECT id FROM pacientes WHERE nome = 'Gabriel Oliveira'), (SELECT id FROM convenios WHERE nome = 'Saúde Feliz')),
((SELECT id FROM pacientes WHERE nome = 'Camila Lima'), (SELECT id FROM convenios WHERE nome = 'União Saúde')),
((SELECT id FROM pacientes WHERE nome = 'Rafael Costa'), (SELECT id FROM convenios WHERE nome = 'Bem Estar Saúde')),
((SELECT id FROM pacientes WHERE nome = 'Julia Pereira'), (SELECT id FROM convenios WHERE nome = 'Vida Plena Convênios'));

---

-- Povoamento da Tabela de Consultas
INSERT INTO consultas (data_hora, medico_id, paciente_id, especialidade_id, valor, convenio_id, numero_carteira) VALUES
('2015-02-10 10:00:00', (SELECT id FROM medicos WHERE nome = 'Dr. João Silva'), (SELECT id FROM pacientes WHERE nome = 'Mariana Ferreira'), (SELECT id FROM especialidades WHERE nome = 'Pediatria'), 150.00, (SELECT id FROM convenios WHERE nome = 'Saúde Feliz'), 'SF12345'),
('2015-03-15 14:30:00', (SELECT id FROM medicos WHERE nome = 'Dra. Maria Oliveira'), (SELECT id FROM pacientes WHERE nome = 'Lucas Mendes'), (SELECT id FROM especialidades WHERE nome = 'Clínica Geral'), 180.00, (SELECT id FROM convenios WHERE nome = 'Bem Estar Saúde'), 'BE67890'),
('2016-01-20 09:00:00', (SELECT id FROM medicos WHERE nome = 'Dr. Pedro Souza'), (SELECT id FROM pacientes WHERE nome = 'Isabela Santos'), (SELECT id FROM especialidades WHERE nome = 'Gastrenterologia'), 250.00, (SELECT id FROM convenios WHERE nome = 'Vida Plena Convênios'), 'VP11223'),
('2016-04-05 11:00:00', (SELECT id FROM medicos WHERE nome = 'Dra. Ana Costa'), (SELECT id FROM pacientes WHERE nome = 'Gabriel Oliveira'), (SELECT id FROM especialidades WHERE nome = 'Clínica Geral'), 100.00, (SELECT id FROM convenios WHERE nome = 'Saúde Feliz'), 'SF98765'),
('2017-06-12 16:00:00', (SELECT id FROM medicos WHERE nome = 'Dr. Carlos Pereira'), (SELECT id FROM pacientes WHERE nome = 'Camila Lima'), (SELECT id FROM especialidades WHERE nome = 'Dermatologia'), 200.00, (SELECT id FROM convenios WHERE nome = 'União Saúde'), 'US45678'),
('2017-08-01 10:30:00', (SELECT id FROM medicos WHERE nome = 'Dra. Sofia Mendes'), (SELECT id FROM pacientes WHERE nome = 'Rafael Costa'), (SELECT id FROM especialidades WHERE nome = 'Cardiologia'), 280.00, (SELECT id FROM convenios WHERE nome = 'Bem Estar Saúde'), 'BE13579'),
('2018-01-05 13:00:00', (SELECT id FROM medicos WHERE nome = 'Dr. Ricardo Santos'), (SELECT id FROM pacientes WHERE nome = 'Julia Pereira'), (SELECT id FROM especialidades WHERE nome = 'Clínica Geral'), 170.00, (SELECT id FROM convenios WHERE nome = 'Vida Plena Convênios'), 'VP24680'),
('2018-03-20 08:00:00', (SELECT id FROM medicos WHERE nome = 'Dra. Laura Almeida'), (SELECT id FROM pacientes WHERE nome = 'Daniel Rodrigues'), (SELECT id FROM especialidades WHERE nome = 'Ortopedia'), 220.00, NULL, NULL),
('2019-05-25 15:00:00', (SELECT id FROM medicos WHERE nome = 'Dr. Fernando Rocha'), (SELECT id FROM pacientes WHERE nome = 'Larissa Martins'), (SELECT id FROM especialidades WHERE nome = 'Oftalmologia'), 230.00, NULL, NULL),
('2019-07-30 09:30:00', (SELECT id FROM medicos WHERE nome = 'Dra. Gabriela Lima'), (SELECT id FROM pacientes WHERE nome = 'Thiago Fernandes'), (SELECT id FROM especialidades WHERE nome = 'Pediatria'), 140.00, NULL, NULL),
('2020-02-18 11:00:00', (SELECT id FROM medicos WHERE nome = 'Dr. João Silva'), (SELECT id FROM pacientes WHERE nome = 'Mariana Ferreira'), (SELECT id FROM especialidades WHERE nome = 'Pediatria'), 160.00, (SELECT id FROM convenios WHERE nome = 'Saúde Feliz'), 'SF12345'), -- Mariana segunda consulta
('2020-04-22 14:00:00', (SELECT id FROM medicos WHERE nome = 'Dra. Maria Oliveira'), (SELECT id FROM pacientes WHERE nome = 'Amanda Gomes'), (SELECT id FROM especialidades WHERE nome = 'Clínica Geral'), 190.00, NULL, NULL),
('2020-06-01 10:00:00', (SELECT id FROM medicos WHERE nome = 'Dr. Pedro Souza'), (SELECT id FROM pacientes WHERE nome = 'Bruno Dias'), (SELECT id FROM especialidades WHERE nome = 'Gastrenterologia'), 260.00, NULL, NULL),
('2021-01-10 16:00:00', (SELECT id FROM medicos WHERE nome = 'Dr. Carlos Pereira'), (SELECT id FROM pacientes WHERE nome = 'Carolina Nogueira'), (SELECT id FROM especialidades WHERE nome = 'Dermatologia'), 210.00, NULL, NULL),
('2021-03-05 09:00:00', (SELECT id FROM medicos WHERE nome = 'Dra. Sofia Mendes'), (SELECT id FROM pacientes WHERE nome = 'Felipe Viana'), (SELECT id FROM especialidades WHERE nome = 'Cardiologia'), 290.00, NULL, NULL),
('2021-05-15 12:00:00', (SELECT id FROM medicos WHERE nome = 'Dr. Ricardo Santos'), (SELECT id FROM pacientes WHERE nome = 'Giovanna Brito'), (SELECT id FROM especialidades WHERE nome = 'Clínica Geral'), 180.00, NULL, NULL),
('2021-07-20 14:30:00', (SELECT id FROM medicos WHERE nome = 'Dra. Laura Almeida'), (SELECT id FROM pacientes WHERE nome = 'Lucas Mendes'), (SELECT id FROM especialidades WHERE nome = 'Ortopedia'), 230.00, (SELECT id FROM convenios WHERE nome = 'Bem Estar Saúde'), 'BE67890'), -- Lucas segunda consulta
('2021-09-01 11:00:00', (SELECT id FROM medicos WHERE nome = 'Dr. Fernando Rocha'), (SELECT id FROM pacientes WHERE nome = 'Isabela Santos'), (SELECT id FROM especialidades WHERE nome = 'Oftalmologia'), 240.00, (SELECT id FROM convenios WHERE nome = 'Vida Plena Convênios'), 'VP11223'), -- Isabela segunda consulta
('2022-01-01 10:00:00', (SELECT id FROM medicos WHERE nome = 'Dr. João Silva'), (SELECT id FROM pacientes WHERE nome = 'Julia Pereira'), (SELECT id FROM especialidades WHERE nome = 'Pediatria'), 155.00, (SELECT id FROM convenios WHERE nome = 'Vida Plena Convênios'), 'VP24680'), -- Julia segunda consulta
('2022-01-01 10:30:00', (SELECT id FROM medicos WHERE nome = 'Dra. Maria Oliveira'), (SELECT id FROM pacientes WHERE nome = 'Daniel Rodrigues'), (SELECT id FROM especialidades WHERE nome = 'Clínica Geral'), 185.00, NULL, NULL); -- Daniel segunda consulta

---

-- Povoamento da Tabela de Receitas
INSERT INTO receitas (consulta_id, medicamento, quantidade, instrucoes) VALUES
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Mariana Ferreira') AND data_hora = '2015-02-10 10:00:00'), 'Amoxicilina', 1, 'Tomar 1 comprimido a cada 8 horas por 7 dias.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Mariana Ferreira') AND data_hora = '2015-02-10 10:00:00'), 'Dipirona', 1, 'Tomar 1 comprimido a cada 6 horas, se dor.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Lucas Mendes') AND data_hora = '2015-03-15 14:30:00'), 'Ibuprofeno', 1, 'Tomar 1 comprimido a cada 12 horas.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Isabela Santos') AND data_hora = '2016-01-20 09:00:00'), 'Omeprazol', 1, 'Tomar 1 cápsula antes do café da manhã.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Gabriel Oliveira') AND data_hora = '2016-04-05 11:00:00'), 'Paracetamol', 1, 'Tomar 1 comprimido a cada 6 horas, se febre.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Camila Lima') AND data_hora = '2017-06-12 16:00:00'), 'Creme de Hidrocortisona', 1, 'Aplicar na área afetada 2 vezes ao dia.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Rafael Costa') AND data_hora = '2017-08-01 10:30:00'), 'Atenolol', 1, 'Tomar 1 comprimido pela manhã.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Rafael Costa') AND data_hora = '2017-08-01 10:30:00'), ' AAS', 1, 'Tomar 1 comprimido após o jantar.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Julia Pereira') AND data_hora = '2018-01-05 13:00:00'), 'Vitamina C', 1, 'Tomar 1 comprimido efervescente ao dia.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Daniel Rodrigues') AND data_hora = '2018-03-20 08:00:00'), 'Diclofenaco', 1, 'Aplicar gel na área dolorida 3 vezes ao dia.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Larissa Martins') AND data_hora = '2019-05-25 15:00:00'), 'Colírio Lacrima', 1, 'Aplicar 2 gotas em cada olho, 3 vezes ao dia.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Thiago Fernandes') AND data_hora = '2019-07-30 09:30:00'), 'Xarope para tosse', 1, 'Tomar 10ml, 3 vezes ao dia.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Thiago Fernandes') AND data_hora = '2019-07-30 09:30:00'), 'Pastilha para garganta', 1, 'Chupar uma pastilha a cada 4 horas.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Mariana Ferreira') AND data_hora = '2020-02-18 11:00:00'), 'Prednisolona', 1, 'Tomar 1 comprimido pela manhã por 5 dias.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Mariana Ferreira') AND data_hora = '2020-02-18 11:00:00'), 'Cloridrato de Pseudoefedrina', 1, 'Tomar 1 comprimido a cada 12 horas.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Amanda Gomes') AND data_hora = '2020-04-22 14:00:00'), 'Simeticona', 1, 'Tomar 1 comprimido após as refeições.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Amanda Gomes') AND data_hora = '2020-04-22 14:00:00'), 'Metoclopramida', 1, 'Tomar 1 comprimido 30 minutos antes das refeições.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Bruno Dias') AND data_hora = '2020-06-01 10:00:00'), 'Pantoprazol', 1, 'Tomar 1 comprimido pela manhã, em jejum.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Bruno Dias') AND data_hora = '2020-06-01 10:00:00'), 'Domperidona', 1, 'Tomar 1 comprimido 15 minutos antes das refeições.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Carolina Nogueira') AND data_hora = '2021-01-10 16:00:00'), 'Retinol', 1, 'Aplicar creme noturno no rosto.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Carolina Nogueira') AND data_hora = '2021-01-10 16:00:00'), 'Protetor Solar FPS 60', 1, 'Aplicar diariamente pela manhã.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Felipe Viana') AND data_hora = '2021-03-05 09:00:00'), 'Losartana', 1, 'Tomar 1 comprimido ao dia.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Felipe Viana') AND data_hora = '2021-03-05 09:00:00'), 'Hidroclorotiazida', 1, 'Tomar 1 comprimido pela manhã.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Giovanna Brito') AND data_hora = '2021-05-15 12:00:00'), 'Analgesico', 1, 'Tomar conforme necessidade.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Lucas Mendes') AND data_hora = '2021-07-20 14:30:00'), 'Relaxante muscular', 1, 'Tomar 1 comprimido antes de dormir.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Lucas Mendes') AND data_hora = '2021-07-20 14:30:00'), 'Pomada anti-inflamatória', 1, 'Aplicar na área afetada 2 vezes ao dia.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Isabela Santos') AND data_hora = '2021-09-01 11:00:00'), 'Lentes corretivas', 1, 'Usar conforme orientação médica.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Isabela Santos') AND data_hora = '2021-09-01 11:00:00'), 'Solução para lentes', 1, 'Utilizar para limpeza e armazenamento.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Julia Pereira') AND data_hora = '2022-01-01 10:00:00'), 'Multivitaminico infantil', 1, 'Tomar 5ml ao dia.'),
((SELECT id FROM consultas WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Daniel Rodrigues') AND data_hora = '2022-01-01 10:30:00'), 'Anti-histamínico', 1, 'Tomar 1 comprimido à noite.');

---

-- Povoamento da Tabela de Quartos
INSERT INTO quartos (numero, tipo, valor_diario) VALUES
(101, 'apartamento', 500.00),
(102, 'apartamento', 500.00),
(201, 'quarto duplo', 300.00),
(202, 'quarto duplo', 300.00),
(301, 'enfermaria', 150.00),
(302, 'enfermaria', 150.00);

---

-- Povoamento da Tabela de Enfermeiros
INSERT INTO enfermeiros (nome, cpf, coren) VALUES
('Enf. Joana Darc', '012.345.678-90', 'COREN-SP-123456'),
('Enf. Rafael Castro', '987.654.321-09', 'COREN-SP-654321'),
('Enf. Patrícia Dantas', '123.098.765-43', 'COREN-SP-987654'),
('Enf. Sérgio Faria', '456.789.012-34', 'COREN-SP-321098'),
('Enf. Carla Miranda', '789.012.345-67', 'COREN-SP-765432'),
('Enf. Eduardo Lima', '000.111.222-33', 'COREN-SP-112233'),
('Enf. Fernanda Rocha', '333.444.555-66', 'COREN-SP-445566'),
('Enf. Gustavo Xavier', '666.777.888-99', 'COREN-SP-778899'),
('Enf. Helena Vaz', '999.000.111-22', 'COREN-SP-001122'),
('Enf. Igor Pires', '111.222.333-44', 'COREN-SP-334455');

---

-- Povoamento da Tabela de Internações
INSERT INTO internacoes (paciente_id, medico_id, data_entrada, data_prevista_alta, data_efetiva_alta, descricao_procedimentos, quarto_id) VALUES
((SELECT id FROM pacientes WHERE nome = 'Isabela Santos'), (SELECT id FROM medicos WHERE nome = 'Dr. Pedro Souza'), '2015-05-01', '2015-05-07', '2015-05-06', 'Remoção de apêndice.', (SELECT id FROM quartos WHERE numero = 101)),
((SELECT id FROM pacientes WHERE nome = 'Rafael Costa'), (SELECT id FROM medicos WHERE nome = 'Dra. Sofia Mendes'), '2016-02-10', '2016-02-15', '2016-02-16', 'Cirurgia cardíaca.', (SELECT id FROM quartos WHERE numero = 102)),
((SELECT id FROM pacientes WHERE nome = 'Mariana Ferreira'), (SELECT id FROM medicos WHERE nome = 'Dr. João Silva'), '2017-09-01', '2017-09-05', '2017-09-05', 'Tratamento para pneumonia.', (SELECT id FROM quartos WHERE numero = 201)),
((SELECT id FROM pacientes WHERE nome = 'Isabela Santos'), (SELECT id FROM medicos WHERE nome = 'Dr. Pedro Souza'), '2018-03-20', '2018-03-25', '2018-03-24', 'Acompanhamento pós-operatório.', (SELECT id FROM quartos WHERE numero = 101)), -- Isabela segunda internação
((SELECT id FROM pacientes WHERE nome = 'Gabriel Oliveira'), (SELECT id FROM medicos WHERE nome = 'Dra. Maria Oliveira'), '2019-11-10', '2019-11-14', '2019-11-14', 'Observação clínica.', (SELECT id FROM quartos WHERE numero = 301)),
((SELECT id FROM pacientes WHERE nome = 'Rafael Costa'), (SELECT id FROM medicos WHERE nome = 'Dra. Sofia Mendes'), '2020-07-01', '2020-07-07', '2020-07-08', 'Reabilitação cardíaca.', (SELECT id FROM quartos WHERE numero = 102)), -- Rafael segunda internação
((SELECT id FROM pacientes WHERE nome = 'Daniel Rodrigues'), (SELECT id FROM medicos WHERE nome = 'Dra. Laura Almeida'), '2021-04-15', '2021-04-20', NULL, 'Fisioterapia intensiva.', (SELECT id FROM quartos WHERE numero = 202));

---

-- Povoamento da Tabela de Relacionamento Internação-Enfermeiro
INSERT INTO internacoes_enfermeiros (internacao_id, enfermeiro_id) VALUES
((SELECT id FROM internacoes WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Isabela Santos') AND data_entrada = '2015-05-01'), (SELECT id FROM enfermeiros WHERE nome = 'Enf. Joana Darc')),
((SELECT id FROM internacoes WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Isabela Santos') AND data_entrada = '2015-05-01'), (SELECT id FROM enfermeiros WHERE nome = 'Enf. Rafael Castro')),
((SELECT id FROM internacoes WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Rafael Costa') AND data_entrada = '2016-02-10'), (SELECT id FROM enfermeiros WHERE nome = 'Enf. Patrícia Dantas')),
((SELECT id FROM internacoes WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Rafael Costa') AND data_entrada = '2016-02-10'), (SELECT id FROM enfermeiros WHERE nome = 'Enf. Sérgio Faria')),
((SELECT id FROM internacoes WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Mariana Ferreira') AND data_entrada = '2017-09-01'), (SELECT id FROM enfermeiros WHERE nome = 'Enf. Carla Miranda')),
((SELECT id FROM internacoes WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Mariana Ferreira') AND data_entrada = '2017-09-01'), (SELECT id FROM enfermeiros WHERE nome = 'Enf. Eduardo Lima')),
((SELECT id FROM internacoes WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Isabela Santos') AND data_entrada = '2018-03-20'), (SELECT id FROM enfermeiros WHERE nome = 'Enf. Joana Darc')),
((SELECT id FROM internacoes WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Isabela Santos') AND data_entrada = '2018-03-20'), (SELECT id FROM enfermeiros WHERE nome = 'Enf. Rafael Castro')),
((SELECT id FROM internacoes WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Gabriel Oliveira') AND data_entrada = '2019-11-10'), (SELECT id FROM enfermeiros WHERE nome = 'Enf. Fernanda Rocha')),
((SELECT id FROM internacoes WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Gabriel Oliveira') AND data_entrada = '2019-11-10'), (SELECT id FROM enfermeiros WHERE nome = 'Enf. Gustavo Xavier')),
((SELECT id FROM internacoes WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Rafael Costa') AND data_entrada = '2020-07-01'), (SELECT id FROM enfermeiros WHERE nome = 'Enf. Patrícia Dantas')),
((SELECT id FROM internacoes WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Rafael Costa') AND data_entrada = '2020-07-01'), (SELECT id FROM enfermeiros WHERE nome = 'Enf. Sérgio Faria')),
((SELECT id FROM internacoes WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Daniel Rodrigues') AND data_entrada = '2021-04-15'), (SELECT id FROM enfermeiros WHERE nome = 'Enf. Helena Vaz')),
((SELECT id FROM internacoes WHERE paciente_id = (SELECT id FROM pacientes WHERE nome = 'Daniel Rodrigues') AND data_entrada = '2021-04-15'), (SELECT id FROM enfermeiros WHERE nome = 'Enf. Igor Pires'));
