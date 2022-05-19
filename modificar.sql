create database modificar

use modificar

create table producto(
clave_prod int,
nom_prod varchar(20),
precio float,
constraint pk_cp primary key (clave_prod)
)

create table cliente(
clave_clie int,
nom_clie varchar(20),
constraint pk_cc primary key (clave_clie)
)

create table nota(
folio int,
clave_prod1 int,
clave_clie1 int,
cant int,
subtot float,
constraint fk_cp1 foreign key (clave_prod1) references producto (clave_prod),
constraint fk_cc1 foreign key (clave_clie1) references cliente (clave_clie)
)

--Insertando valores en las tablas

insert into producto values (1,'papas',7)
insert into producto values (2,'refresco',9)
insert into producto values (3, 'galletas',9)

insert into cliente values (1,'ana')
insert into cliente values (2,'sergio')

--null quiere decir registro vacio

insert into nota values (1,1,1,4,null)
insert into nota values (2,2,2,1,null)

--Realizando un select para mostrar el contenido de la tabla
select * from producto
select * from cliente
select * from nota

--realizando nuestro primer update ---

update cliente set nom_clie='Laura'

-- Realizando un select para mostrar el contenido de la tabla despues del update
select * from cliente

--Realizando nuestro primer update--

update cliente
set nom_clie='sergio'
where clave_clie=2

-- Realizando un select para mostrar el contenido de la tabla despues del update

select * from cliente

--Realizando nuestro primer update--

update nota
set subtot=cant*precio
from nota inner join producto on producto.clave_prod=nota.clave_prod1

-- Realizando un select para mostrar el contenido de la tabla despues del update

select * from nota

--elimina todos los resgistros de la tabla--

delete from nota

--elimino un registro--

delete from producto where clave_prod=3

--eliminar registro que cumpla con where--

delete from producto where precio=7 and clave_prod=1

--Eliminar base de datos y datos

use master
drop database modificar

--eliminar todos los registros de una tabla (lo mismo que delete pero mas rapido)

truncate table nota

--TABLAS SIMPLES
create table carrera
nocarrera char(3) primary key,
carrera varchar(30),
check (nocarrera like 'c[0-9][0-9]')

insert into carrera values('c23', 'sistemas')
select * from carrera 

