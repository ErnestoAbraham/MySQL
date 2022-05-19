create database escuela3
use escuela3

--Tabla carrera

create Table carrera(
clave_c int,
nom_c varchar(50),
durac_c float,
constraint pk_cc primary key(clave_c)
)
--Insertando datos a la tabla carrera
insert into carrera values(1, 'Ingenieria en Sistemas', 5)
insert into carrera values(2, 'Medicina', 6 )
insert into carrera values (3,'Diseño',3)

--Ingresando a los datos de la tabla carrera
select * from carrera

--Tabla materia

create Table materia(
clave_m int,
nom_m varchar(50),
cred_m float,
constraint pk_cm primary key(clave_m)
)

--Insertando datos en la tabla materia
insert into materia values(1, 'Matemáticas Discretas', 25)
insert into materia values(2, 'Anatomia', 15)
insert into materia values(3,'Dibujo',15)
insert into materia values(4,'Programación',20)

select clave_m, nom_m from materia

--Tabla Profesor

create table profesor(
clave_p int,
nom_p varchar(100),
dir_p varchar(200),
tel_p bigint,
hor_p datetime,
constraint pk_cp primary key(clave_p)
)

--Insertando datos en la tabla profesor
insert into profesor values(1, 'Claudia Hernández', 'Calle Naur', 57234, '10:00')
insert into profesor values(2, 'Juan Bory', 'Calle Trasimeno', 58675, '13:00')

/*Tabla Alumno
(Con una clave foranea)*/

create table alumno(
mat_alu int,
nom_alu varchar(50),
edad_alu int,
sem_alu int,
gen_alu varchar(10),
clave_c1 int,
constraint pk_calu primary key(mat_alu),
constraint fk_fc1 foreign key(clave_c1) references carrera(clave_c)
)

--Insetando datos en la tabla alumno
insert into alumno values(1, 'Víctor', 20, 3, 'Hombre', 1)
insert into alumno values(2, 'Ana', 22, 4, 'Mujer', 2)
insert into alumno values(3, 'Sergio', 23, 5, 'Hombre', 3)
insert into alumno values(4,'Julieta',20,6,'Mujer',3)

select * from alumno
--Alumno-Profesor

create table alu_pro(
mat_alu1 int,
clave_p1 int,
constraint fk_falu1 foreign key(mat_alu1) references alumno(mat_alu),
constraint fk_fp1 foreign key(clave_p1) references profesor(clave_p)
)

--Insertando datos en la tabla alumno-profesor
insert into alu_pro values(1,2)
insert into alu_pro values(2,1)
insert into alu_pro values(2,2)
insert into alu_pro values(3,2)


--Materia-Alumno
create table mat_alu(
clave_m1 int,
mat_alu2 int,
constraint fk_fm1 foreign key (clave_m1) references materia (clave_m),
constraint fk_falu2 foreign key (mat_alu2) references alumno (mat_alu)
)

--Insertando datos a la tabla materia_alumno
insert into mat_alu values(1,2)
insert into mat_alu values(2,1)
insert into mat_alu values(4,2)
insert into mat_alu values(3,3)
insert into mat_alu values(4,1)


--Materia-Profesor
create table mat_prof(
clave_m2 int,
clave_p2 int,
constraint fk_fm2 foreign key (clave_m2) references materia (clave_m),
constraint fk_fp2 foreign key (clave_p2) references profesor (clave_p)
)

--Insertando datos en la tabla materia_profesor
insert into mat_prof values(1,1)
insert into mat_prof values(2,2)

--istruccion inner join
select nom_alu , edad_alu, sem_alu, nom_c
from alumno inner join carrera on alumno.clave_c1=carrera.clave_c
inner join alu_pro on alu_pro.mat_alu1=alumno.mat_alu
inner join profesor on profesor.clave_p=alu_pro.clave_p1
inner join mat_alu on mat_alu.mat_alu2=alumno.mat_alu
inner join materia on materia.clave_m=mat_alu.clave_m1
where edad_alu=22


