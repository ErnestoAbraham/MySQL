CREATE database Proyectof
use Proyectof

--Crear Tabla Proveedores
create Table Proveedores(
codigo_prov int,
nom_prov varchar(50),
direc_prov varchar(200),
ciu_prov varchar(50),
provi_prov varchar(50),
constraint pk_cprov primary key(Codigo_prov)
)

--Insertando datos a la tabla Proveedores
insert into Proveedores values(1, 'Auto Consentido','Lomas de Sotelo 227', 'CDMX', 'Cuauhtemoc')
insert into Proveedores values(2, 'Grupo Carso', 'Paseo de la Reforma 28', 'Monterrey', 'Del Paseo Residencial')
insert into Proveedores values(3, 'Corte Ingles', 'Av Avila Camacho 340', 'Leon', 'San Miguel de Renteria')

--crear tabla Categoria
create table Categoria(
codigo_ca int,
nomb_ca varchar(50),
constraint pk_cca primary key (codigo_ca)
)
--Insertar datos categoria
insert into Categoria values(1, 'Almacenamiento')
insert into Categoria values(2, 'Procesadores')
insert into Categoria values(3, 'Conectores y cables')


--Crear tabla de Piezas
create table Piezas(
codigo_pza int,
nomb_pza varchar(50),
color_pza varchar(50),
precio_pza varchar(50),
codigo_ca1 int,
constraint pk_cpza primary key(codigo_pza),
constraint fk_cca1 foreign key(codigo_ca1) references categoria (codigo_ca)
)

--Insertar valores de la tabla piezas
insert into Piezas values(1,'Adaptador de video externo', 'morado', '$,1500.00',3)
insert into PIezas values(2,'Memoria Ram 32GB','rojo','$2,850.00',1)
insert into Piezas values(3,'Procesador AMD Ryzen 9','naranja', '$18,527.00',2)

--Crear tabla Pieza/Proveedores

create table Proveedores_piezas(
codigo_prov1 int,
codigo_pza1 int,
fecha_prpza datetime,
cant_pza int,
constraint fk_fprov1 foreign key (codigo_prov1) references Proveedores (codigo_prov),
constraint fk_fpza1 foreign key (codigo_pza1) references Piezas (codigo_pza)
)

--Insertar datos Proveedores_piezas

insert into Proveedores_piezas values(1, 3, '2022/03/22', 24)
insert into Proveedores_piezas values(2, 1, '2022/02/15', 10)
insert into Proveedores_piezas values(3, 2, '2022/04/11', 40)

Select * from piezas
Select * from Proveedores
Select * from Proveedores_piezas
Select * from Categoria