-- cirurgia_Veterinaria

CREATE DATABASE IF NOT EXISTS veterinaria;
use veterinaria;



CREATE TABLE IF NOT EXISTS Medico_vt (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(20) NOT NULL,
  sobrenome VARCHAR (20) NOT NULL,
  data_nascimento DATE NOT NULL,
  idade VARCHAR(3) NOT NULL,
  sexo enum('H','M') NOT NULL,
  cpf CHAR(11) NOT NULL,
  celular VARCHAR(15) NOT NULL,
  endereco varchar(60) NOT NULL,
  email VARCHAR(100) NOT NULL,
  periodo ENUM('matutino', 'vespertino', 'noturno', 'integral') NOT NULL,
  especializacao VARCHAR(50) NOT NULL
  )                                                             
;



CREATE TABLE IF NOT EXISTS animal (
  id INT PRIMARY KEY AUTO_INCREMENT,
  especie VARCHAR(30) NOT NULL, -- GATO , CACHORRO ETC..
  raca varchar (15) NOT NULL -- pura, mestiça, hibrida etc..
  )
 
;




CREATE TABLE IF NOT EXISTS responsavel_pc (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(20) NOT NULL,
  sobrenome VARCHAR (20),
  data_nascimento DATE,
  sexo enum('H','M'),
  cpf CHAR(11),
  celular VARCHAR(15) NOT NULL,
  endereco varchar(60),
  email VARCHAR(100) NOT NULL
  )
;




CREATE TABLE IF NOT EXISTS funcionarios (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (20) NOT NULL,
sobrenome VARCHAR (30) NOT NULL,
data_nascimento DATE,
sexo enum('H','M'),
cpf CHAR(11),
celular VARCHAR(15) NOT NULL,
endereco varchar(60),
email VARCHAR(100) NOT NULL,
cargo VARCHAR(20) NOT NULL


);




CREATE TABLE IF NOT EXISTS paciente (
 id INT PRIMARY KEY AUTO_INCREMENT,
  id_responsavel INT,
  id_animal INT,
  nome VARCHAR(20) NOT NULL,
  idade varchar(30),
  sexo enum('M','F'),
  vacinas VARCHAR (45),
  peso DECIMAL,
  FOREIGN KEY (id_animal) REFERENCES animal(id),
  FOREIGN KEY (id_responsavel) REFERENCES responsavel_pc(id)
  )
;



CREATE TABLE IF NOT EXISTS cirurgia (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome_procedimento VARCHAR(20) NOT NULL, -- CIRURGIA_GERAL, NEUROLOGIA, CARDIOLOGIA, ONCOLOGIA, ANESTESIOLOGIA, PATOLOGIA
  data_cirurgia DATE, -- DATA DA CR MARCADA,
  hora_cirurgia TIME
  ) 
;





CREATE TABLE IF NOT EXISTS exame_cirurgia (
id INT PRIMARY KEY AUTO_INCREMENT,
id_cirurgia INT NOT NULL,
FOREIGN KEY (id_cirurgia) REFERENCES cirurgia(id)
) 
;





CREATE TABLE IF NOT EXISTS exames (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_exame_cirurgia INT NOT NULL,
  nome_exame VARCHAR(20) NOT NULL,-- HEMOGRAMA,FEZES,URINA,SANGUE,FUNÇÃO HEPATICA,ULTRASONOGRAFIA,ELETROCARDIOGRAMA,SOROLOGICO
  data_Exame DATE,
  categoria_exame VARCHAR(30),
  FOREIGN KEY (id_exame_cirurgia) REFERENCES exame_cirurgia(id)
  )  
;






CREATE TABLE IF NOT EXISTS laudo_medico (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_exames INT NOT NULL,
    categoria_exame VARCHAR(30),
    nome_exame VARCHAR(100),
    tratamento VARCHAR(100),
    FOREIGN KEY (id_exames) REFERENCES exames(id)
    
)
;



CREATE TABLE IF NOT EXISTS consulta (
  id INT PRIMARY KEY AUTO_INCREMENT,
  data_consulta DATE , 
  hora_consulta TIME ,
  id_paciente INT ,
  id_Medico_vt INT ,
  id_funcionarios INT,
  id_laudo INT ,
  FOREIGN KEY (id_paciente) REFERENCES paciente(id),
  FOREIGN KEY (id_Medico_vt) REFERENCES Medico_vt(id),
  FOREIGN KEY (id_funcionarios) REFERENCES funcionarios(id),
  FOREIGN KEY (id_laudo) REFERENCES laudo_medico(id)
  )
