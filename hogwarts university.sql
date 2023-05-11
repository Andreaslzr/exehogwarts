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
cursoFK bigint not null,
turmaFK bigint not null,
periodoFK bigint not null,
itemFK bigint not null,
nivel_importancia enum ("alta","média","baixa") not null,
nivel_satisfacao enum ("ruim","regular","bom","otimo","n/a") not null,
comentario text,
identificacaoFK bigint,
primary key(id),
foreign key(cursoFK) references cursos(id),
foreign key(turmaFK) references turma(id),
foreign key(periodoFK) references periodos(id),
foreign key(itemFK) references itens_avaliacao(id),
foreign key(identificacaoFK) references estudantes(id)
);
