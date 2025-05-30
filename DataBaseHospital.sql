-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS hospital_db;

-- Select the database to use
USE hospital_db;

-- Drop tables in reverse order of dependencies to avoid foreign key constraints issues
DROP TABLE IF EXISTS internacoes_enfermeiros;
DROP TABLE IF EXISTS receitas;
DROP TABLE IF EXISTS consultas;
DROP TABLE IF EXISTS pacientes_convenios;
DROP TABLE IF EXISTS internacoes;
DROP TABLE IF EXISTS enfermeiros;
DROP TABLE IF EXISTS quartos;
DROP TABLE IF EXISTS convenios;
DROP TABLE IF EXISTS pacientes;
DROP TABLE IF EXISTS medicos_especialidades;
DROP TABLE IF EXISTS especialidades;
DROP TABLE IF EXISTS medicos;

-- Tabela de Médicos
CREATE TABLE medicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(50) CHECK (tipo IN ('generalista', 'especialista', 'residente')) NOT NULL
);

-- Tabela de Especialidades
CREATE TABLE especialidades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

-- Tabela de Relacionamento Médico-Especialidade
CREATE TABLE medicos_especialidades (
    medico_id INT NOT NULL,
    especialidade_id INT NOT NULL,
    PRIMARY KEY (medico_id, especialidade_id),
    FOREIGN KEY (medico_id) REFERENCES medicos(id),
    FOREIGN KEY (especialidade_id) REFERENCES especialidades(id)
);

-- Tabela de Pacientes
CREATE TABLE pacientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(100),
    cpf VARCHAR(14) UNIQUE NOT NULL,
    rg VARCHAR(20) UNIQUE NOT NULL
);

-- Tabela de Convênios
CREATE TABLE convenios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    tempo_carencia INTEGER NOT NULL
);

-- Tabela de Relacionamento Paciente-Convênio
CREATE TABLE pacientes_convenios (
    paciente_id INT NOT NULL,
    convenio_id INT NOT NULL,
    PRIMARY KEY (paciente_id, convenio_id),
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
    FOREIGN KEY (convenio_id) REFERENCES convenios(id)
);

-- Tabela de Quartos
CREATE TABLE quartos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero INTEGER NOT NULL,
    tipo VARCHAR(50) CHECK (tipo IN ('apartamento', 'quarto duplo', 'enfermaria')) NOT NULL,
    valor_diario DECIMAL(10, 2) NOT NULL
);

-- Tabela de Consultas
CREATE TABLE consultas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_hora TIMESTAMP NOT NULL,
    medico_id INT NOT NULL,
    paciente_id INT NOT NULL,
    especialidade_id INT NOT NULL,
    valor DECIMAL(10, 2),
    convenio_id INT,
    numero_carteira VARCHAR(50),
    FOREIGN KEY (medico_id) REFERENCES medicos(id),
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
    FOREIGN KEY (especialidade_id) REFERENCES especialidades(id),
    FOREIGN KEY (convenio_id) REFERENCES convenios(id)
);

-- Tabela de Receitas
CREATE TABLE receitas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    consulta_id INT NOT NULL,
    medicamento VARCHAR(255) NOT NULL,
    quantidade INTEGER NOT NULL,
    instrucoes TEXT,
    FOREIGN KEY (consulta_id) REFERENCES consultas(id)
);

-- Tabela de Internações
CREATE TABLE internacoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT NOT NULL,
    medico_id INT NOT NULL,
    data_entrada DATE NOT NULL,
    data_prevista_alta DATE NOT NULL,
    data_efetiva_alta DATE,
    descricao_procedimentos TEXT,
    quarto_id INT NOT NULL,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
    FOREIGN KEY (medico_id) REFERENCES medicos(id),
    FOREIGN KEY (quarto_id) REFERENCES quartos(id)
);

-- Tabela de Enfermeiros
CREATE TABLE enfermeiros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    coren VARCHAR(20) UNIQUE NOT NULL
);

-- Tabela de Relacionamento Internação-Enfermeiro
CREATE TABLE internacoes_enfermeiros (
    internacao_id INT NOT NULL,
    enfermeiro_id INT NOT NULL,
    PRIMARY KEY (internacao_id, enfermeiro_id),
    FOREIGN KEY (internacao_id) REFERENCES internacoes(id),
    FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiros(id)
);