;

--

INSERT INTO animal (especie,raca)
VALUES ('Cachorro','Afghan hound'),
('Periquito', 'Akita uno'),
('Papagaio', 'Basenji'),
('Hamster','Basser hound'),
('Cavalo', 'Bloodhound'),
('Cobra','Siamês'),
('lagartixa','Sphynx'),
('não definido','Ragdoll'),
('Leão','Ashera'),
('Gato','hibrido')
;



INSERT INTO responsavel_pc (id,nome,sobrenome, data_nascimento, sexo, cpf,celular,endereco,email)
VALUES (DEFAULT,'Joe','Caputo','1978/12/27','H','12346789001','(21)019565814','Rua da Posse','bigodecaputo@gmail.com'),                                             
(DEFAULT,'Valerio','Montesinos','1999/07/20','H','73467890023','(21)019565815','Rua las ensinas','valerio@hotmail.com'),                                            
(DEFAULT,'Rhaenyra','Targaryen','2002/12/27', 'M','62346789003','(21)019565816','AV Dragonstone','nyratargaryen@hotmail.com'),
(DEFAULT,'Harwin','Strong','1988/12/27', 'H','52346789004','(22)019565817','Rua Harrenhal','sirharwinstrong@hotmail.com'),                                   
(DEFAULT,'Daenerys','Targaryen','1999/12/27', 'M','42346789005','(22)019565818','AV Westeros','Khaleesi@hotmail.com'),
(DEFAULT,'Piper','Chapman','1988/12/27', 'M','32346789006','(27)019565819','Rua Litchfield','piperchapman@gmail.com'),                                                                    
(DEFAULT,'Clarke','Griffin','1999/12/27', 'M','22346789007','(27)019565810','Rua Polis','wanheda@hotmail.com'),                                                           
(DEFAULT,'Jonas','Kahnwald','1990/12/2', 'H','12346789008','(11)019565811','AV Winden','jonastriquetra@hotmail.com'),                                                    
(DEFAULT,'Ulrich','Nielson','1977/12/27','H','02346789009','(11)019565812','AV Brasil,','ulrichnielsongmail.com'),
(DEFAULT,'Ulrich','Nielson','1977/12/27','H','02346789009','(11)019565812','AV Brasil,','ulrichnielsongmail.com')                                                                
;

INSERT INTO funcionarios (nome,sobrenome, data_nascimento, sexo, cpf,celular,endereco,email,cargo)
VALUES ('Amanda','Silva','1990/08/30','M','03256478955','(11)94654867','rua guapore574,itaquaquecetuba','anasilva@gmail.com', 'atendente'),
('Jose','Goncalves','1987/07/12','H','12345678914','(11)987456123','rua das flore 154,carrao','jose.123@gmail.com','enfermeiro'),
('Luis','Nuner','1990/09/12','H','56478912365','(11)965481237','rua rio de janeiro 235,penha','Luiznunes@gmail.com', 'motorista'),
('Maria','Penha','1989/05/31','M','45678912359','(11)879456321','rua rio grande da serra, tatuape','MariaPenha@gmail.com', 'copeira'),
('Samara','Nogueiraa','1993/08/10','M','23456789982','(11)6589478123','rua alto alegre 13,itaquaquecetuba','SamaraNogueira@gmail.com','recepcionista'),
('Pedro','Alcantara','1987/06/26','H','45685213974','(11)321458976','rua minas gerais 458,lapa','Pedro@gmail.com','motorista'),
('Miguel','Pereira','2000/10/16','H','65879432198','(11)983457723','rua luiz pinto 154,carrao','Miguel.Pereira123@gmail.com','contador'),
('Paulo','Machado','1990/07/26','H','87965412385','(11)987456321', 'estrada do mandi 854,rio pequeno','PauloMachado@gmail.com', 'enfermeiro chefe'),
('Caio','Silva','1998/03/12', 'H','68974123657','(11)98765421)','rua vida louca 15, rockstar','Caio@gmail.com','administrador'),
('Leticia','Goncalves','1993/08/30', 'M', '46789123456','(11)8654793214','rua piaui 52,jerico','leticia@gmailcom','chef da seguranca')

;

