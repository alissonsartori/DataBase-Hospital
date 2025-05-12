CREATE TABLE `Convenio` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cnpj` VARCHAR(18) NOT NULL,
  `tempo_carencia` INT NOT NULL COMMENT 'Número de dias de carência'
);

CREATE TABLE `Paciente` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `endereco` TEXT,
  `telefone` VARCHAR(20),
  `email` VARCHAR(100),
  `cpf` VARCHAR(14) UNIQUE NOT NULL,
  `rg` VARCHAR(20),
  `convenio_id` INT
);

CREATE TABLE `Medico` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(14) UNIQUE NOT NULL,
  `data_nascimento` DATE,
  `endereco` TEXT,
  `telefone` VARCHAR(20),
  `email` VARCHAR(100),
  `tipo` VARCHAR(20) NOT NULL COMMENT 'Generalista, Especialista, Residente'
);

CREATE TABLE `Especialidade` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE `Medico_Especialidade` (
  `medico_id` INT,
  `especialidade_id` INT,
  `Primary` Key(medico_id,especialidade_id)
);

CREATE TABLE `Consulta` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `medico_id` INT,
  `paciente_id` INT,
  `valor` DECIMAL(10,2),
  `convenio_id` INT,
  `numero_carteira` VARCHAR(50),
  `especialidade_id` INT
);

CREATE TABLE `Receita` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `consulta_id` INT UNIQUE,
  `data_emissao` DATETIME DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `Receita_Medicamento` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `receita_id` INT,
  `nome_medicamento` VARCHAR(100) NOT NULL,
  `quantidade` VARCHAR(20),
  `instrucoes_uso` TEXT
);

ALTER TABLE `Medico_Especialidade` COMMENT = 'Relacionamento N:N entre Médico e Especialidade';

ALTER TABLE `Paciente` ADD FOREIGN KEY (`convenio_id`) REFERENCES `Convenio` (`id`);

ALTER TABLE `Medico_Especialidade` ADD FOREIGN KEY (`medico_id`) REFERENCES `Medico` (`id`);

ALTER TABLE `Medico_Especialidade` ADD FOREIGN KEY (`especialidade_id`) REFERENCES `Especialidade` (`id`);

ALTER TABLE `Consulta` ADD FOREIGN KEY (`medico_id`) REFERENCES `Medico` (`id`);

ALTER TABLE `Consulta` ADD FOREIGN KEY (`paciente_id`) REFERENCES `Paciente` (`id`);

ALTER TABLE `Consulta` ADD FOREIGN KEY (`convenio_id`) REFERENCES `Convenio` (`id`);

ALTER TABLE `Consulta` ADD FOREIGN KEY (`especialidade_id`) REFERENCES `Especialidade` (`id`);

ALTER TABLE `Receita` ADD FOREIGN KEY (`consulta_id`) REFERENCES `Consulta` (`id`);

ALTER TABLE `Receita_Medicamento` ADD FOREIGN KEY (`receita_id`) REFERENCES `Receita` (`id`);
