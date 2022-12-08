# Modelagem Banco de Dados - Hospital
Modelagem de entidades e relações de um hospital, proposto pelo professor Gabriel Augusto do Instituto PROA.

## Proposta:

Analise a seguinte descrição e extraia dela os requisitos para o banco de dados:
O hospital necessita de um sistema para sua área clínica que ajude a controlar consultas realizadas. Os médicos podem ser generalistas, especialistas ou residentes e têm seus dados pessoais cadastrados em planilhas digitais. Cada médico pode ter uma ou mais especialidades, que podem ser pediatria, clínica geral, gastroenterologia e dermatologia. Alguns registros antigos ainda estão em formulário de papel, mas será necessário incluir esses dados no novo sistema.

Os pacientes também precisam de cadastro, contendo dados pessoais (nome, data de nascimento, endereço, telefone e e-mail), documentos (CPF e RG) e convênio. Para cada convênio, são registrados nome, CNPJ e tempo de carência.

As consultas também têm sido registradas em planilhas, com data e hora de realização, médico responsável, paciente, valor da consulta ou nome do convênio, com o número da carteira. Também é necessário indicar na consulta qual a especialidade buscada pelo paciente.

Deseja-se ainda informatizar a receita do médico, de maneira que, no encerramento da consulta, ele possa registrar os medicamentos receitados, a quantidade e as instruções de uso. A partir disso, espera-se que o sistema imprima um relatório da receita ao paciente ou permita sua visualização via internet.

## Modelagem:

<img src="hospitalModelagem.png">

## Ferramentas utilizadas:

- BrModelo

## Contato:

aronf.ramalho@gmail.com

https://www.linkedin.com/in/aronferreiraramalho/

# Modelagem Banco de Dados - Hospital - Parte 2
Coninuação da Modelagem de um Banco de Dados de um Hospital, desta vez adicionando mais entidades e relações na modelagem, além disso criando também o script do banco em SQL.

## Proposta:

No hospital, as internações têm sido registradas por meio de formulários eletrônicos que gravam os dados em arquivos. 
Para cada internação, são anotadas a data de entrada, a data prevista de alta e a data efetiva de alta, além da descrição textual dos procedimentos a serem realizados. 
As internações precisam ser vinculadas a quartos, com a numeração e o tipo. 
Cada tipo de quarto tem sua descrição e o seu valor diário (a princípio, o hospital trabalha com apartamentos, quartos duplos e enfermaria).
Também é necessário controlar quais profissionais de enfermaria estarão responsáveis por acompanhar o paciente durante sua internação. Para cada enfermeiro(a), é necessário nome, CPF e registro no conselho de enfermagem (CRE).
A internação, obviamente, é vinculada a um paciente – que pode se internar mais de uma vez no hospital – e a um único médico responsável.

Por último, crie um script SQL para a geração do banco de dados e para instruções de montagem de cada uma das entidades/tabelas presentes no diagrama completo (considerando as entidades do diagrama da atividade anterior e as novas entidades propostas no diagrama acima). Também crie tabelas para relacionamentos quando necessário. Aplique colunas e chaves primárias e estrangeiras.

## Modelagem Atualizada:

<img src="modelagemAtualizada.png">

## Ferramentas utilizadas:

- BrModelo
- MySQL Workbench

## Contato:

aronf.ramalho@gmail.com

https://www.linkedin.com/in/aronferreiraramalho/
