-- --------------------------------------------------------
-- Anfitrião:                    127.0.0.1
-- Versão do servidor:           11.5.2-MariaDB - mariadb.org binary distribution
-- SO do servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- A despejar estrutura da base de dados para clinicamedica
CREATE DATABASE IF NOT EXISTS `clinicamedica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `clinicamedica`;

-- A despejar estrutura para tabela clinicamedica.consultas
CREATE TABLE IF NOT EXISTS `consultas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  `medico_id` int(11) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medico_id` (`medico_id`),
  KEY `paciente_id` (`paciente_id`),
  CONSTRAINT `medico_id` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `paciente_id` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- A despejar dados para tabela clinicamedica.consultas: ~30 rows (aproximadamente)
INSERT INTO `consultas` (`id`, `data`, `hora`, `paciente_id`, `medico_id`, `observacoes`) VALUES
	(1, '2025-01-10', '09:00:00', 1, 1, 'Consulta de rotina'),
	(2, '2025-01-11', '10:30:00', 2, 2, 'Avaliação cardíaca'),
	(3, '2025-01-12', '11:00:00', 3, 3, 'Problemas de pele'),
	(4, '2025-01-13', '14:00:00', 4, 4, 'Dor no joelho'),
	(5, '2025-01-14', '15:30:00', 5, 5, 'Consulta pediátrica'),
	(6, '2025-01-15', '09:15:00', 6, 6, 'Consulta ginecológica'),
	(7, '2025-01-16', '10:45:00', 7, 7, 'Dores de cabeça'),
	(8, '2025-01-17', '11:30:00', 8, 8, 'Ansiedade'),
	(9, '2025-01-18', '14:15:00', 9, 9, 'Visão desfocada'),
	(10, '2025-01-19', '15:45:00', 10, 10, 'Dor de garganta'),
	(11, '2025-01-20', '09:00:00', 11, 11, 'Controlo hormonal'),
	(12, '2025-01-21', '10:30:00', 12, 12, 'Consulta urológica'),
	(13, '2025-01-22', '11:00:00', 13, 13, 'Dor abdominal'),
	(14, '2025-01-23', '14:00:00', 14, 14, 'Falta de ar'),
	(15, '2025-01-24', '15:30:00', 15, 15, 'Dores articulares'),
	(16, '2025-01-25', '09:15:00', 16, 16, 'Acompanhamento oncológico'),
	(17, '2025-01-26', '10:45:00', 17, 17, 'Função renal'),
	(18, '2025-01-27', '11:30:00', 18, 18, 'Anemia'),
	(19, '2025-01-28', '14:15:00', 19, 19, 'Sistema imunitário'),
	(20, '2025-01-29', '15:45:00', 20, 20, 'Avaliação cirúrgica'),
	(21, '2025-01-30', '09:00:00', 21, 21, 'Consulta estética'),
	(22, '2025-01-31', '10:30:00', 22, 22, 'Doença crónica'),
	(23, '2025-02-01', '11:00:00', 23, 23, 'Avaliação anestésica'),
	(24, '2025-02-02', '14:00:00', 24, 24, 'Raio-X'),
	(25, '2025-02-03', '15:30:00', 25, 25, 'Análises clínicas'),
	(26, '2025-02-04', '09:15:00', 26, 26, 'Consulta laboral'),
	(27, '2025-02-05', '10:45:00', 27, 27, 'Avaliação desportiva'),
	(28, '2025-02-06', '11:30:00', 28, 28, 'Plano alimentar'),
	(29, '2025-02-07', '14:15:00', 29, 29, 'Sessão de fisioterapia'),
	(30, '2025-02-08', '15:45:00', 30, 30, 'Consulta psicológica');

-- A despejar estrutura para tabela clinicamedica.especialidades
CREATE TABLE IF NOT EXISTS `especialidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- A despejar dados para tabela clinicamedica.especialidades: ~30 rows (aproximadamente)
INSERT INTO `especialidades` (`id`, `nome`, `descricao`) VALUES
	(1, 'Medicina Geral', 'Acompanhamento geral de saúde'),
	(2, 'Cardiologia', 'Doenças do coração'),
	(3, 'Dermatologia', 'Doenças da pele'),
	(4, 'Ortopedia', 'Problemas ósseos e musculares'),
	(5, 'Pediatria', 'Saúde infantil'),
	(6, 'Ginecologia', 'Saúde da mulher'),
	(7, 'Neurologia', 'Sistema nervoso'),
	(8, 'Psiquiatria', 'Saúde mental'),
	(9, 'Oftalmologia', 'Saúde ocular'),
	(10, 'Otorrinolaringologia', 'Ouvidos, nariz e garganta'),
	(11, 'Endocrinologia', 'Hormonas e metabolismo'),
	(12, 'Urologia', 'Sistema urinário'),
	(13, 'Gastroenterologia', 'Sistema digestivo'),
	(14, 'Pneumologia', 'Sistema respiratório'),
	(15, 'Reumatologia', 'Doenças reumáticas'),
	(16, 'Oncologia', 'Tratamento do cancro'),
	(17, 'Nefrologia', 'Rins'),
	(18, 'Hematologia', 'Doenças do sangue'),
	(19, 'Imunologia', 'Sistema imunitário'),
	(20, 'Cirurgia Geral', 'Procedimentos cirúrgicos'),
	(21, 'Cirurgia Plástica', 'Cirurgia reconstrutiva e estética'),
	(22, 'Medicina Interna', 'Doenças complexas'),
	(23, 'Anestesiologia', 'Anestesia e dor'),
	(24, 'Radiologia', 'Exames de imagem'),
	(25, 'Patologia Clínica', 'Análises clínicas'),
	(26, 'Medicina do Trabalho', 'Saúde ocupacional'),
	(27, 'Medicina Desportiva', 'Atividade física e desporto'),
	(28, 'Nutrição', 'Alimentação e dietas'),
	(29, 'Fisioterapia', 'Reabilitação física'),
	(30, 'Psicologia', 'Apoio psicológico'),
	(31, 'Cardiologia', 'Área de coração'),
	(32, 'Genecologista', 'Genecologia'),
	(33, 'Teste', 'Teste');