INSERT INTO cirurgia (nome_procedimento,data_cirurgia,hora_cirurgia)
VALUES ('neurologia','2022/10/05','03:14:07'),
('cardiologia','2022/10/06','01:10:11'),
('ancologia','2022/10/07','8:35:10'),
('cirurgia_geral','2022/10/08','14:20:14'),
('patologia','2022/10/07','08:30:08'),
('anestesiologia','2022/10/20','12:20:12'),
('cardiologia','2022/10/17','13:15:13'),
('neorologia','2022/10/16','14:42:14'),
('ciruria_geral','2022/10/15','10:00:10'),
('cardiologia','2022/11/13','19:20:19')
;

INSERT INTO exame_cirurgia(id_cirurgia)
VALUES (1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10)
;

INSERT INTO exames (id_exame_cirurgia,nome_exame,data_exame,categoria_exame)
VALUES (1,'HOMOGRAMA','2022/10/07','SANGUE'),
(2,'FEZES','2022/10/08','FEZES'),
(3,'HEPATICA','2022/10/09','SANGUE'),
(4,'ULTRASONOGRAFIA','2022/10/11','IMAGEM'),
(5,'fUNÇÃO','2022/10/11','SANGUE'),
(6,'ELETROCARDIOGRAMA','2022/01/31', 'ELETROUDOS'),
(7,'HOMOGRAMA','2022/10/17','SANGUE'),
(8,'SOROLOGIA','2022/10/11','SANGUE'),
(9,'ELETROCARDIOGRANA','2022/10/18','ELETROUDOS'),
(10,'URINA','2022/10/17','URINA')
;



INSERT INTO laudo_medico (id_exames,categoria_exame,nome_exame,tratamento)
VALUES (1,'Sangue','Hemograma','Descansar bastante'),
(2,'SANGUE','Hepatica','repouso'),
(3,'IMAGEM','Ultrasonografia','agua,boa noite de sono'),
(4,'SANGUE','SOROLOGIA','Anti-inflamatorio'),
(5,'ELETROUDOS','Eletrocardiograma','pomada'),
(6,'SANGUE','Hepatica','Cirurgia'),
(7,'FEZES','FEZES','beber agua'),
(8,'SANGUE','Hemograma','Cirurgia'),
(9,'URINA','Urina','soro caseiro'),
(10,'SAGUE','HEMOGRAMA','Soro na veia')
;


INSERT INTO paciente (id_responsavel,id_animal,nome,idade,sexo, vacinas,peso)
VALUES (1,1,'Lua','Dois anos','F','Em dia',1.0),
(2,2,'Thor','Dois anos','M','Em dia',1.0),
(3,3,'Caramelho','um ano','M','Pendente',1.0),
(4,4,'Preta','seis meses','F','Em dia',1.0),
(5,5,'Sol','tres anos','F','Em dia',1.0),
(6,6,'Trovao','Um ano','M','Em dia',1.0),
(7,7,'Pretinha','Dois meses','F','Pendente',1.0),
(8,8,'Alfa','Duas semanas','M','Em dia',1.0),
(9,9,'Zeus','Oito meses','M','Em dia',1.0),
(10,10,'Princesa','Nove dias','F','Em dia',1.0)
;


iNSERT INTO Medico_vt (nome,sobrenome, data_nascimento, idade, sexo, cpf,celular,endereco,email,periodo,especializacao)
VALUES ('Ludmilla', 'Oliveira', '2002/10/10', 20, 'M', '12346789001', '(22)119565813', 'Rua da Posse', 'ludcantora_medicavet@hotmail.com', 'vespertino', 'neurologia'),
('Francisco', 'Kelvin', '2000/12/08', 22, 'H', '12346789002', '(21)119565814', 'AV Paulista, 37', 'kelvinvet@hotmail.com', 'vespertino', 'neurologia'),
('Izabela', 'Belo', '2002/02/05', 20, 'M', '12346789003', '(21)119565815', 'Rua Horizonte Verde', 'izavet@hotmail.com', 'noturno', 'cirurgia geral'),
('Leticia', 'Gonçalves', '1998/01/01', 24, 'M', '12346789004', '(48)119565816', 'Rua da Alfandega', 'letvet@hotmail.com', 'integral', 'oncologia'),
('Lucas', 'Almeida', '1990/03/28', 32, 'H', '12346789005', '(27)119565817', 'Avenida Pacaembu', 'lucasvet@hotmail.com', 'vespertino', 'cardiologista'),
('Larissa', 'Barbosa', '2003/03/11', 19, 'M', '12346789006', '(21)1195658138', 'Avenida Brasil,55', 'larivet@hotmail.com', 'integral', 'anestesiologia'),
('Leonardo', 'Cortes', '1995/08/29', 27, 'H', '12346789007', '(11)1195658139', 'Rua das Flores', 'leovet@hotmail.com', 'noturno', 'patologia'),
('Jaildo', 'Galdino', '1957/10/10',65, 'H', '12346789008', '(21)1195658130', 'Rua Guaravera', 'jaildovet@hotmail.com', 'matutino', 'cirurgia geral'),
('Vanessa', 'Sodré', '1985/04/04', 37, 'M', '12346789009', '(22)1195658131', 'Morumbi, 784', 'vanessavet@hotmail.com', 'integral', 'oncologia'),
('Carlos', 'Silva', '1978/10/07', '44', 'H', '12467890010', '(27)1195658132', 'AV Europa,17', 'drkakavet@hotmail.com', 'vespertino', 'patologia')
;

