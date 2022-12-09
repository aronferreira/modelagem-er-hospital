drop database if exists hospital;
create database hospital;
use hospital;
create table especialidades (id int not null auto_increment, nome_especialidade varchar(255), primary key (id));

create table if not exists medico (id int not null auto_increment, nome_medico varchar(255), tipo_medico varchar(255) not null, especialidade int not null, foreign key (especialidade) references especialidades (id), primary key (id));

create table if not exists tipo_quarto (id int not null auto_increment, descrição varchar(255) not null, valor_diaria int not null, primary key (id));

create table if not exists quarto (id int not null auto_increment, tipo int not null, numero int not null, foreign key (tipo) references tipo_quarto (id), unique (numero), primary key (id));

create table if not exists convenio (id int not null auto_increment, nome varchar(255) not null, carência varchar(20) not null, cnpj varchar(255) not null, unique (nome, cnpj), primary key (id));

create table if not exists paciente (id int not null auto_increment, convenio_id int not null, foreign key (convenio_id) references convenio (id), nome varchar(255) not null, telefone varchar(255) not null, rg int not null, email varchar(255) not null, cpf varchar(255) not null, endereço varchar(255) not null, data_nascimento date not null, unique (rg, cpf, email), primary key (id));

create table if not exists receita (id int not null auto_increment, paciente_id int not null, medico_responsavel int not null, instruções_uso varchar(255) not null, nome_medicamento varchar(255) not null, quantidade int not null, foreign key (paciente_id) references paciente (id), foreign key (medico_responsavel) references medico (id), primary key (id));

create table if not exists enfermeiro (id int not null auto_increment, nome varchar(255) not null, cpf varchar(20) not null, cre varchar(255) not null, unique(cpf, cre), primary key(id));

create table if not exists consulta (id int not null auto_increment, medico_responsavel int not null, convenio_id int not null, paciente_id int not null, foreign key (medico_responsavel) references medico (id), foreign key (convenio_id) references convenio (id), foreign key (paciente_id) references paciente (id), valor int not null, data_hora_consulta datetime not null, primary key (id)); 

create table if not exists internação (id int not null auto_increment, medico_responsavel int not null, foreign key (medico_responsavel) references medico (id), paciente_id int not null, foreign key (paciente_id) references paciente (id), quarto_id int not null, foreign key (quarto_id) references quarto (id), enfermeiro_responsavel_id int not null, foreign key (enfermeiro_responsavel_id) references enfermeiro (id), procedimento varchar(255) not null, data_entrada datetime not null, data_prev_alta datetime not null, data_alta datetime, primary key (id));

insert into especialidades (nome_especialidade)
values ('pediatria');
insert into especialidades (nome_especialidade)
values ('dermatologia');
insert into especialidades (nome_especialidade)
values ('gastroenterologia');
insert into especialidades (nome_especialidade)
values ('clínica geral');
insert into especialidades (nome_especialidade)
values ('cardiologia');
insert into especialidades (nome_especialidade)
values ('anestesiologia');
insert into especialidades (nome_especialidade)
values ('neurologia');

insert into tipo_quarto (descrição, valor_diaria)
values ('apartamento', 60);
insert into tipo_quarto (descrição, valor_diaria)
values ('enfermaria', 40);
insert into tipo_quarto (descrição, valor_diaria)
values ('quarto duplo', 100);

insert into quarto (numero, tipo)
values (10, 1);
insert into quarto (numero, tipo)
values (05, 2);
insert into quarto (numero, tipo)
values (02, 3);

insert into medico (nome_medico, tipo_medico, especialidade)
values ('roberto', 'especialista', 1);
insert into medico (nome_medico, tipo_medico, especialidade)
values ('julia', 'especialista', 4);
insert into medico (nome_medico, tipo_medico, especialidade)
values ('marcos', 'especialista', 4);
insert into medico (nome_medico, tipo_medico, especialidade)
values ('sandra', 'especialista', 7);
insert into medico (nome_medico, tipo_medico, especialidade)
values ('lucio', 'especialista', 5);
insert into medico (nome_medico, tipo_medico, especialidade)
values ('guilherme', 'especialista', 2);
insert into medico (nome_medico, tipo_medico, especialidade)
values ('jefferson', 'especialista', 3);
insert into medico (nome_medico, tipo_medico, especialidade)
values ('beatriz', 'especialista', 6);
insert into medico (nome_medico, tipo_medico, especialidade)
values ('helena', 'especialista', 2);
insert into medico (nome_medico, tipo_medico, especialidade)
values ('nayara', 'especialista', 1);

