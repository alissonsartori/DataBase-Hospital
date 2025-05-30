Sistema de Gerenciamento Hospitalar
Este repositório contém o esquema de banco de dados e scripts SQL para um sistema simplificado de gerenciamento hospitalar. O objetivo é simular as principais entidades e relacionamentos encontrados em um ambiente hospitalar, como médicos, pacientes, consultas, internações e receituários.

🚀 Funcionalidades
O projeto abrange as seguintes entidades e seus relacionamentos:

Médicos: Registro de profissionais, incluindo tipo (generalista, especialista, residente) e status de atividade.
Especialidades: Cadastro de diferentes áreas da medicina.
Pacientes: Informações detalhadas dos pacientes, incluindo dados pessoais e contato.
Convênios: Gerenciamento de planos de saúde e sua associação com pacientes e consultas.
Quartos: Detalhes sobre os quartos disponíveis para internação, seus tipos e valores diários.
Enfermeiros: Cadastro de profissionais de enfermagem.
Consultas: Registro de agendamentos, associando médicos, pacientes, especialidades e informações de convênio.
Receitas: Detalhes dos medicamentos prescritos durante as consultas.
Internações: Controle de internações, com datas de entrada/alta, procedimentos e associação com quartos e enfermeiros.
🛠️ Tecnologias Utilizadas
MySQL: Sistema de Gerenciamento de Banco de Dados Relacional (SGBDR) utilizado para o armazenamento dos dados.
SQL: Linguagem padrão para definição e manipulação dos dados.
📝 Como Usar
Para configurar e explorar este banco de dados em seu ambiente local, siga os passos abaixo:

1. Pré-requisitos
Certifique-se de ter o MySQL Server instalado e um cliente MySQL (como MySQL Workbench, DBeaver ou a linha de comando do MySQL) para executar os scripts.

2. Configuração do Banco de Dados
Crie o Banco de Dados:

SQL

CREATE DATABASE IF NOT EXISTS hospital_db;
Selecione o Banco de Dados:

SQL

USE hospital_db;
Crie as Tabelas:
Execute o script que contém as definições das tabelas. Você pode usar o conteúdo completo fornecido anteriormente, que inclui DROP TABLE IF EXISTS para garantir um ambiente limpo antes da criação.

SQL

-- Exemplo de criação de tabela:
CREATE TABLE medicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(50) CHECK (tipo IN ('generalista', 'especialista', 'residente')) NOT NULL
);
-- ... (outras tabelas)
3. Povoamento dos Dados
Após criar as tabelas, insira os dados de exemplo.

SQL

-- Exemplo de inserção de dados:
INSERT INTO especialidades (nome) VALUES
('Pediatria'),
('Clínica Geral');

INSERT INTO medicos (nome, tipo) VALUES
('Dr. João Silva', 'especialista'),
('Dra. Maria Oliveira', 'generalista');
-- ... (outras inserções)
4. Atualizações e Consultas de Dados
Utilize os seguintes exemplos para realizar atualizações e consultas no banco de dados.

Exemplo de script de atualização:

SQL

SET SQL_SAFE_UPDATES = 0; -- Desativa o modo de segurança do MySQL Workbench para updates sem chaves primárias na clausula WHERE

ALTER TABLE medicos
ADD COLUMN em_atividade BOOLEAN DEFAULT TRUE;

UPDATE medicos
SET em_atividade = FALSE
WHERE nome IN ('Dra. Ana Costa', 'Dra. Gabriela Lima');

UPDATE medicos
SET em_atividade = TRUE
WHERE nome NOT IN ('Dra. Ana Costa', 'Dra. Gabriela Lima');

SET SQL_SAFE_UPDATES = 1; -- Reativa o modo de segurança
Exemplo de consulta:

SQL

-- Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.
SELECT
  c.*,
  AVG(c.valor) OVER () AS valor_medio_2020_convenio
FROM consultas AS c
WHERE
  EXTRACT(YEAR FROM c.data_hora) = 2020 AND c.convenio_id IS NOT NULL;
📊 Estrutura do Banco de Dados
O modelo de banco de dados é composto pelas seguintes tabelas e seus relacionamentos:

medicos
especialidades
medicos_especialidades (tabela de relacionamento N:N entre Médicos e Especialidades)
pacientes
convenios
pacientes_convenios (tabela de relacionamento N:N entre Pacientes e Convênios)
quartos
consultas
receitas
internacoes
enfermeiros
internacoes_enfermeiros (tabela de relacionamento N:N entre Internações e Enfermeiros)
🤝 Contribuição
Sinta-se à vontade para propor melhorias, adicionar novas funcionalidades ou corrigir possíveis erros. Basta abrir uma issue ou enviar um pull request.
