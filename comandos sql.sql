#create database cadastro default character set utf8 default collate utf8_general_ci;

#use cadastro;

#drop database cadastro;
#drop table pessoas;

#create table pessoas (
#	id int not null auto_increment primary key,
#	nome varchar (30) not null,
#	nascimento date,
#	sexo enum ('M','F'),
#	peso decimal(5,2) ,
#	altura decimal(3,2) ,
#	nacionalidade varchar (20) default 'Brasil'
#) default charset = utf8mb4;

#describe pessoas;

#insert into pessoas (nome, nascimento, sexo, peso, altura, nacionalidade) values ('Godofredo','1984-01-31','M','78.5','1.83','Brasil');
#insert into pessoas (nome, nascimento, sexo, peso, altura) values ('Godofredo','1987-11-21','F','58.5','1.65');
#update pessoas set nome = 'Maria' where id ='2';
#insert into pessoas (nome, nascimento, sexo, peso, altura, nacionalidade) values ('Creuza','1917-05-16','F','48.5','1.55','Alemanha');
		##//se a ordem for a mesma dos dados da tabela não precisa dos campos, apenas dos valores, caso tenha auto increment precisa colocar 'default'
#insert into pessoas values (default,'Adalgiza','1938-08-15','F','57.1','1.59','Irlanda');
#insert into pessoas (nome, nascimento, sexo, peso, altura, nacionalidade) 
#	values 	('Ana','2002-03-24','F','60.33','1.63', default),
#			('Pedro','2000-10-26','M','78.5','1.80','Portugal'),
 #           ('José','1999-07-18','M','88.9','1.74','EUA'),
  #          ('Gendalf','1904-02-27','M','83.85','1.99','Inglatera');

#alter table pessoas add column profissao varchar (10);
#alter table pessoas drop column profissao;
#alter table pessoas add column profissao varchar (10) after nome;
#alter table pessoas add codigo int first;
#alter table pessoas drop codigo;
#alter table pessoas modify column profissao varchar(20);
#UPDATE pessoas SET profissao = '' WHERE (id != 0);
#alter table pessoas modify column profissao varchar(20) not null default '';
#alter table pessoas change profissao prof varchar (20);
#alter table pessoas change prof profissao varchar (20) not null default '';
#desc pessoas;
#select * from pessoas;

#alter table pessoas rename to  gafanhotos;
desc gafanhotos;
select * from gafanhotos;

#create table if not exists cursos( 
#	nome varchar(30) not null unique,
 #   descricao text,
  #  carga_horaria int unsigned,
  #  total_aulas int unsigned,
  #  ano year default '2022'
#) default charset = utf8mb4;

#alter table cursos add column idcurso int first;
#alter table cursos add primary key (idcurso);
#alter table cursos modify idcurso int not null auto_increment;

#insert into cursos values 
#	(default,'HTML4', 'Curso de HTML5','40','37','2014'),
 #   (default, 'Algoritmos', 'Lógica de Programação','20','15','2014'),
 #   (default, 'Photoshop', 'Dicas de Photoshop CC','10','8','2016'),
 #   (default, 'PGP', 'Curso de PHP para iniciantes','40','20','2010'),
 #   (default, 'Jarva', 'Introdução a Linguagem Java','10','29','2000'),
 #   (default, 'MySQL', 'Banco de Dados MySQL','30','15','2016'),
 #   (default, 'Word', 'Curso completo de Word','40','30','2016'),
 #   (default, 'Sapateado', 'Danças Rítmicas','40','30','2018'),
 #   (default, 'Cozinha Árabe', 'Aprenda a fazer Kibe','40','30','2018'),
 #   (default, 'YouTuber', 'Gerar polêmica e ganhar inscritos','5','2','2018');
    
    
#update cursos set nome = 'HTML5' where idcurso ='1';
#update cursos set nome = 'PHP' , ano = '2015' where idcurso = '4';
#update cursos set nome = 'Java', carga_horaria = '40', ano= '2022' where idcurso = '5' limit 1;

#delete from cursos where idcurso = '8';
#delete from cursos where idcurso = '9';
#delete from cursos where idcurso = '10';
#delete from cursos where ano = '2018' limit 3;
##//o comando abaixo deleta todos os dados da tabela
##truncate cursos;

desc cursos;
select * from cursos;

###//drop database cadastro;

#select  nome , carga from cursos where ano = '2016' order by ano, nome;
#select  ano, nome , descricao from cursos where  ano in(2014, 2016, 2020) order by ano desc, nome;
#select nome, totaulas, carga from cursos where carga > 35 and totaulas <30 order by nome asc;
#select * from cursos where nome = 'PHP';
#select * from cursos where nome like 'ph%p' order by nome;
#update cursos set nome = 'Photoshop' where idcurso = 3;
#select * from cursos where nome like 'ph%p%' order by nome;
#select * from cursos where nome like 'ph%p_' order by nome;
#select * from gafanhotos where nome like '%silva%' order by nome asc;
#select distinct nacionalidade from gafanhotos order by  nacionalidade;
#select count(*) from cursos;
#select count(*) from gafanhotos;
#select count(*) from cursos where carga > 40;
#select Max(carga) from cursos ;
#select max(totaulas) from cursos where ano = '2016';
#select nome, min(totaulas) from cursos where ano = '2016';
#select sum(totaulas) from cursos;
#select sum(totaulas) from cursos where ano = '2016';
#select avg(totaulas) from cursos;
#select avg(totaulas) from cursos where ano = '2016';