insert into convenio (nome, carência, cnpj)
values ('roma saude', '24 horas', '34.842.765/0001-90');
insert into convenio (nome, carência, cnpj)
values ('eucarionte senior', '7 dias', '96.933.577/0001-25');
insert into convenio (nome, carência, cnpj)
values ('tupiniquim', '60 dias', '63.188.218/0001-31');
insert into convenio (nome, carência, cnpj)
values ('ameli', '24 horas', '07.534.648/0001-97');

insert into paciente (convenio_id, nome, telefone, rg, cpf, email, endereço, data_nascimento)
values (01, 'julia dos santos', 11985442331, 389773645, 48805147796, 'julia@gmail.com', 'rua das ostras, 133', '2003-05-27');
insert into paciente (convenio_id, nome, telefone, rg, cpf, email, endereço, data_nascimento)
values (01, 'marcos leonardo', 11951683123, 165980187, 35480014878, 'marcosleo@gmail.com', 'rua do pão, 51', '2003-05-27');
insert into paciente (convenio_id, nome, telefone, rg, cpf, email, endereço, data_nascimento)
values (01, 'lierson silva', 11941651484, 438133018, 54548901499, 'liersonsilva@gmail.com', 'avenida tres rios, 4118', '2003-05-27');
insert into paciente (convenio_id, nome, telefone, rg, cpf, email, endereço, data_nascimento)
values (01, 'cebola ferreira', 11987851648, 348280683, 468622580131, 'cebolitos@gmail.com', 'bairro do limoeiro, 154', '2003-05-27');
insert into paciente (convenio_id, nome, telefone, rg, cpf, email, endereço, data_nascimento)
values (01, 'clancy', 11945655846, 483710027, 488680025155, 'clancy101@gmail.com', 'mulberry street, 101', '2003-05-27');
insert into paciente (convenio_id, nome, telefone, rg, cpf, email, endereço, data_nascimento)
values (02, 'paulo meany', 11948526588, 271117813, 165486800549, 'pmeany@gmail.com', 'rua neymar, 010', '2003-05-27');
insert into paciente (convenio_id, nome, telefone, rg, cpf, email, endereço, data_nascimento)
values (02, 'joelma lusitanda', 11984652148, 110336793, 985564660548, 'joelma@gmail.com', 'rua lua brilhante, 084', '2003-05-27');
insert into paciente (convenio_id, nome, telefone, rg, cpf, email, endereço, data_nascimento)
values (02, 'nicholas bourbaki', 11985442331, 468238992, 164056846541, 'nico@gmail.com', 'rua dema, 027', '2003-05-27');
insert into paciente (convenio_id, nome, telefone, rg, cpf, email, endereço, data_nascimento)
values (02, 'jessica tulipa', 11985442331, 294854459, 256496851484, 'jessicat@gmail.com', 'rua mar rosa, 021', '2003-05-27');
insert into paciente (convenio_id, nome, telefone, rg, cpf, email, endereço, data_nascimento)
values (02, 'marilia rodrigues', 11985442331, 294854684, 368468618498, 'mariliarodri@gmail.com', 'rua do jiló, 328', '2003-05-27');
insert into paciente (convenio_id, nome, telefone, rg, cpf, email, endereço, data_nascimento)
values (03, 'lula molusco', 11985442331, 351458987, 213645866510, 'lulamolusco@gmail.com', 'rua molusco, 252', '2003-05-27');
insert into paciente (convenio_id, nome, telefone, rg, cpf, email, endereço, data_nascimento)
values (03, 'joao sirigueijo', 11985442331, 218894568, 86453548974, 'jsirigueijo@gmail.com', 'rua siri cascudo, 488', '2003-05-27');
insert into paciente (convenio_id, nome, telefone, rg, cpf, email, endereço, data_nascimento)
values (03, 'patrick silva', 11985442331, 546646884, 24022058748, 'silvapatrick@gmail.com', 'rua molusco, 251', '2003-05-27');
insert into paciente (convenio_id, nome, telefone, rg, cpf, email, endereço, data_nascimento)
values (03, 'roberto esponja', 11985442331, 514488532, 44688972051, 'bobbyesponja@gmail.com', 'rua molusco, 253', '2003-05-27');
insert into paciente (convenio_id, nome, telefone, rg, cpf, email, endereço, data_nascimento)
values (03, 'chris gardner', 11985442331, 845654898, 48899865515, 'chrisgardner@gmail.com', 'rua beverlly hills, 35', '2003-05-27');

insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (2, 3, 12, 654, '2018-09-12 23:21:22');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (2, 2, 6, 1200, '2021-08-30 19:24:11');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (5, 1, 2, 300, '2016-11-18 11:05:47');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (8, 1, 4, 840, '2021-02-28 23:57:36');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (10, 2, 9, 180, '2019-04-01 18:33:28');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (9, 3, 12, 654, '2018-12-12 23:21:22');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (3, 2, 3, 1200, '2021-06-21 09:38:11');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (4, 1, 1, 80, '2016-05-28 11:05:47');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (7, 2, 10, 622, '2021-09-08 16:40:36');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (1, 3, 11, 550, '2019-09-22 16:47:28');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (2, 3, 12, 654, '2015-10-18 16:30:10');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (2, 2, 7, 1200, '2021-03-04 06:21:11');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (5, 2, 8, 600, '2022-1-1 11:05:47');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (8, 1, 4, 840, '2018-07-02 13:21:36');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (10, 2, 9, 180, '2019-11-14 21:55:28');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (9, 3, 15, 450, '2016-03-30 17:33:41');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (3, 1, 5, 2500, '2020-02-11 10:02:11');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (4, 3, 13, 456, '2017-02-27 12:45:47');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (6, 2, 10, 789, '2021-01-19 14:00:36');
insert into consulta (medico_responsavel, convenio_id, paciente_id, valor, data_hora_consulta)
values (2, 3, 14, 550, '2015-08-02 18:33:28');

insert into enfermeiro (nome, cpf, cre)
values ('ana julia', '46886023388', 'sim');
insert into enfermeiro (nome, cpf, cre)
values ('victor totti', '48521710366', 'sim');
insert into enfermeiro (nome, cpf, cre)
values ('paulo sales', '31458905877', 'sim');
insert into enfermeiro (nome, cpf, cre)
values ('pedro neves', '32547859841', 'sim');
insert into enfermeiro (nome, cpf, cre)
values ('marcia nunes', '14756982211', 'sim');
insert into enfermeiro (nome, cpf, cre)
values ('felipe argentini', '58761758033', 'sim');
insert into enfermeiro (nome, cpf, cre)
values ('salvio espinola', '47830584566', 'sim');
insert into enfermeiro (nome, cpf, cre)
values ('laura sora', '98544710988', 'sim');
insert into enfermeiro (nome, cpf, cre)
values ('lucas sousa', '12146832755', 'sim');

insert into internação (medico_responsavel, paciente_id, quarto_id, enfermeiro_responsavel_id, procedimento, data_entrada, data_prev_alta, data_alta)
values (2, 6, 2, 5, 'internação', '2018-05-06 20:31:22', '2018-05-14 15:00:00', '2018-05-15 13:12:54');
insert into internação (medico_responsavel, paciente_id, quarto_id, enfermeiro_responsavel_id, procedimento, data_entrada, data_prev_alta, data_alta)
values (8, 6, 2, 2, 'internação', '2019-02-24 16:40:02', '2019-03-10 16:00:00', '2019-03-17 11:00:00');
insert into internação (medico_responsavel, paciente_id, quarto_id, enfermeiro_responsavel_id, procedimento, data_entrada, data_prev_alta, data_alta)
values (9, 15, 1, 7, 'internação', '2018-05-06 20:31:22', '2018-05-14 15:00:00', '2018-05-15 13:12:54');
insert into internação (medico_responsavel, paciente_id, quarto_id, enfermeiro_responsavel_id, procedimento, data_entrada, data_prev_alta, data_alta)
values (6, 15, 1, 1, 'internação', '2015-07-16 07:11:13', '2015-09-21 14:00:00', '2015-09-29 13:00:00');
insert into internação (medico_responsavel, paciente_id, quarto_id, enfermeiro_responsavel_id, procedimento, data_entrada, data_prev_alta, data_alta)
values (10, 10, 3, 6, 'internação', '2017-09-14 11:41:53', '2017-11-28 15:00:00', '2017-12-26 19:02:16');
insert into internação (medico_responsavel, paciente_id, quarto_id, enfermeiro_responsavel_id, procedimento, data_entrada, data_prev_alta, data_alta)
values (7, 12, 2, 4, 'internação', '2020-02-18 17:26:48', '2020-03-02 13:00:00', '2020-05-30 10:35:28');
insert into internação (medico_responsavel, paciente_id, quarto_id, enfermeiro_responsavel_id, procedimento, data_entrada, data_prev_alta, data_alta)
values (2, 4, 3, 3, 'internação', '2021-07-14 16:50:48', '2021-08-02 13:00:00', '2021-07-30 08:22:15');

alter table medico 
add em_atividade boolean;

update medico
set em_atividade = true;

update medico
set em_atividade = false
where id = 1;

update medico
set em_atividade = false
where id = 3;