INSERT INTO consulta (data_consulta,hora_consulta,id_paciente,id_Medico_vt,id_funcionarios,id_laudo)
VALUES 
('2022/09/10','12:35',1,1,1,1),
('2022/09/10','09:15',2,2,2,2),
('2022/09/12','08:25',3,3,3,3),
('2022/09/15','10:30',4,4,4,4),
('2022/09/15','12:50',5,5,5,5),
('2022/09/18','12:00',6,6,6,6),
('2022/09/19','13:25',7,7,7,7),
('2022/09/20','09:45',8,8,8,8),
('2022/09/20','11:30',9,9,9,9),
('2022/09/20','11:30',10,10,10,10)
;


-- CRUD 

ALTER TABLE paciente MODIFY vacinas ENUM('Em dia','Pendente') NOT NULL;

SELECT CONCAT(funcionarios.nome AND funcionarios.sobrenome) AS "Nome funcionário"
FROM funcionarios;



UPDATE animal SET
especie = 'lagarto'
WHERE  id = 7;


UPDATE animal SET
especie = 'jibóia'
WHERE  id = 6;

UPDATE animal SET
raca = 'Costritora'
WHERE  id = 6;

select * from animal ;


-- ALTER TABLE laudo_medico ADD  tratamento VARCHAR(300);

-- INNER JOIN
-- nome do paciente,id do cliente, data_exames
SELECT
	p.nome,
    p.id_responsavel as responsavel,
    l.tratamento as tratamento,
    e.data_Exame as dat_exames
FROM paciente as p
INNER JOIN laudo_medico as l
	ON p.id = l.id 
INNER JOIN exames as e
	ON p.id = l.id
    ORDER BY p.nome
  ;


select tratamento from laudo_medico;


CREATE VIEW tratamento_por_especie AS 
SELECT 
laudo_medico.id,
laudo_medico.tratamento AS "Tratamento Requerido",
laudo_medico.nome_exame AS "Nome do Exame",
animal.especie AS "Especie"
FROM laudo_medico
INNER JOIN consulta
ON laudo_medico.id = consulta.id_laudo
INNER JOIN paciente
ON consulta.id_paciente = paciente.id
INNER JOIN animal 
ON paciente.id_animal = animal.id;


-- id_animal,nome,especie

 SELECT
	paciente.id_animal,
    paciente.nome,
    animal.especie
     FROM paciente
     INNER JOIN animal
    ON paciente.id_animal = animal.id;
	
    
 -- Procedure pedida para caso o arquivo Procedure1 não seja exportado por algum motivo   
-- 	DELIMITER $$
-- 	DROP PROCEDURE IF EXISTS medico_por_spec_e_consulta;
-- 	CREATE PROCEDURE medico_por_spec_e_consulta( IN id SMALLINT, OUT nome VARCHAR(40), OUT especializacao VARCHAR(50), OUT consultas INT )
-- 	BEGIN 

-- 	SELECT
-- 	medico_vt.id AS 'ID do Médico',
-- 	CONCAT(medico_vt.nome, medico_vt.sobrenome) AS 'Nome do Mëdico',
--     medico_vt.especializacao AS "Especialização",
--     COUNT(consulta.id) AS "Número de Consultas" 
-- 	FROM medico_vt
-- 	JOIN consulta
--     ON medico_vt.id = consulta.id_medico
-- 	WHERE consulta.id = id;

-- 	END $$

-- 	CALL medico_por_spec_e_consulta(5, @nome, @especializacao, @consultas);
	