###########################  Exercitando  ###########################
## 1) Uma lista com o Nome de todas as Mulheres(gafanhotas).
## Resposta: 
select nome, sexo from gafanhotos where sexo = 'F' order by nome;

#######################################################################
## 2) Uma lista com os dados de todos aqueles que nasceram entre 1/jan/2000 e 31/Dez/2015.
## Resposta: 
select * from gafanhotos where nascimento between '2000-01-01' and '2015-12-31' order by nome;

#######################################################################
## 3) Uma lista com o nome de todos os homens que trabalham como programadores.
## Resposta: 
select nome, sexo from gafanhotos where profissao = 'programador' and sexo = 'M' order by nome;

#######################################################################
## 4) Uma lista com os dados de todas as mulheres que nasceram no Brasil e que tem seu nome iniciado com a letra 'J'.
## Resposta: 
select * from gafanhotos where sexo = 'F' and nacionalidade = 'Brasil' and nome like 'J%' order by nome;

#######################################################################
## 5) Uma lista com o nome e a nacionalidade de todos os homens que tem "Silva" no nome, não nasceram no Brasil e pesam menos de 100KG.
## Resposta: 
select nome, nacionalidade from gafanhotos where sexo = 'M' and nome like '%Silva%' and nacionalidade != 'Brasil' and peso < 100;

#######################################################################
## 6) Qual é a maior altura entre gafanhotos homens que moram no Brasil?
## Resposta: 
select max(altura) from gafanhotos where sexo = 'M';

#######################################################################
## 7) Qual é a média de peso dos gafanhotos cadastrados?
## Resposta: 
select avg(peso) from gafanhotos;

#######################################################################
## 8) Qual é o menor peso entre as gafanhotos mulheres que nasceram fora do Brasil e entre 1/Jan/1990 e 31/Dez/2000?
## Resposta: 
select min(peso) from gafanhotos where sexo = 'F' and nacionalidade !='Brasil' and nascimento between '1990-01-01' and '2000-12-31';

#######################################################################
## 9) Quantas gafanhotos mulheres tem mais de 1,90m de altura?
## Resposta: 
select count(*) from gafanhotos where sexo = 'F' and altura> '1.9';

#######################################################################

select distinct carga from cursos order by carga desc;
select  carga, count(*) from cursos group by carga order by count(carga) desc;

select  carga, count(*) from cursos
	group by carga 
    having count(*) >=5
    order by count(*) desc;
    
select  carga, count(*) from cursos
	where ano > 2015
	group by carga 
    having count(*) >=5
    order by count(*) desc;

select avg(carga) from cursos;

select carga, count(*) from cursos
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos);

###########################  Exercitando Novamente  ###########################
## 1) Uma lista com as profissões dos gafanhotos e seus respectivos quantitativos.
## Resposta: 
select profissao, count(profissao) from gafanhotos group by profissao order by count(*)desc;

###############################################################################
## 2) Quantos gafanhotos homens e quantas mulheres nasceram após 01/Jan/2005?
## Resposta: 
select sexo, count(sexo) from gafanhotos where nascimento >= '2005-01-01' group by sexo;

###############################################################################
## 3) Uma lista com os gafanhotos que nasceram fora do Brasil, mostrando o país de origem e o total de pessoas nascidas lá.
##	  Só nos interessam os países que tiveram mais de 3 gafanhotos com essa nacionalidade.
## Resposta: 
select nacionalidade, count(nacionalidade) from gafanhotos where nacionalidade != 'Brasil' 
		group by nacionalidade having count(nacionalidade) >=3 order by count(nacionalidade) desc;

###############################################################################
## 4) Uma lista agrupada pela altura dos gafanhotos 
##    //mostrando quantas pessoas pesam mais de 100Kg 
##   e que estão acima da média de altura de todos os cadastrados. ##(1,66).
## Resposta: 
select altura, count(peso) from gafanhotos 
	where peso >= 100 
    group by altura 
    having altura >= (select avg(altura)from gafanhotos) 
    order by altura desc;

###############################################################################

describe gafanhotos;
describe cursos;

alter table gafanhotos add column cursopreferido int;
alter table gafanhotos add foreign key (cursopreferido) references cursos(idcurso);

select * from gafanhotos;
select * from cursos;

update gafanhotos  set cursopreferido = '6' where id = 1;

select gafanhotos.nome, cursos.nome, cursos.ano 
from gafanhotos inner join cursos on cursos.idcurso = gafanhotos.cursopreferido order by gafanhotos.nome;

select g.nome, c.nome, c.ano from gafanhotos as g inner join cursos as c on c.idcurso = g.cursopreferido order by g.nome;
select g.nome, c.nome, c.ano from gafanhotos as g left join cursos as c on c.idcurso = g.cursopreferido order by g.nome;
select g.nome, c.nome, c.ano from gafanhotos as g right join cursos as c on c.idcurso = g.cursopreferido order by g.nome;


create table gafanhoto_assiste_curso (
	id int auto_increment,
    data date not null,
    idgafanhoto int,
    idcurso int,
    primary key (id),
    foreign key (idgafanhoto) references gafanhotos(id),
    foreign key (idcurso) references cursos(idcurso)
    
)  default charset = utf8mb4;

desc gafanhoto_assiste_curso;
select * from gafanhoto_assiste_curso;
insert into gafanhoto_assiste_curso values(default, '2014-01-05', '1','2');


select  g.nome, c.nome from gafanhotos as g 
		inner join gafanhoto_assiste_curso as a 
        on g.id = a.idgafanhoto 
        inner join cursos as c
        on c.idcurso = a.idcurso
        order by g.nome limit 4 ;


















