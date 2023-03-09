/*

 Creación de BD para gestionar un centro de estudios online público.
 Autor: Javier Monroy Muñoz

 Base datos: dbCentroMeta

 */

/* ------------------------------------------------------------
            Creación de la base de datos
 ------------------------------------------------------------- */

drop database if exists dbCentroMeta;

create database if not exists dbCentroMeta;

use dbCentroMeta;

/* ------------------------------------------------------------
            Creación de las tablas base de datos
 ------------------------------------------------------------- */

drop table if exists tblCargos;
create table tblCargos(
    id_cargo int primary key auto_increment not null ,
    cargo varchar(30) not null ,
    descripcion_cargo varchar(100) not null
);

drop table if exists tblUsuarios;
create table tblUsuarios(
    id_usuarios int primary key auto_increment not null ,
    usuario varchar(30) not null ,
    contraseña varchar (30) not null ,
    id_cargo int ,
    foreign key fk_id_cargo(id_cargo) references tblCargos(id_cargo)
);

drop table if exists tblCursos;
create table tblCursos(
    id_curso int primary key auto_increment not null ,
    nombre varchar(50) not null ,
    siglas varchar(10) not null ,
    horas_anuales int(5) not null
);

drop table if exists tblAsignaturas;
create table tblAsignaturas(
    id_asignatura int primary key auto_increment not null ,
    nombre varchar(20) not null ,
    siglas varchar(10) not null ,
    horas_semanales int(5) not null ,
    id_curso int not null ,
    foreign key fk_id_curso(id_curso) references tblCursos(id_curso)
);

drop table if exists tblMatriculas;
create table tblMatriculas(
    id_matricula int primary key auto_increment not null ,
    nombre varchar(20) not null ,
    apellidos varchar(40) not null ,
    dni varchar(9) not null ,
    fecha_nacimiento date not null ,
    localidad_residencia varchar(30) not null ,
    codigo_postal int(5) not null ,
    provincia_residencia varchar(30) not null ,
    domicilio varchar(40) not null ,
    correo varchar(50) not null ,
    telefono varchar(9) not null ,
    curso varchar(40) not null
);

drop table if exists tblDocentes;
create table tblDocentes(
    id_docente int primary key  auto_increment not null ,
    nombre varchar(20) not null ,
    apellidos varchar(40) not null ,
    dni varchar(9) not null ,
    correo varchar(50) not null ,
    telefono varchar(9) not null ,
    id_cargo int not null ,
    id_curso int not null ,
    id_asignatura int not null ,
    foreign key fk_id_cargo(id_cargo) references tblCargos(id_cargo),
    foreign key fk_id_curso(id_curso) references tblCursos(id_curso),
    foreign key fk_id_asignatura(id_asignatura) references  tblAsignaturas(id_asignatura)
);

drop table if exists tblDireccion;
create table tblDireccion(
    id_directivo int primary key auto_increment not null ,
    nombre varchar(20) not null ,
    apellidos varchar(40) not null ,
    id_cargo int not null ,
    foreign key fk_id_cargo(id_cargo) references tblCargos(id_cargo)
);

drop table if exists tblContenido;
create table tblContenido(
    id_contenido int primary key auto_increment not null ,
    temas varchar(1000) not null ,
    id_curso int not null ,
    id_asignatura int not null ,
    foreign key fk_id_curso(id_curso) references tblCursos(id_curso),
    foreign key fk_id_asignatura(id_asignatura) references  tblAsignaturas(id_asignatura)
);

/* ------------------------------------------------------------
            Insertar datos en las tablas base de datos
 ------------------------------------------------------------- */
