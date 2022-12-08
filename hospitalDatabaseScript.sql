drop database if exists hospital;
create database if not exists hospital;
use hospital;
create table if not exists medico (id int not null auto_increment, tipo_medico varchar(255) not null, especialidade varchar(255) not null, primary key (id));

create table if not exists tipo_quarto (id int not null auto_increment, descrição varchar(255) not null, valor_diaria int not null, primary key (id));

create table if not exists quarto (id int not null auto_increment, tipo int not null, numero int not null, foreign key (tipo) references tipo_quarto (id), unique (numero), primary key (id));

create table if not exists convenio (id int not null auto_increment, nome varchar(255) not null, carência date not null, cnpj int not null, unique (nome, cnpj), primary key (id));

create table if not exists paciente (id int not null auto_increment, convenio_id int not null, foreign key (convenio_id) references convenio (id), nome varchar(255) not null, telefone int not null, rg int not null, email varchar(255) not null, cpf int not null, endereço varchar(255) not null, data_nascimento date not null, unique (rg, cpf, email), primary key (id));

create table if not exists receita (id int not null auto_increment, paciente_id int not null, medico_responsavel int not null, instruções_uso varchar(255) not null, nome_medicamento varchar(255) not null, quantidade int not null, foreign key (paciente_id) references paciente (id), foreign key (medico_responsavel) references medico (id), primary key (id));

create table if not exists enfermeiro (id int not null auto_increment, nome varchar(255) not null, cpf int not null, cre varchar(255) not null, unique(cpf, cre), primary key(id));

create table if not exists consulta (id int not null auto_increment, medico_responsavel int not null, receita_id int not null, convenio_id int not null, paciente_id int not null ,foreign key (medico_responsavel) references medico (id), foreign key (receita_id) references receita (id), foreign key (convenio_id) references convenio (id), foreign key (paciente_id) references paciente (id), valor int not null, data_consulta date not null, hora_consulta datetime not null, primary key (id)); 

create table if not exists internação (id int not null auto_increment, medico_responsavel int not null, foreign key (medico_responsavel) references medico (id), paciente_id int not null, foreign key (paciente_id) references paciente (id), quarto_id int not null, foreign key (quarto_id) references quarto (id), enfermeiro_responsavel_id int not null, foreign key (enfermeiro_responsavel_id) references enfermeiro (id), procedimento varchar(255) not null, data_entrada datetime not null, data_prev_alta datetime not null, data_alta datetime, primary key (id));
