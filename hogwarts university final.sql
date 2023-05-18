create database hogwarts_university;
use hogwarts_university;

create table cursos(
id bigint not null auto_increment,
nome varchar(50) not null,
primary key(id)
);

create table periodos(
id bigint not null auto_increment,
periodo varchar(30),
primary key(id)
);


create table turma(
id bigint not null auto_increment,
periodoFK bigint not null,
cursoFK bigint not null,
primary key(id),
foreign key(cursoFK) references cursos(id),
foreign key(periodoFK) references periodos(id)
);

create table estudantes(
id bigint not null auto_increment,
nome varchar(50) not null,
turmaFK bigint not null,
primary key(id),
foreign key(turmaFK) references turma(id)
);

create table itens_avaliacao(
id bigint not null auto_increment,
nome varchar(100) not null,
primary key(id)
);

create table respostas(
id bigint not null auto_increment,
turmaFK bigint not null,
itemFK bigint not null,
nivel_importancia enum ("alta","média","baixa") not null,
nivel_satisfacao enum ("ruim","regular","bom","otimo","n/a") not null,
comentario text,
identificacaoFK bigint,
primary key(id),
foreign key(turmaFK) references turma(id),
foreign key(itemFK) references itens_avaliacao(id),
foreign key(identificacaoFK) references estudantes(id)
);

insert into cursos(nome) values
('analise e desenvolvimento de sistemas'),('mecatrônica'),('mecanica');

insert into periodos(periodo) values
('manhã'),('tarde'),('noturno');

insert into turma(periodoFK,cursoFK) values
(3,1),(2,2),(3,3);

insert into estudantes(nome,turmaFK) values
('Carlos Eduardo',1),('Maria Santos',2),('Antônio Carlos',3),('Fernando Souza',2),('Marcos Silva',1);

insert into itens_avaliacao(nome) values
('limpeza e conservação da sala'),('disponibilidade dos equipamentos'),('qualidade de apostilas'),('cumprimento do horario das aulas'),
('cumprimentos dos objetivos propostos'),('preocupação do docente com os alunos'),('dominio do docente sobre os assuntos'),('o aprendizado'),
('counteúdo do curso'),('atendimento da recepção'),('atendimento telefonico'),('atendimento da cantina'),('atendimento da biblioteca');

insert into respostas(turmaFK,itemFK,nivel_importancia,nivel_satisfacao) values 
(1,1,'alta','otimo'),(1,2,'alta','otimo'),(1,3,'alta','otimo'),(1,4,'alta','otimo'),(1,5,'alta','otimo'),(1,6,'alta','otimo'),(1,7,'alta','otimo'),
(1,8,'alta','otimo'),(1,9,'alta','otimo'),(1,10,'média','n/a'),(1,11,'média','n/a'),(1,12,'média','otimo'),(1,13,'média','otimo'),
(1,1,'alta','otimo'),(1,2,'alta','otimo'),(1,3,'alta','otimo'),(1,4,'alta','otimo'),(1,5,'alta','otimo'),(1,6,'alta','otimo'),(1,7,'alta','otimo'),
(1,8,'alta','otimo'),(1,9,'alta','otimo'),(1,10,'média','n/a'),(1,11,'média','n/a'),(1,12,'média','otimo'),(1,13,'média','otimo'),
(1,1,'alta','otimo'),(1,2,'alta','otimo'),(1,3,'alta','otimo'),(1,4,'alta','otimo'),(1,5,'alta','otimo'),(1,6,'alta','otimo'),(1,7,'alta','otimo'),
(1,8,'alta','otimo'),(1,9,'alta','otimo'),(1,10,'média','n/a'),(1,11,'média','n/a'),(1,12,'média','otimo'),(1,13,'média','otimo'),
(2,1,'alta','otimo'),(2,2,'alta','otimo'),(2,3,'alta','otimo'),(2,4,'alta','otimo'),(2,5,'alta','otimo'),(2,6,'alta','otimo'),(2,7,'alta','otimo'),
(2,8,'alta','otimo'),(2,9,'alta','otimo'),(2,10,'média','bom'),(2,11,'média','bom'),(2,12,'média','n/a'),(2,13,'baixa','ruim'),
(2,1,'alta','otimo'),(2,2,'alta','otimo'),(2,3,'alta','otimo'),(2,4,'alta','otimo'),(2,5,'alta','otimo'),(2,6,'alta','otimo'),(2,7,'alta','otimo'),
(2,8,'alta','otimo'),(2,9,'alta','otimo'),(2,10,'média','bom'),(2,11,'média','bom'),(2,12,'média','n/a'),(2,13,'baixa','ruim');

insert into respostas(turmaFK,itemFK,nivel_importancia,nivel_satisfacao,identificacaoFK) values 
(3,1,'alta','otimo',3),(3,2,'alta','otimo',3),(3,3,'alta','otimo',3),(3,4,'alta','otimo',3),(3,5,'alta','otimo',3),(3,6,'alta','otimo',3),(3,7,'alta','otimo',3),
(3,8,'alta','otimo',3),(3,9,'alta','otimo',3),(3,10,'média','n/a',3),(3,11,'média','n/a',3),(3,12,'média','otimo',3),(3,13,'média','otimo',3);

#a)
select turmaFK,(count(*)/13) as 'formularios preenchidos'from respostas
group by turmaFK;


#b)
select * from respostas
where nivel_satisfacao ='ruim';

#c)
select * from respostas
where nivel_satisfacao ='otimo';

#d)
select * from respostas r
inner join turma t on t.id=r.turmaFK
where nivel_satisfacao ='ruim'
group by t.id,r.id;

#e)
select * from respostas r
inner join turma t on t.id=r.turmaFK
where nivel_satisfacao ='otimo'
group by t.id,r.id;

#f)
select * from respostas
where nivel_importancia ='baixa';

#g)
select * from respostas
where nivel_importancia ='alta';

#h)
select * from respostas r
inner join turma t on t.id=r.turmaFK
where nivel_importancia ='baixa'
group by t.id,r.id;

#i)
select * from respostas r
inner join turma t on t.id=r.turmaFK
where nivel_importancia ='alta'
group by t.id,r.id;

#j)
select * from respostas
where identificacaoFK>0
order by turmaFK,identificacaoFK asc;

#k)
select turmaFK,(count(*)/13) as formularios_preenchidos from respostas
group by turmaFK
order by formularios_preenchidos asc
limit 1;
select turmaFK,(count(*)/13) as formularios_preenchidos from respostas
group by turmaFK
order by formularios_preenchidos desc
limit 1;