-- A despejar estrutura para tabela clinicamedica.medicos
CREATE TABLE IF NOT EXISTS `medicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `telefone` int(11) NOT NULL,
  `email` varchar(50) NOT NULL DEFAULT '0',
  `especialidade_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `especialidade_id` (`especialidade_id`),
  CONSTRAINT `especialidade_id` FOREIGN KEY (`especialidade_id`) REFERENCES `especialidades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- A despejar dados para tabela clinicamedica.medicos: ~31 rows (aproximadamente)
INSERT INTO `medicos` (`id`, `nome`, `telefone`, `email`, `especialidade_id`) VALUES
	(1, 'Dr. João Martins', 912345678, 'joao.martins@hospital.pt', 0),
	(2, 'Dra. Ana Silva', 913456789, 'ana.silva@hospital.pt', 0),
	(3, 'Dr. Pedro Costa', 914567890, 'pedro.costa@hospital.pt', 0),
	(4, 'Dra. Sofia Rocha', 915678901, 'sofia.rocha@hospital.pt', 0),
	(5, 'Dr. Miguel Pereira', 916789012, 'miguel.pereira@hospital.pt', 0),
	(6, 'Dra. Carla Nunes', 917890123, 'carla.nunes@hospital.pt', 0),
	(7, 'Dr. Ricardo Alves', 918901234, 'ricardo.alves@hospital.pt', 0),
	(8, 'Dra. Patrícia Fonseca', 919012345, 'patricia.fonseca@hospital.pt', 0),
	(9, 'Dr. Luís Teixeira', 910123456, 'luis.teixeira@hospital.pt', 0),
	(10, 'Dra. Inês Ribeiro', 911234567, 'ines.ribeiro@hospital.pt', 0),
	(11, 'Dr. Bruno Faria', 912987654, 'bruno.faria@hospital.pt', 0),
	(12, 'Dra. Helena Lopes', 913876543, 'helena.lopes@hospital.pt', 0),
	(13, 'Dr. Nuno Barros', 914765432, 'nuno.barros@hospital.pt', 0),
	(14, 'Dra. Rita Correia', 915654321, 'rita.correia@hospital.pt', 0),
	(15, 'Dr. Paulo Santos', 916543210, 'paulo.santos@hospital.pt', 0),
	(16, 'Dra. Marta Cunha', 917432109, 'marta.cunha@hospital.pt', 0),
	(17, 'Dr. Fernando Pacheco', 918321098, 'fernando.pacheco@hospital.pt', 0),
	(18, 'Dra. Joana Azevedo', 919210987, 'joana.azevedo@hospital.pt', 0),
	(19, 'Dr. Carlos Mota', 910109876, 'carlos.mota@hospital.pt', 0),
	(20, 'Dra. Daniela Freitas', 911098765, 'daniela.freitas@hospital.pt', 0),
	(21, 'Dr. André Leal', 912087654, 'andre.leal@hospital.pt', 0),
	(22, 'Dra. Filipa Moura', 913076543, 'filipa.moura@hospital.pt', 0),
	(23, 'Dr. Tiago Neves', 914065432, 'tiago.neves@hospital.pt', 0),
	(24, 'Dra. Susana Brito', 915054321, 'susana.brito@hospital.pt', 0),
	(25, 'Dr. Vasco Antunes', 916043210, 'vasco.antunes@hospital.pt', 0),
	(26, 'Dra. Paula Matos', 917032109, 'paula.matos@hospital.pt', 0),
	(27, 'Dr. Diogo Pinto', 918021098, 'diogo.pinto@hospital.pt', 0),
	(28, 'Dra. Teresa Coelho', 919010987, 'teresa.coelho@hospital.pt', 0),
	(29, 'Dr. Hugo Varela', 910999876, 'hugo.varela@hospital.pt', 0),
	(30, 'Dra. Cláudia Simões', 911888765, 'claudia.simoes@hospital.pt', 0),
	(32, 'Tiago Moreira', 760100300, 'tigas574@hospital.com', 32);

-- A despejar estrutura para tabela clinicamedica.pacientes
CREATE TABLE IF NOT EXISTS `pacientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- A despejar dados para tabela clinicamedica.pacientes: ~33 rows (aproximadamente)
INSERT INTO `pacientes` (`id`, `nome`, `data_nascimento`, `sexo`, `telefone`, `email`) VALUES
	(1, 'José Almeida', '1985-03-12', 'M', '912111111', 'jose.almeida@gmail.com'),
	(2, 'Maria Ferreira', '1990-07-25', 'F', '913222222', 'maria.ferreira@gmail.com'),
	(3, 'António Rocha', '1978-11-02', 'M', '914333333', 'antonio.rocha@gmail.com'),
	(4, 'Ana Pires', '2000-01-15', 'F', '915444444', 'ana.pires@gmail.com'),
	(5, 'Carlos Lopes', '1965-06-30', 'M', '916555555', 'carlos.lopes@gmail.com'),
	(6, 'Sofia Mendes', '1995-09-18', 'F', '917666666', 'sofia.mendes@gmail.com'),
	(7, 'Paulo Ribeiro', '1982-12-10', 'M', '918777777', 'paulo.ribeiro@gmail.com'),
	(8, 'Rita Fonseca', '1988-04-22', 'F', '919888888', 'rita.fonseca@gmail.com'),
	(9, 'Luís Cardoso', '1975-08-05', 'M', '910999999', 'luis.cardoso@gmail.com'),
	(10, 'Inês Matias', '1999-10-29', 'F', '911000000', 'ines.matias@gmail.com'),
	(11, 'Miguel Tavares', '1983-02-14', 'M', '912101010', 'miguel.tavares@gmail.com'),
	(12, 'Helena Cruz', '1970-05-09', 'F', '913202020', 'helena.cruz@gmail.com'),
	(13, 'Nuno Afonso', '1992-07-07', 'M', '914303030', 'nuno.afonso@gmail.com'),
	(14, 'Patrícia Leite', '1987-03-03', 'F', '915404040', 'patricia.leite@gmail.com'),
	(15, 'Vítor Gomes', '1960-01-20', 'M', '916505050', 'vitor.gomes@gmail.com'),
	(16, 'Cláudia Pinho', '1996-11-11', 'F', '917606060', 'claudia.pinho@gmail.com'),
	(17, 'Rui Figueiredo', '1981-06-06', 'M', '918707070', 'rui.figueiredo@gmail.com'),
	(18, 'Joana Batista', '1993-09-09', 'F', '919808080', 'joana.batista@gmail.com'),
	(19, 'Fernando Cunha', '1972-04-04', 'M', '910909090', 'fernando.cunha@gmail.com'),
	(20, 'Daniela Torres', '2001-12-01', 'F', '911010101', 'daniela.torres@gmail.com'),
	(21, 'Bruno Monteiro', '1989-08-08', 'M', '912121212', 'bruno.monteiro@gmail.com'),
	(22, 'Catarina Neves', '1994-05-05', 'F', '913232323', 'catarina.neves@gmail.com'),
	(23, 'Hugo Moreira', '1986-10-10', 'M', '914343434', 'hugo.moreira@gmail.com'),
	(24, 'Sara Araujo', '1998-02-02', 'F', '915454545', 'sara.araujo@gmail.com'),
	(25, 'Tiago Brito', '1979-07-17', 'M', '916565656', 'tiago.brito@gmail.com'),
	(26, 'Vanessa Correia', '1991-03-19', 'F', '917676767', 'vanessa.correia@gmail.com'),
	(27, 'André Pacheco', '1984-09-23', 'M', '918787878', 'andre.pacheco@gmail.com'),
	(28, 'Filipa Reis', '1997-06-14', 'F', '919898989', 'filipa.reis@gmail.com'),
	(29, 'Sérgio Matos', '1976-12-31', 'M', '910121314', 'sergio.matos@gmail.com'),
	(30, 'Beatriz Oliveira', '2002-04-27', 'F', '911151617', 'beatriz.oliveira@gmail.com'),
	(31, 'Ana Costa', '1992-05-10', 'F', '912345678', 'ana.costa@gmail.com'),
	(34, 'Leonardo Ribeiroo', '2004-11-17', 'F', '912345678', 'leonardoribeiro2004@gmail.com'),
	(36, 'Leonardo Ribeiro', '2004-11-17', 'F', '912345678', 'leonardoribeiro2004@gmail.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
