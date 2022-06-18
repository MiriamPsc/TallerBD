USE master
GO

IF DB_ID (N'InstitutoDeInvestigacion') IS NOT NULL
DROP DATABASE InstitutoDeInvestigacion;
GO
CREATE DATABASE InstitutoDeInvestigacion
ON 
(NAME = InstitutoDeInvestigacion_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\InstitutoDeInvestigacion.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
( NAME = InstitutoDeInvestigacion_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\InstitutoDeInvestigacion.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO

USE InstitutoDeInvestigacion
GO

--TABLAS

CREATE TABLE Beneficiario
(
    idBeneficiario int IDENTITY (1, 1),
    nombre varchar (50) not null,
    rfc char (13),
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKBeneficiario PRIMARY KEY(idBeneficiario)
)

CREATE TABLE Caso
(
    idCaso int IDENTITY (1, 1),
    codigo char (6) not null,
    estado char (1) not null,
    fechaInicio datetime not null,
    fechaCierre datetime default null,
    idEquipo int not null,
    idEspecialidad int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCaso PRIMARY KEY(idCaso)
)

CREATE TABLE Certificado
(
    idCertificado int IDENTITY (1, 1),
    codigo varchar (50) not null,
    idInstitucion int not null,
    fecha datetime not null, 
    ciudad varchar (50) not null,
    pais varchar (50) not null,
    idTipoCertificado int not null,
    idEmpleado int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCertificado PRIMARY KEY(idCertificado)
)

CREATE TABLE Departamento
(
    idDepartamento int IDENTITY (1, 1),
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKDepartamento PRIMARY KEY(idDepartamento)
)

CREATE TABLE Donacion
(
    idDonacion int IDENTITY (1, 1),
    fecha datetime not null,
    valor int not null,
    idBeneficiario int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKDonacion PRIMARY KEY(idDonacion)
)

CREATE TABLE Empleado
(
    idEmpleado int IDENTITY (1, 1),
    numero char (5) not null,
    nombre varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) default null,
    genero char (5) not null,
    ciudad varchar (50) not null,
    pais varchar (50) not null,
    fechaNacimiento datetime not null,
    rfc char (13) not null,
    dni char (13) not null,
    idTipoEmpleado int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKEmpleado PRIMARY KEY(idEmpleado)
)

CREATE TABLE Equipo
(
    idEquipo int IDENTITY (1, 1),
    codigo char (6) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKEquipo PRIMARY KEY(idEquipo)
)

CREATE TABLE Especialidad
(
    idEspecialidad int IDENTITY (1, 1),
    nombre varchar (50) not null,
    descripcion varchar (250) not null,
    idDepartamento int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKEspecialidad PRIMARY KEY(idEspecialidad)
)

CREATE TABLE Institucion
(
    idInstitucion int IDENTITY (1, 1),
    nombre varchar (100) not null,
    codigo char (6) not null,
    ciudad varchar (50) not null,
    pais varchar (50) not null,
    idTipoInstitucion int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKInstitucion PRIMARY KEY(idInstitucion)
)

CREATE TABLE InstitucionEducativa
(
    idInstitucionEducativa int IDENTITY (1, 1),
    nombre varchar (100) not null,
    ciudad varchar (50) not null,
    estado varchar (50) not null,
    pais varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKInstitucionEducativa PRIMARY KEY(idInstitucionEducativa)
)

CREATE TABLE Instrumento
(
    idInstrumento int IDENTITY (1, 1),
    codigo char (6) not null,
    idTipoInstrumento int not null,
    idDepartamento int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKInstrumento PRIMARY KEY(idInstrumento)
)

CREATE TABLE Mobiliario
(
    idMobiliario int IDENTITY (1, 1),
    codigo char (5) not null,
    idTipoMobiliario int not null,
    idDepartamento int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKMobiliario PRIMARY KEY(idMobiliario)
)

CREATE TABLE Pase
(
    idPase int IDENTITY (1,1),
    codigo char (5) not null,
    fechaInicio datetime not null,
    fechaFinal datetime not null,
    idTipoPase int not null,
    idInstitucion int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPase PRIMARY KEY(idPase)
)

CREATE TABLE Reactivo
(
    idReactivo int IDENTITY (1, 1),
    nombre varchar (100) not null,
    formula varchar (250) not null,
    tipo char (1) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKReactivo PRIMARY KEY(idReactivo)
)

CREATE TABLE Reporte
(
    idReporte int IDENTITY (1, 1),
    codigo char (5) not null,
    idCaso int not null,
    fechaEntrega datetime not null,
    idEmpleadoEntrega int not null,
    idEmpleadoRecibe int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKReporte PRIMARY KEY(idReporte)
)

CREATE TABLE TipoCertificado
(
    idTipoCertificado int IDENTITY (1,1),
    nombre varchar (100) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTipoCertificado PRIMARY KEY(idTipoCertificado)
)

CREATE TABLE TipoEmpleado
(
    idTipoEmpleado int IDENTITY (1, 1),
    nombre varchar (50) not null,
    descripcion varchar (200) not null,
    sueldoBase numeric (10, 2) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTipoEmpleado PRIMARY KEY(idTipoEmpleado)
)

CREATE TABLE TipoInstitucion
(
    idTipoInstitucion int IDENTITY (1, 1),
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTipoInstitucion PRIMARY KEY(idTipoInstitucion)
)

CREATE TABLE TipoInstrumento
(
    idTipoInstrumento int IDENTITY (1, 1),
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTipoInstrumento PRIMARY KEY(idTipoInstrumento)
)

CREATE TABLE TipoMobiliario
(
    idTipoMobiliario int IDENTITY (1, 1),
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTipoMobiliario PRIMARY KEY(idTipoMobiliario)
)

CREATE TABLE TipoPase
(
    idTipoPase int IDENTITY (1, 1),
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTipoPase PRIMARY KEY(idTipoPase)
)

CREATE TABLE TipoVisita
(
    idTipoVisita int IDENTITY (1, 1),
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTipoVisita PRIMARY KEY(idTipoVisita)
)

CREATE TABLE Usuario
(
    idUsuario int IDENTITY,
    nombre varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    correo varchar (50) UNIQUE not null,
    clave varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKUsuario PRIMARY KEY(idUsuario)
)

CREATE TABLE Visita
(
    idVisita int IDENTITY (1, 1),
    codigo char (5) not null,
    fecha datetime not null,
    idTipoVisita int not null,
    idVisitante int not null,
    idPase int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKVisita PRIMARY KEY(idVisita)
)

CREATE TABLE Visitante
(
    idVisitante int IDENTITY,
    nombre varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    correo varchar (50) UNIQUE not null,
    telefono char (10) not null,
    fechaNacimiento datetime not null,
    dni char (13) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKVisitante PRIMARY KEY(idVisitante)
)

CREATE TABLE DepartamentoReactivo
(
    idDepartamentoReactivo int IDENTITY,
    idDepartamento int not null,
    idReactivo int not null,
    lote char (5) not null,
    codigo varchar (10) not null,
    fechaEmpaque datetime not null,
    fechaCaducidad datetime not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKDepartamentoReactivo PRIMARY KEY(idDepartamentoReactivo)
)

CREATE TABLE DonacionInstitucion
(
    idDonacionInstitucion int IDENTITY (1, 1),
    idDonacion int not null,
    idInstitucion int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKDonacionInstitucion PRIMARY KEY(idDonacionInstitucion)
)

CREATE TABLE EmpleadoEspecialidad
(
    idEmpleadoEspecialidad int IDENTITY (1, 1),
    idEmpleado int not null,
    idEspecialidad int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKEmpleadoEspecialidad PRIMARY KEY(idEmpleadoEspecialidad)
)

CREATE TABLE EmpleadoEquipo
(
    idEmpleadoEquipo int IDENTITY (1, 1),
    idEmpleado int not null,
    idEquipo int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKEmpleadoEquipo PRIMARY KEY(idEmpleadoEquipo)
)

CREATE TABLE EmpleadoInstitucion
(
    idEmpleadoInstitucion int IDENTITY (1, 1),
    idEmpleado int not null,
    idInstitucion int not null,
    fechaInicio datetime not null,
    fechaFinal datetime default null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKEmpleadoInstitucion PRIMARY KEY(idEmpleadoInstitucion)
)

--INDEX

CREATE INDEX IXBeneficiario ON Beneficiario(idBeneficiario)
GO
CREATE INDEX IXCaso ON Caso(idCaso)
GO
CREATE INDEX IXCertificado ON Certificado(idCertificado)
GO
CREATE INDEX IXDepartamento ON Departamento(idDepartamento)
GO
CREATE INDEX IXDonacion ON Donacion(idDonacion)
GO
CREATE INDEX IXEmpleado ON Empleado(idEmpleado)
GO
CREATE INDEX IXEquipo ON Equipo(idEquipo)
GO
CREATE INDEX IXEspecialidad ON Especialidad(idEspecialidad)
GO
CREATE INDEX IXInstitucion ON Institucion(idInstitucion)
GO
CREATE INDEX IXInstitucionEducativa ON InstitucionEducativa(idInstitucionEducativa)
GO
CREATE INDEX IXInstrumento ON Instrumento(idInstrumento)
GO
CREATE INDEX IXMobiliario ON Mobiliario(idMobiliario)
GO
CREATE INDEX IXPase ON Pase(idPase)
GO
CREATE INDEX IXReactivo ON Reactivo(idReactivo)
GO
CREATE INDEX IXReporte ON Reporte(idReporte)
GO
CREATE INDEX IXTipoCertificado ON TipoCertificado(idTipoCertificado)
GO
CREATE INDEX IXTipoEmpleado ON TipoEmpleado(idTipoEmpleado)
GO
CREATE INDEX IXTipoInstitucion ON TipoInstitucion(idTipoInstitucion)
GO
CREATE INDEX IXTipoInstrumento ON TipoInstrumento(idTipoInstrumento)
GO
CREATE INDEX IXTipoMobiliario ON TipoMobiliario(idTipoMobiliario)
GO
CREATE INDEX IXTipoPase ON TipoPase(idTipoPase)
GO
CREATE INDEX IXTipoVisita ON TipoVisita(idTipoVisita)
GO
CREATE INDEX IXUsuario ON Usuario(idUsuario)
GO
CREATE INDEX IXVisita ON Visita(idVisita)
GO
CREATE INDEX IXVisitante ON Visitante(idVisitante)
GO
CREATE INDEX IXDepartamentoReactivo ON DepartamentoReactivo(idDepartamentoReactivo)
GO
CREATE INDEX IXDonacionInstitucion ON DonacionInstitucion(idDonacionInstitucion)
GO
CREATE INDEX IXEmpleadoEspecialidad ON EmpleadoEspecialidad(idEmpleadoEspecialidad)
GO
CREATE INDEX IXEmpleadoEquipo ON EmpleadoEquipo(idEmpleadoEquipo)
GO
CREATE INDEX IEmpleadoInstitucion ON EmpleadoInstitucion(idEmpleadoInstitucion)
GO

--RELACIONES

ALTER TABLE Beneficiario
ADD CONSTRAINT FKBeneficiarioUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Beneficiario
ADD CONSTRAINT FKBeneficiarioUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Caso
ADD CONSTRAINT FKCasoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Caso
ADD CONSTRAINT FKCasoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Certificado
ADD CONSTRAINT FKCertificadoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Certificado
ADD CONSTRAINT FKCertificadoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Departamento
ADD CONSTRAINT FKDepartamentoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Departamento
ADD CONSTRAINT FKDepartamentoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Donacion
ADD CONSTRAINT FKDonacionUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Donacion
ADD CONSTRAINT FKDonacionUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Empleado
ADD CONSTRAINT FKEmpleadoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Empleado
ADD CONSTRAINT FKEmpleadoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Equipo
ADD CONSTRAINT FKEquipoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Equipo
ADD CONSTRAINT FKEquipoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Especialidad
ADD CONSTRAINT FKEspecialidadUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Especialidad
ADD CONSTRAINT FKEspecialidadUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Institucion
ADD CONSTRAINT FKInstitucionUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Institucion
ADD CONSTRAINT FKInstitucionUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE InstitucionEducativa
ADD CONSTRAINT FKInstitucionEducativaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE InstitucionEducativa
ADD CONSTRAINT FKInstitucionEducativaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Instrumento
ADD CONSTRAINT FKInstrumentoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Instrumento
ADD CONSTRAINT FKInstrumentoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Mobiliario
ADD CONSTRAINT FKMobiliarioUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Mobiliario
ADD CONSTRAINT FKMobiliarioUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Pase
ADD CONSTRAINT FKPaseUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Pase
ADD CONSTRAINT FKPaseUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Reactivo
ADD CONSTRAINT FKReactivoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Reactivo
ADD CONSTRAINT FKReactivoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Reporte
ADD CONSTRAINT FKReporteUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Reporte
ADD CONSTRAINT FKReporteUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoCertificado
ADD CONSTRAINT FKTipoCertificadoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoCertificado
ADD CONSTRAINT FKTipoCertificadoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoEmpleado
ADD CONSTRAINT FKTipoEmpleadoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoEmpleado
ADD CONSTRAINT FKTipoEmpleadoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoInstitucion
ADD CONSTRAINT FKTipoInstitucionUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoInstitucion
ADD CONSTRAINT FKTipoInstitucionUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoInstrumento
ADD CONSTRAINT FKTipoInstrumentoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoInstrumento
ADD CONSTRAINT FKTipoInstrumentoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoMobiliario
ADD CONSTRAINT FKTipoMobiliarioUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoMobiliario
ADD CONSTRAINT FKTipoMobiliarioUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoPase
ADD CONSTRAINT FKTipoPaseUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoPase
ADD CONSTRAINT FKTipoPaseUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoVisita
ADD CONSTRAINT FKTipoVisitaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoVisita
ADD CONSTRAINT FKTipoVisitaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Visita
ADD CONSTRAINT FKVisitaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Visita
ADD CONSTRAINT FKVisitaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Visitante
ADD CONSTRAINT FKVisitanteUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Visitante
ADD CONSTRAINT FKVisitanteUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE DepartamentoReactivo
ADD CONSTRAINT FKDepartamentoReactivoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE DepartamentoReactivo
ADD CONSTRAINT FKDepartamentoReactivoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE DonacionInstitucion
ADD CONSTRAINT FKDonacionInstitucionUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE DonacionInstitucion
ADD CONSTRAINT FKDonacionInstitucionUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE EmpleadoEspecialidad
ADD CONSTRAINT FKEmpleadoEspecialidadUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE EmpleadoEspecialidad
ADD CONSTRAINT FKEmpleadoEspecialidadUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE EmpleadoEquipo
ADD CONSTRAINT FKEmpleadoEquipoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE EmpleadoEquipo
ADD CONSTRAINT FKEmpleadoEquipoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE EmpleadoInstitucion
ADD CONSTRAINT FKEmpleadoInstitucionUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE EmpleadoInstitucion
ADD CONSTRAINT FKEmpleadoInstitucionUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Caso
ADD CONSTRAINT FKCasoEquipo FOREIGN KEY (idEquipo)
REFERENCES Equipo(idEquipo)

ALTER TABLE Caso
ADD CONSTRAINT FKCasoEspecialidad FOREIGN KEY (idEspecialidad)
REFERENCES Especialidad(idEspecialidad)

ALTER TABLE Certificado
ADD CONSTRAINT FKCertificadoInstitucionEducativa FOREIGN KEY (idInstitucion)
REFERENCES InstitucionEducativa(idInstitucionEducativa)

ALTER TABLE Certificado
ADD CONSTRAINT FKCertificadoTipoCertificado FOREIGN KEY (idTipoCertificado)
REFERENCES TipoCertificado(idTipoCertificado)

ALTER TABLE Certificado
ADD CONSTRAINT FKCertificadoEmpleado FOREIGN KEY (idEmpleado)
REFERENCES Empleado(idEmpleado)

ALTER TABLE Donacion
ADD CONSTRAINT FKDonacionBeneficiario FOREIGN KEY (idBeneficiario)
REFERENCES Beneficiario(idBeneficiario)

ALTER TABLE Empleado
ADD CONSTRAINT FKEmpleadoTipoEmpleado FOREIGN KEY (idTipoEmpleado)
REFERENCES TipoEmpleado(idTipoEmpleado)

ALTER TABLE Especialidad
ADD CONSTRAINT FKEspecialidadDepartamento FOREIGN KEY (idDepartamento)
REFERENCES Departamento(idDepartamento)

ALTER TABLE Institucion
ADD CONSTRAINT FKInstitucionTipoInstitucion FOREIGN KEY (idTipoInstitucion)
REFERENCES TipoInstitucion(idTipoInstitucion)

ALTER TABLE Instrumento
ADD CONSTRAINT FKInstrumentoTipoInstrumento FOREIGN KEY (idTipoInstrumento)
REFERENCES TipoInstrumento(idTipoInstrumento)

ALTER TABLE Instrumento
ADD CONSTRAINT FKInstrumentoDepartamento FOREIGN KEY (idDepartamento)
REFERENCES Departamento(idDepartamento)

ALTER TABLE Mobiliario
ADD CONSTRAINT FKMobiliarioTipoMobiliario FOREIGN KEY (idTipoMobiliario)
REFERENCES TipoMobiliario(idTipoMobiliario)

ALTER TABLE Mobiliario
ADD CONSTRAINT FKMobiliarioDepartamento FOREIGN KEY (idDepartamento)
REFERENCES Departamento(idDepartamento)

ALTER TABLE Pase
ADD CONSTRAINT FKPaseTipoPase FOREIGN KEY (idTipoPase)
REFERENCES TipoPase(idTipoPase)

ALTER TABLE Pase
ADD CONSTRAINT FKPaseInstitucion FOREIGN KEY (idInstitucion)
REFERENCES Institucion(idInstitucion)

ALTER TABLE Reporte
ADD CONSTRAINT FKReporteCaso FOREIGN KEY (idCaso)
REFERENCES Caso(idCaso)

ALTER TABLE Reporte
ADD CONSTRAINT FKReporteEmpleadoEntrega FOREIGN KEY (idEmpleadoEntrega)
REFERENCES Empleado(idEmpleado)

ALTER TABLE Reporte
ADD CONSTRAINT FKReporteEmpleadoRecibe FOREIGN KEY (idEmpleadoRecibe)
REFERENCES Empleado(idEmpleado)

ALTER TABLE Visita
ADD CONSTRAINT FKVisitaTipoVisita FOREIGN KEY (idTipoVisita)
REFERENCES TipoVisita(idTipoVisita)

ALTER TABLE Visita
ADD CONSTRAINT FKVisitaVisitante FOREIGN KEY (idVisitante)
REFERENCES Visitante(idVisitante)

ALTER TABLE Visita
ADD CONSTRAINT FKVisitaPase FOREIGN KEY (idPase)
REFERENCES Pase(idPase)

ALTER TABLE DepartamentoReactivo
ADD CONSTRAINT FKDepartamentoReactivoDepartamento FOREIGN KEY (idDepartamento)
REFERENCES Departamento(idDepartamento)

ALTER TABLE DepartamentoReactivo
ADD CONSTRAINT FKDepartamentoReactivoReactivo FOREIGN KEY (idReactivo)
REFERENCES Reactivo(idReactivo)

ALTER TABLE DonacionInstitucion
ADD CONSTRAINT FKDonacionInstitucionDonacion FOREIGN KEY (idDonacion)
REFERENCES Donacion(idDonacion)

ALTER TABLE DonacionInstitucion
ADD CONSTRAINT FKDonacionInstitucionInstitucion FOREIGN KEY (idInstitucion)
REFERENCES Institucion(idInstitucion)

ALTER TABLE EmpleadoEspecialidad
ADD CONSTRAINT FKEmpleadoEspecialidadEmpleado FOREIGN KEY (idEmpleado)
REFERENCES Empleado(idEmpleado)

ALTER TABLE EmpleadoEspecialidad
ADD CONSTRAINT FKEmpleadoEspecialidadEspecialidad FOREIGN KEY (idEspecialidad)
REFERENCES Especialidad(idEspecialidad)

ALTER TABLE EmpleadoEquipo
ADD CONSTRAINT FKEmpleadoEquipoEmpleado FOREIGN KEY (idEmpleado)
REFERENCES Empleado(idEmpleado)

ALTER TABLE EmpleadoEquipo
ADD CONSTRAINT FKEmpleadoEquipoEquipo FOREIGN KEY (idEquipo)
REFERENCES Equipo(idEquipo)

ALTER TABLE EmpleadoInstitucion
ADD CONSTRAINT FKEmpleadoInstitucionEmpleado FOREIGN KEY (idEmpleado)
REFERENCES Empleado(idEmpleado)

ALTER TABLE EmpleadoInstitucion
ADD CONSTRAINT FKEmpleadoInstitucionInstitucion FOREIGN KEY (idInstitucion)
REFERENCES Institucion(idInstitucion)

--INSERT

INSERT INTO Usuario (nombre, apellidoPaterno, apellidoMaterno, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Miriam Priscila', 'Moreno', 'Reyna', 'I19050460@monclova.tecnm.mx', 'Tec12345.', 1, GETDATE())
GO

INSERT INTO Beneficiario (nombre, rfc, idUsuarioCrea, fechaCrea)
    VALUES ('Grupo Cantilever', 'CLV890521FDS', 1, GETDATE()),
           ('Fundación General CISC', 'FGC631208D4E', 1, GETDATE()),
           ('Grupo SCAI', 'SCA200522RED', 1, GETDATE()),
           ('WATT ESTUDIO', 'WAT750417ER3', 1, GETDATE()),
           ('ALWYN INC.', 'SWI170513189', 1, GETDATE()),
           ('SCOTT ENT', 'SCT891213ER4', 1, GETDATE()),
           ('Fundación SKJN', 'KSJ9212023ED', 1, GETDATE()),
           ('Grupo Min', 'MYG930309SW3', 1, GETDATE()),
           ('TAE INC', 'KOT951230TRE', 1, GETDATE()),
           ('Fundación Namu', 'KNJ940912MCL', 1, GETDATE())
GO

INSERT INTO Departamento (nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Antropología', 1, GETDATE()),
           ('Restauración y conservación', 1, GETDATE()),
           ('Historia del arte', 1, GETDATE()),
           ('Historia de la lingüistica', 1, GETDATE()),
           ('Historia nacional', 1, GETDATE()),
           ('Biología', 1, GETDATE()),
           ('Paleontología', 1, GETDATE()),
           ('Historia universal', 1, GETDATE()),
           ('Cosmología', 1, GETDATE()),
           ('Historia de la religión', 1, GETDATE())
GO

INSERT INTO Donacion (fecha, valor, idBeneficiario, idUsuarioCrea, fechaCrea)
    VALUES ('2021-10-31', 35000, 3, 1, GETDATE()),
           ('2021-10-31', 45000, 7, 1, GETDATE()),
           ('2021-11-25', 85300, 10, 1, GETDATE()),
           ('2021-12-12', 100500, 8, 1, GETDATE()),
           ('2021-12-24', 200000, 10, 1, GETDATE()),
           ('2022-01-28', 95000, 2, 1, GETDATE()),
           ('2022-02-12', 105000, 1, 1, GETDATE()),
           ('2022-02-24', 80200, 5, 1, GETDATE()),
           ('2022-03-10', 90000, 3, 1, GETDATE()),
           ('2022-04-20', 120000, 2, 1, GETDATE())
GO

INSERT INTO Equipo (codigo, idUsuarioCrea, fechaCrea)
    VALUES ('EJ-101', 1, GETDATE()),
           ('EJ-102', 1, GETDATE()),
           ('EJ-103', 1, GETDATE()),
           ('EJ-104', 1, GETDATE()),
           ('EJ-105', 1, GETDATE()),
           ('EJ-106', 1, GETDATE()),
           ('EJ-107', 1, GETDATE()),
           ('EJ-108', 1, GETDATE()),
           ('EJ-109', 1, GETDATE()),
           ('EJ-110', 1, GETDATE())
GO

INSERT INTO Especialidad (nombre, descripcion, idDepartamento, idUsuarioCrea, fechaCrea)
    VALUES ('Antropología forense', 'Aplicación de la ciencia de la antropología física o antropología biológica al proceso legal.', 1,  1, GETDATE()),
           ('Antropología filosófica', 'Se ocupa de las incertidumbres de índole ontológica, centrado su atención en el ser humano.', 1, 1, GETDATE()),
           ('Arqueoastronomía', 'Estudio del cómo las poblaciones del pasado «entendieron el fenómeno del cielo, cómo usaron estos fenómenos y cuál fue el papel del cielo en sus culturas».​', 9, 1, GETDATE()),
           ('Arquitectura', 'Arte y la técnica de proyectar, diseñar y construir, ​modificando el hábitat humano, estudiando la estética, el buen uso y la función de los espacios.', 3, 1, GETDATE()),
           ('Arte de la edad moderna', 'Subdivisión temporal de la historia del arte que corresponde a la Edad Moderna.', 3, 1, GETDATE()),
           ('Estudios medievales', 'Período histórico de la civilización occidental comprendido entre los siglos V y XV.', 8, 1, GETDATE()),
           ('Mitología griega', 'Conjunto de mitos y leyendas pertenecientes a la cultura de la Antigua Grecia.', 10,  1, GETDATE()),
           ('Mitología egipcia', 'Estudio de creencias sustentadas en la religión del Antiguo Egipto', 10, 1, GETDATE()),
           ('Entomología', 'Estudio científico de los insectos.', 6, 1, GETDATE()),
           ('Lingüística histórica', 'Estudio del cambio de las lenguas con el tiempo y el proceso de cambio lingüístico.', 4, 1, GETDATE())
GO

INSERT INTO TipoCertificado (nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Certificación de cursos aprobados', 1, GETDATE()),
           ('Certificación de historia académica', 1, GETDATE()),
           ('Certificación de egresado', 1, GETDATE()),
           ('Certificación de reconocimiento y/o equiparación título y/o grado académico', 1, GETDATE()),
           ('Certificación especial', 1, GETDATE()),
           ('Certificación de Título, (Estudiantes en condición de graduando ó graduado)', 1, GETDATE()),
           ('Certificación de idoneidad, suficiencia, aptitud superior, autorizado, (Salida Lateral)', 1, GETDATE()),
           ('Certificación especial', 1, GETDATE()),
           ('Certificación de estudiante', 1, GETDATE()),
           ('Certificación de materias pendientes', 1, GETDATE())
GO

INSERT INTO TipoEmpleado(nombre, descripcion, sueldoBase, idUsuarioCrea, fechaCrea)
    VALUES ('Director', 'Dirección de instituto', 25000, 1, GETDATE()),
           ('Vigilante de seguridad', 'Vigilancia de puertas, exhibiciones y laboratorios', 8750, 1, GETDATE()),
           ('Intendente', 'Limpieza del instituto', 8000, 1, GETDATE()),
           ('Documentalista', 'Documentación de las investigaciones del museo', 25000, 1, GETDATE()),
           ('Investigador', 'Investigador para el laboratortio', 15000, 1, GETDATE()),
           ('Pasante', 'Estudiante que realiza prácticas profesionales.', 8000, 1, GETDATE()),
           ('Director de departamento', 'Dirección de departamento', 15000, 1, GETDATE()),
           ('Recepcionista', 'Recibimiento de visitantes', 9000, 1, GETDATE()),
           ('Externo', 'Empleado externo al instituto', 0, 1, GETDATE()),
           ('Mantenimiento', 'Mantenimiento del instituto', 8000, 1, GETDATE())
GO

INSERT INTO TipoInstitucion (nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Museo', 1, GETDATE()),
           ('Centro de investigación', 1, GETDATE()),
           ('Zoológico', 1, GETDATE()),
           ('Editorial', 1, GETDATE()),
           ('Tienda', 1, GETDATE()),
           ('Observatorio', 1, GETDATE()),
           ('Invernadero', 1, GETDATE()),
           ('Acuario', 1, GETDATE()),
           ('Biblioteca', 1, GETDATE()),
           ('Centro de estudios', 1, GETDATE())
GO

INSERT INTO TipoInstrumento (nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Embudo de vidrio', 1, GETDATE()),
           ('Vaso precipitado', 1, GETDATE()),
           ('Matraz volumétrico', 1, GETDATE()),
           ('Frasco de reactivo', 1, GETDATE()),
           ('Condensador de espiral', 1, GETDATE()),
           ('Probeta milimetrada', 1, GETDATE()),
           ('Pipeta', 1, GETDATE()),
           ('Mechero de bunsen', 1, GETDATE()),
           ('Rejilla de asbesto', 1, GETDATE()),
           ('Tubo de ensayo', 1, GETDATE())
GO

INSERT INTO TipoMobiliario(nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Mesa de laboratorio central', 1, GETDATE()),
           ('Armario de seguridad', 1, GETDATE()),
           ('Campana de gas', 1, GETDATE()),
           ('Silla de laboratorio', 1, GETDATE()),
           ('Lavador de gases', 1, GETDATE()),
           ('Fregadero', 1, GETDATE()),
           ('Cajonera', 1, GETDATE()),
           ('Estantería', 1, GETDATE()),
           ('Taburete', 1, GETDATE()),
           ('Mesa de laboratorio mural', 1, GETDATE())
GO

INSERT INTO TipoPase (nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Estudiante', 1, GETDATE()),
           ('Pasante', 1, GETDATE()),
           ('Visitante', 1, GETDATE()),
           ('Empleado externo', 1, GETDATE()),
           ('Empleado interno', 1, GETDATE()),
           ('Exhibición', 1, GETDATE()),
           ('Invitado', 1, GETDATE()),
           ('Prensa', 1, GETDATE()),
           ('Socio', 1, GETDATE()),
           ('Personal', 1, GETDATE())
GO

INSERT INTO TipoVisita(nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Educativa', 1, GETDATE()),
           ('Prensa', 1, GETDATE()),
           ('Corporativa', 1, GETDATE()),
           ('Evento', 1, GETDATE()),
           ('Empresarial', 1, GETDATE()),
           ('Trabajo interno', 1, GETDATE()),
           ('Trabajo externo', 1, GETDATE()),
           ('Administrativa', 1, GETDATE()),
           ('Gubernamental', 1, GETDATE()),
           ('Personal', 1, GETDATE())
GO

INSERT INTO Visitante (nombre, apellidoPaterno, apellidoMaterno, correo, telefono, fechaNacimiento, dni, idUsuarioCrea, fechaCrea)
    VALUES ('Namjoon', 'Kim', '', 'namgreen@gmail.com', '8226672918', '1994-09-12', '1425369685741', 1, GETDATE()),
           ('Seokjin', 'Kim', '', 'wwhuknow@hotmail.com', '8220964892', '1992-12-04','2014785345129', 1, GETDATE()),
           ('Yoongi', 'Min', '', 'tangerinedark@gmail.com', '8223902765', '1993-03-09','0193749878321', 1, GETDATE()),
           ('Hoseok', 'Jung', '', 'urhope@yahoo.com', '8226397201', '1994-02-18', '0198327454253', 1, GETDATE()),
           ('Jimin', 'Park', '', 'lachimolala@hotmail.com', '8228495027', '1995-10-13', '7412589630147', 1, GETDATE()),
           ('Taehyung', 'Kim', '', 'blueandgrey@hotmail.com', '8224839672', '1995-12-30', '0123996334111', 1, GETDATE()),
           ('Jungkook', 'Jeon', '', 'lovearmy@hotmail.com', '8225362500', '1997-09-01', '0123354784155', 1, GETDATE()),
           ('Micol', 'Alanis', 'López', 'alanismicol@hotmail.com', '8661397396', '1995-04-20', '0007864552179', 1, GETDATE()),
           ('Max', 'Alanis', 'López', 'maxiblue@hotmail.com', '8661245790', '1989-12-13', '1035574122985', 1, GETDATE()),
           ('Adele', 'Blue', 'Adkins', 'easyonmail@hotmail.com', '0203827156', '1988-05-05', '7895555441238', 1, GETDATE())
GO

INSERT INTO Empleado (numero, nombre, apellidoPaterno, apellidoMaterno, genero, ciudad, pais, fechaNacimiento, rfc, dni, idTipoEmpleado, idUsuarioCrea, fechaCrea)
    VALUES ('12345', 'Temperance', 'Brennan', '', 'FEM','Washington D. C.', 'Estados Unidos de América', '1976-01-10', 'BRET760110JGS', '6387419601247', 5, 1, GETDATE()),
           ('67891', 'Seeley Joseph', 'Booth', '', 'MAS', 'Filadelfia', 'Pensilvania', '1971-11-12', 'BOSJ7111128DE', '9317000123210', 9, 1, GETDATE()),
           ('01112', 'Camille', 'Saroyan', '', 'FEM', 'Managua', 'Nicaragua', '1970-07-22', 'SACA700722FRE', '7845123260000', 7, 1, GETDATE()),
           ('13141', 'Angela', 'Montenegro', '', 'FEM', 'Washington D. C.', 'Estados Unidos de América', '1978-04-16', 'MOAG780416LJE', '7403927412013', 5, 1, GETDATE()),
           ('51617', 'Zackary Uriah', 'Addy ', '', 'MAS', 'Lansing', 'Michigan', '1981-12-30', 'ADZA811230PIR', '1000789014520', 5, 1, GETDATE()),
           ('18192', 'Jonathan', 'Hodgins', '', 'MAS', 'Washington D. C.', 'Estados Unidos de América', '1976-09-20', 'HOJA760920EDS', '7830196874444', 5, 1, GETDATE()),
           ('02122', 'Vincent', 'Nigel-Murray', '', 'MAS', 'Londres', 'Reino Unido', '1990-09-16', 'NIVI900916TRE', '7896540000130', 6, 1, GETDATE()),           
           ('52627', 'Lance ', 'Sweets', '', 'MAS', 'Washington D. C.', 'Estados Unidos de América', '1985-02-27', 'SWLA850227LKA', '1023988877453', 7, 1, GETDATE()),
           ('28293', 'Jessica', 'Warren', '', 'FEM', 'Monterey', 'California', '1992-05-14', 'WAJE920514CSZ', '9630167981560', 6, 1, GETDATE()),
           ('28545', 'Jorge', 'Pérez', 'Sánchez', 'MAS', 'Monterrey', 'México', '1988-05-14', 'PESJ880514CSZ', '9630167981560', 6, 1, GETDATE())
GO

INSERT INTO Institucion (nombre, codigo, ciudad, pais, idTipoInstitucion, idUsuarioCrea, fechaCrea)
    VALUES ('Galería Arthur M. Sackler', 'IT-101', 'Washington D. C.', 'Estados Unidos de América', 1, 1, GETDATE()),
           ('Museo Nacional del Aire y el Espacio de Estados Unidos', 'IT-102', 'Washington D. C.', 'Estados Unidos de América', 1, 1, GETDATE()),
           ('Parque Zoológico Nacional del Jeffersonian', 'IT-103', 'Washington D. C.', 'Estados Unidos de América', 3, 1, GETDATE()),
           ('Museo Nacional de Diseño Cooper-Hewitt', 'IT-104', 'Nueva York', 'Estados Unidos de América', 1, 1, GETDATE()),
           ('Edificio de las Artes y la Industria', 'IT-105', 'Washington D. C.', 'Estados Unidos de América', 3, 1, GETDATE()),
           ('Biblioteca del Instituto Jeffersonian', 'IT-106', 'Washington D. C.', 'Estados Unidos de América', 10, 1, GETDATE()),
           ('Instituto Jeffersoniano de Investigaciones Tropicales', 'IT-107', 'Barro Colorado', 'Panamá', 2, 1, GETDATE()),
           ('Centro de Estudios Planetarios y de la Tierra', 'IT-108', 'Washington D. C.', 'Estados Unidos de América', 6, 1, GETDATE()),
           ('Museo Nacional de Arte y Cultura Afroamericana', 'IT-109', 'Nueva York', 'Estados Unidos de América', 4, 1, GETDATE()),
           ('Instituto Jeffersonian', 'IT-110', 'Washington D. C.', 'Estados Unidos de América', 2, 1, GETDATE())
GO

INSERT INTO InstitucionEducativa (nombre, ciudad, estado, pais, idUsuarioCrea, fechaCrea)
    VALUES ('Northwestern University', 'Chicago', 'Illinois', 'Estados Unidos de América', 1, GETDATE()),
           ('Universidad de Harvard', 'Cambridge', 'Massachusetts', 'Estados Unidos de América', 1, GETDATE()),
           ('Instituto de Tecnología de Massachusetts', 'Cambridge', 'Massachusetts', 'Estados Unidos de América', 1, GETDATE()),
           ('Universidad de California', 'Berkeley', 'California', 'Estados Unidos de América', 1, GETDATE()),
           ('Universidad de Oxford', 'Oxford', 'Inglaterra', 'Reino Unido',  1, GETDATE()),
           ('Universidad de Columbia', 'Nueva York', 'Nueva York', 'Estados Unidos de América', 1, GETDATE()),
           ('Universidad de Cambridge', 'Cambridge', 'Inglaterra', 'Reino Unido',  1, GETDATE()),
           ('Instituto de Tecnología de California Caltech', 'Pasadena', 'California', 'Estados Unidos de América', 1, GETDATE()),
           ('Universidad Johns Hopkins', 'Baltimore', 'Maryland', 'Estados Unidos de América', 1, GETDATE()),
           ('Universidad de Washington', 'Seattle', 'Washington', 'Estados Unidos de América', 1, GETDATE())
GO

INSERT INTO Instrumento (codigo, idTipoInstrumento, idDepartamento, idUsuarioCrea, fechaCrea)
    VALUES ('IN-100', 3, 2, 1, GETDATE()),
           ('IN-101', 3, 2, 1, GETDATE()),
           ('IN-102', 3, 1, 1, GETDATE()),
           ('IN-103', 9, 1, 1, GETDATE()),
           ('IN-104', 9, 1, 1, GETDATE()),
           ('IN-105', 10, 1, 1, GETDATE()),
           ('IN-106', 10, 1, 1, GETDATE()),
           ('IN-107', 7, 6, 1, GETDATE()),
           ('IN-108', 8, 1, 1, GETDATE()),
           ('IN-109', 4, 1, 1, GETDATE())
GO

INSERT INTO Mobiliario (codigo, idTipoMobiliario, idDepartamento, idUsuarioCrea, fechaCrea)
    VALUES ('M-100', 1, 1, 1, GETDATE()),
           ('M-101', 1, 1, 1, GETDATE()),
           ('M-102', 1, 1, 1, GETDATE()),
           ('M-103', 10, 1, 1, GETDATE()),
           ('M-104', 10, 1, 1, GETDATE()),
           ('M-105', 3, 1, 1, GETDATE()),
           ('M-106', 3, 6, 1, GETDATE()),
           ('M-107', 3, 6, 1, GETDATE()),
           ('M-108', 2, 6, 1, GETDATE()),
           ('M-109', 2, 1, 1, GETDATE())
GO

INSERT INTO Pase (codigo, fechaInicio, fechaFinal, idTipoPase, idInstitucion, idUsuarioCrea, fechaCrea)
    VALUES ('P-100', '2022-04-01', '2022-04-10', 10, 4, 1, GETDATE()),
           ('P-101', '2022-04-04', '2022-04-15', 10, 4, 1, GETDATE()),
           ('P-102', '2022-04-05', '2022-04-20', 10, 2, 1, GETDATE()),
           ('P-103', '2022-04-05', '2022-04-20', 10, 2, 1, GETDATE()),
           ('P-104', '2022-04-05', '2022-04-20', 10, 2, 1, GETDATE()),
           ('P-105', '2022-04-05', '2022-04-30', 10, 2, 1, GETDATE()),
           ('P-106', '2022-04-10', '2022-04-10', 10, 1, 1, GETDATE()),
           ('P-107', '2022-04-10', '2022-04-10', 10, 1, 1, GETDATE()),
           ('P-108', '2022-04-15', '2022-04-15', 10, 8, 1, GETDATE()),
           ('P-109', '2022-04-15', '2022-04-15', 10, 8, 1, GETDATE())
GO

INSERT INTO Reactivo (nombre, formula, tipo, idUsuarioCrea, fechaCrea)
    VALUES ('Ácido acético', 'CH3COOH', 'L', 1, GETDATE()),
           ('Ácido fluorhídrico', 'HF', 'L', 1, GETDATE()),
           ('Anilina', 'C6H5NH2', 'L', 1, GETDATE()),
           ('Tolueno', 'C7H8', 'L', 1, GETDATE()),
           ('Naftalina', 'C10H8', 'S', 1, GETDATE()),
           ('Benceno', 'C6H6', 'L', 1, GETDATE()),
           ('Butano', 'C4H10', 'G', 1, GETDATE()),
           ('Propano', 'C3H8', 'L', 1, GETDATE()),
           ('Isopreno', 'C5H8', 'L', 1, GETDATE()),
           ('Ciclohexanol', 'C6H12O', 'L', 1, GETDATE())
GO

INSERT INTO Visita (codigo, fecha, idTipoVisita, idVisitante, idPase, idUsuarioCrea, fechaCrea)
    VALUES ('V-101', '2022-04-01', 7, 1, 1, 1, GETDATE()),
           ('V-102', '2022-04-02', 7, 1, 1, 1, GETDATE()),
           ('V-103', '2022-04-05', 7, 1, 1, 1, GETDATE()),
           ('V-104', '2022-04-10', 1, 7, 7, 1, GETDATE()),
           ('V-105', '2022-04-10', 1, 9, 8, 1, GETDATE()),
           ('V-106', '2022-04-15', 2, 8, 9, 1, GETDATE()),
           ('V-107', '2022-04-15', 2, 10, 10, 1, GETDATE()),
           ('V-108', '2022-04-20', 6, 2, 6, 1, GETDATE()),
           ('V-109', '2022-04-20', 6, 3, 5, 1, GETDATE()),
           ('V-110', '2022-04-21', 6, 2, 6, 1, GETDATE())
GO

INSERT INTO Caso (codigo, estado, fechaInicio, idEquipo, idEspecialidad, idUsuarioCrea, fechaCrea)
    VALUES ('C-100', 'A', '2022-01-28', 1, 1, 1, GETDATE()),
           ('C-101', 'A', '2022-02-04', 2, 9, 1, GETDATE()),
           ('C-102', 'A', '2022-02-05', 1, 1, 1, GETDATE()),
           ('C-103', 'A', '2022-02-18', 2, 2, 1, GETDATE()),
           ('C-104', 'A', '2022-03-09', 3, 1, 1, GETDATE()),
           ('C-105', 'A', '2022-03-13', 1, 1, 1, GETDATE()),
           ('C-106', 'A', '2022-03-14', 5, 6, 1, GETDATE()),
           ('C-108', 'A', '2022-04-03', 6, 9, 1, GETDATE()),
           ('C-109', 'A', '2022-04-20', 1, 9, 1, GETDATE()),
           ('C-110', 'A', '2022-04-20', 10, 1, 1, GETDATE())
GO

INSERT INTO Certificado (codigo, idInstitucion, fecha, ciudad, pais, idTipoCertificado, idEmpleado, idUsuarioCrea, fechaCrea)
    VALUES ('A584', 1, '1999-02-17', 'Washington D. C.', 'Estados Unidos de América', 1, 1, 1, GETDATE()),
           ('54G5D', 1, '2001-06-15', 'Washington D. C.', 'Estados Unidos de América', 6, 1, 1, GETDATE()),
           ('R4GG', 1, '2003-08-20', 'Washington D. C.', 'Estados Unidos de América', 6, 1, 1, GETDATE()),
           ('EDX7', 6, '2003-07-19', 'Nueva York', 'Estados Unidos de América', 1, 4, 1, GETDATE()),
           ('TXT5', 9, '2002-12-05', 'Baltimore', 'Maryland', 1, 6, 1, GETDATE()),
           ('ENH7', 9, '2003-01-11', 'Baltimore', 'Maryland', 6, 6, 1, GETDATE()),
           ('BT57', 10, '2004-06-08',  'Washington', 'Estados Unidos de América', 6, 6, 1, GETDATE()),
           ('TW1C3', 1, '2004-06-08',  'Washington', 'Estados Unidos de América', 6, 6, 1, GETDATE()),
           ('3NHYP3N', 5, '2013-06-18', 'Oxford', 'Inglaterra', 1, 7, 1, GETDATE()),
           ('4GU57D', 1, '2012-06-25', 'Washington D. C.', 'Estados Unidos de América', 1, 9, 1, GETDATE())
GO

INSERT INTO Reporte (codigo, idCaso, fechaEntrega, idEmpleadoEntrega, idEmpleadoRecibe, idUsuarioCrea, fechaCrea)
    VALUES ('R-100', 5, '2022-03-10', 5, 3, 1, GETDATE()),
           ('R-101', 5, '2022-03-11', 5, 3, 1, GETDATE()),
           ('R-102', 6, '2022-03-13', 4, 3, 1, GETDATE()),
           ('R-103', 5, '2022-03-15', 4, 3, 1, GETDATE()),
           ('R-104', 7, '2022-03-15', 1, 3, 1, GETDATE()),
           ('R-105', 6, '2022-03-17', 5, 3, 1, GETDATE()),
           ('R-106', 8, '2022-04-04', 5, 3, 1, GETDATE()),
           ('R-107', 8, '2022-04-06', 7, 1, 1, GETDATE()),
           ('R-108', 10, '2022-04-21', 7, 1, 1, GETDATE()),
           ('R-109', 10, '2022-04-24', 6, 3, 1, GETDATE())
GO

INSERT INTO DepartamentoReactivo (idDepartamento, idReactivo, lote, codigo, fechaEmpaque, fechaCaducidad, idUsuarioCrea, fechaCrea)
    VALUES (1, 1, '10000', 'R-100', '2022-02-01', '2022-12-31', 1, GETDATE()),
           (1, 1, '10000', 'R-101', '2022-02-10', '2022-12-31', 1, GETDATE()),
           (1, 3, '10003', 'R-130', '2022-02-10', '2022-10-01', 1, GETDATE()),
           (2, 3, '10003', 'R-131', '2022-02-20', '2022-10-10', 1, GETDATE()),
           (3, 3, '10003', 'R-132', '2022-02-20', '2022-10-10', 1, GETDATE()),
           (3, 6, '10006', 'R-160', '2022-02-20', '2022-06-01', 1, GETDATE()),
           (3, 6, '10006', 'R-161', '2022-02-20', '2022-06-01', 1, GETDATE()),
           (4, 6, '10006', 'R-162', '2022-02-25', '2022-06-10', 1, GETDATE()),
           (1, 2, '10002', 'R-120', '2022-02-04', '2022-04-20', 1, GETDATE()),
           (5, 2, '10002', 'R-121', '2022-02-04', '2022-04-20', 1, GETDATE())
GO

INSERT INTO DonacionInstitucion (idDonacion, idInstitucion, idUsuarioCrea, fechaCrea)
    VALUES (1, 6, 1, GETDATE()),
           (2, 9, 1, GETDATE()),
           (3, 1, 1, GETDATE()),
           (4, 10, 1, GETDATE()),
           (4, 6, 1, GETDATE()),
           (5, 7, 1, GETDATE()),
           (5, 2, 1, GETDATE()),
           (6, 4, 1, GETDATE()),
           (7, 8, 1, GETDATE()),
           (8, 8, 1, GETDATE())

GO

INSERT INTO EmpleadoEspecialidad (idEmpleado, idEspecialidad, idUsuarioCrea, fechaCrea)
    VALUES (1, 1, 1, GETDATE()),
           (1, 2, 1, GETDATE()),
           (4, 5, 1, GETDATE()),
           (5, 7, 1, GETDATE()),
           (5, 8, 1, GETDATE()),
           (5, 1, 1, GETDATE()),
           (9, 1, 1, GETDATE()),
           (7, 1, 1, GETDATE()),
           (5, 3, 1, GETDATE()),
           (6, 9, 1, GETDATE())
GO

INSERT INTO EmpleadoEquipo (idEmpleado, idEquipo, idUsuarioCrea, fechaCrea)
    VALUES (1, 1, 1, GETDATE()),
           (2, 1, 1, GETDATE()),
           (4, 1, 1, GETDATE()),
           (6, 1, 1, GETDATE()),
           (5, 1, 1, GETDATE()),
           (1, 2, 1, GETDATE()),
           (4, 2, 1, GETDATE()),
           (6, 2, 1, GETDATE()),
           (7, 2, 1, GETDATE()),
           (9, 2, 1, GETDATE())


INSERT INTO EmpleadoInstitucion (idEmpleado, idInstitucion, fechaInicio, idUsuarioCrea, fechaCrea)
    VALUES (1, 8, '2004-03-18', 1, GETDATE()),
           (1, 7, '2006-07-20', 1, GETDATE()),
           (6, 10, '2006-08-10', 1, GETDATE()),
           (1, 1, '2006-11-04', 1, GETDATE()),
           (5, 10, '2006-11-05', 1, GETDATE()),
           (4, 1, '2006-12-06', 1, GETDATE()),
           (4, 10, '2007-02-10', 1, GETDATE()),
           (7, 10, '2013-08-20', 1, GETDATE()),
           (8, 10, '2001-06-21', 1, GETDATE()),
           (5, 1, '2010-03-15', 1, GETDATE())
GO

--TRIGGERS FECHA MODIFICA

CREATE TRIGGER BeneficiarioFechaModifica
ON Beneficiario FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idBeneficiario from inserted
UPDATE Beneficiario SET fechaModifica = GETDATE() WHERE idBeneficiario = @idTemp
GO

CREATE TRIGGER CasoFechaModifica
ON Caso FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idCaso from inserted
UPDATE Caso SET fechaModifica = GETDATE() WHERE idCaso = @idTemp
GO

CREATE TRIGGER CertificadoFechaModifica
ON Certificado FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idCertificado from inserted
UPDATE Certificado SET fechaModifica = GETDATE() WHERE idCertificado = @idTemp
GO

CREATE TRIGGER DepartamentoFechaModifica
ON Departamento FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idDepartamento from inserted
UPDATE Departamento SET fechaModifica = GETDATE() WHERE idDepartamento = @idTemp
GO

CREATE TRIGGER DonacionFechaModifica
ON Donacion FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idDonacion from inserted
UPDATE Donacion SET fechaModifica = GETDATE() WHERE idDonacion = @idTemp
GO

CREATE TRIGGER EmpleadoFechaModifica
ON Empleado FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idEmpleado from inserted
UPDATE Empleado SET fechaModifica = GETDATE() WHERE idEmpleado = @idTemp
GO

CREATE TRIGGER EquipoFechaModifica
ON Equipo FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idEquipo from inserted
UPDATE Equipo SET fechaModifica = GETDATE() WHERE idEquipo = @idTemp
GO

CREATE TRIGGER EspecialidadFechaModifica
ON Especialidad FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idEspecialidad from inserted
UPDATE Especialidad SET fechaModifica = GETDATE() WHERE idEspecialidad = @idTemp
GO

CREATE TRIGGER InstitucionFechaModifica
ON Institucion FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idInstitucion from inserted
UPDATE Institucion SET fechaModifica = GETDATE() WHERE idInstitucion = @idTemp
GO

CREATE TRIGGER InstitucionEducativaFechaModifica
ON InstitucionEducativa FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idInstitucionEducativa from inserted
UPDATE InstitucionEducativa SET fechaModifica = GETDATE() WHERE idInstitucionEducativa = @idTemp
GO

CREATE TRIGGER InstrumentoFechaModifica
ON Instrumento FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idInstrumento from inserted
UPDATE Instrumento SET fechaModifica = GETDATE() WHERE idInstrumento = @idTemp
GO

CREATE TRIGGER MobiliarioFechaModifica
ON Mobiliario FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idMobiliario from inserted
UPDATE Mobiliario SET fechaModifica = GETDATE() WHERE idMobiliario = @idTemp
GO

CREATE TRIGGER PaseFechaModifica
ON Pase FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idPase from inserted
UPDATE Pase SET fechaModifica = GETDATE() WHERE idPase = @idTemp
GO

CREATE TRIGGER ReactivoFechaModifica
ON Reactivo FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idReactivo from inserted
UPDATE Reactivo SET fechaModifica = GETDATE() WHERE idReactivo = @idTemp
GO

CREATE TRIGGER ReporteFechaModifica
ON Reporte FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idReporte from inserted
UPDATE Reporte SET fechaModifica = GETDATE() WHERE idReporte = @idTemp
GO

CREATE TRIGGER TipoCertificadoFechaModifica
ON TipoCertificado FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoCertificado from inserted
UPDATE TipoCertificado SET fechaModifica = GETDATE() WHERE idTipoCertificado = @idTemp
GO

CREATE TRIGGER TipoEmpleadoFechaModifica
ON TipoEmpleado FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoEmpleado from inserted
UPDATE TipoEmpleado SET fechaModifica = GETDATE() WHERE idTipoEmpleado = @idTemp
GO

CREATE TRIGGER TipoInstitucionFechaModifica
ON TipoInstitucion FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoInstitucion from inserted
UPDATE TipoInstitucion SET fechaModifica = GETDATE() WHERE idTipoInstitucion = @idTemp
GO

CREATE TRIGGER TipoInstrumentoFechaModifica
ON TipoInstrumento FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoInstrumento from inserted
UPDATE TipoInstrumento SET fechaModifica = GETDATE() WHERE idTipoInstrumento = @idTemp
GO

CREATE TRIGGER TipoMobiliarioFechaModifica
ON TipoMobiliario FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoMobiliario from inserted
UPDATE TipoMobiliario SET fechaModifica = GETDATE() WHERE idTipoMobiliario = @idTemp
GO

CREATE TRIGGER TipoPaseFechaModifica
ON TipoPase FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoPase from inserted
UPDATE TipoPase SET fechaModifica = GETDATE() WHERE idTipoPase = @idTemp
GO

CREATE TRIGGER TipoVisitaFechaModifica
ON TipoVisita FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoVisita from inserted
UPDATE TipoVisita SET fechaModifica = GETDATE() WHERE idTipoVisita = @idTemp
GO

CREATE TRIGGER UsuarioFechaModifica
ON Usuario FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idUsuario from inserted
UPDATE Usuario SET fechaModifica = GETDATE() WHERE idUsuario = @idTemp
GO

CREATE TRIGGER VisitaFechaModifica
ON Visita FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idVisita from inserted
UPDATE Visita SET fechaModifica = GETDATE() WHERE idVisita = @idTemp
GO

CREATE TRIGGER VisitanteFechaModifica
ON Visitante FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idVisitante from inserted
UPDATE Visitante SET fechaModifica = GETDATE() WHERE idVisitante = @idTemp
GO

CREATE TRIGGER DepartamentoReactivoFechaModifica
ON DepartamentoReactivo FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idDepartamentoReactivo from inserted
UPDATE DepartamentoReactivo SET fechaModifica = GETDATE() WHERE idDepartamentoReactivo = @idTemp
GO

CREATE TRIGGER DonacionInstitucionFechaModifica
ON DonacionInstitucion FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idDonacionInstitucion from inserted
UPDATE DonacionInstitucion SET fechaModifica = GETDATE() WHERE idDonacionInstitucion = @idTemp
GO

CREATE TRIGGER EmpleadoEspecialidadFechaModifica
ON EmpleadoEspecialidad FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idEmpleadoEspecialidad from inserted
UPDATE EmpleadoEspecialidad SET fechaModifica = GETDATE() WHERE idEmpleadoEspecialidad = @idTemp
GO

CREATE TRIGGER EmpleadoEquipoFechaModifica
ON EmpleadoEquipo FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idEmpleadoEquipo from inserted
UPDATE EmpleadoEquipo SET fechaModifica = GETDATE() WHERE idEmpleadoEquipo = @idTemp
GO

CREATE TRIGGER EmpleadoInstitucionFechaModifica
ON EmpleadoInstitucion FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idEmpleadoInstitucion from inserted
UPDATE EmpleadoInstitucion SET fechaModifica = GETDATE() WHERE idEmpleadoInstitucion = @idTemp
GO

--TRIGGER FECHA CREA

CREATE TRIGGER BeneficiarioFechaModifica
ON Beneficiario FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idBeneficiario from inserted
UPDATE Beneficiario SET fechaModifica = GETDATE() WHERE idBeneficiario = @idTemp
GO

CREATE TRIGGER CasoFechaModifica
ON Caso FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idCaso from inserted
UPDATE Caso SET fechaModifica = GETDATE() WHERE idCaso = @idTemp
GO

CREATE TRIGGER CertificadoFechaModifica
ON Certificado FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idCertificado from inserted
UPDATE Certificado SET fechaModifica = GETDATE() WHERE idCertificado = @idTemp
GO

CREATE TRIGGER DepartamentoFechaModifica
ON Departamento FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idDepartamento from inserted
UPDATE Departamento SET fechaModifica = GETDATE() WHERE idDepartamento = @idTemp
GO

CREATE TRIGGER DonacionFechaModifica
ON Donacion FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idDonacion from inserted
UPDATE Donacion SET fechaModifica = GETDATE() WHERE idDonacion = @idTemp
GO

CREATE TRIGGER EmpleadoFechaModifica
ON Empleado FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idEmpleado from inserted
UPDATE Empleado SET fechaModifica = GETDATE() WHERE idEmpleado = @idTemp
GO

CREATE TRIGGER EquipoFechaModifica
ON Equipo FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idEquipo from inserted
UPDATE Equipo SET fechaModifica = GETDATE() WHERE idEquipo = @idTemp
GO

CREATE TRIGGER EspecialidadFechaModifica
ON Especialidad FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idEspecialidad from inserted
UPDATE Especialidad SET fechaModifica = GETDATE() WHERE idEspecialidad = @idTemp
GO

CREATE TRIGGER InstitucionFechaModifica
ON Institucion FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idInstitucion from inserted
UPDATE Institucion SET fechaModifica = GETDATE() WHERE idInstitucion = @idTemp
GO

CREATE TRIGGER InstitucionEducativaFechaModifica
ON InstitucionEducativa FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idInstitucionEducativa from inserted
UPDATE InstitucionEducativa SET fechaModifica = GETDATE() WHERE idInstitucionEducativa = @idTemp
GO

CREATE TRIGGER InstrumentoFechaModifica
ON Instrumento FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idInstrumento from inserted
UPDATE Instrumento SET fechaModifica = GETDATE() WHERE idInstrumento = @idTemp
GO

CREATE TRIGGER MobiliarioFechaModifica
ON Mobiliario FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idMobiliario from inserted
UPDATE Mobiliario SET fechaModifica = GETDATE() WHERE idMobiliario = @idTemp
GO

CREATE TRIGGER PaseFechaModifica
ON Pase FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idPase from inserted
UPDATE Pase SET fechaModifica = GETDATE() WHERE idPase = @idTemp
GO

CREATE TRIGGER ReactivoFechaModifica
ON Reactivo FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idReactivo from inserted
UPDATE Reactivo SET fechaModifica = GETDATE() WHERE idReactivo = @idTemp
GO

CREATE TRIGGER ReporteFechaModifica
ON Reporte FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idReporte from inserted
UPDATE Reporte SET fechaModifica = GETDATE() WHERE idReporte = @idTemp
GO

CREATE TRIGGER TipoCertificadoFechaModifica
ON TipoCertificado FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoCertificado from inserted
UPDATE TipoCertificado SET fechaModifica = GETDATE() WHERE idTipoCertificado = @idTemp
GO

CREATE TRIGGER TipoEmpleadoFechaModifica
ON TipoEmpleado FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoEmpleado from inserted
UPDATE TipoEmpleado SET fechaModifica = GETDATE() WHERE idTipoEmpleado = @idTemp
GO

CREATE TRIGGER TipoInstitucionFechaModifica
ON TipoInstitucion FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoInstitucion from inserted
UPDATE TipoInstitucion SET fechaModifica = GETDATE() WHERE idTipoInstitucion = @idTemp
GO

CREATE TRIGGER TipoInstrumentoFechaModifica
ON TipoInstrumento FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoInstrumento from inserted
UPDATE TipoInstrumento SET fechaModifica = GETDATE() WHERE idTipoInstrumento = @idTemp
GO

CREATE TRIGGER TipoMobiliarioFechaModifica
ON TipoMobiliario FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoMobiliario from inserted
UPDATE TipoMobiliario SET fechaModifica = GETDATE() WHERE idTipoMobiliario = @idTemp
GO

CREATE TRIGGER TipoPaseFechaModifica
ON TipoPase FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoPase from inserted
UPDATE TipoPase SET fechaModifica = GETDATE() WHERE idTipoPase = @idTemp
GO

CREATE TRIGGER TipoVisitaFechaModifica
ON TipoVisita FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoVisita from inserted
UPDATE TipoVisita SET fechaModifica = GETDATE() WHERE idTipoVisita = @idTemp
GO

CREATE TRIGGER UsuarioFechaModifica
ON Usuario FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idUsuario from inserted
UPDATE Usuario SET fechaModifica = GETDATE() WHERE idUsuario = @idTemp
GO

CREATE TRIGGER VisitaFechaModifica
ON Visita FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idVisita from inserted
UPDATE Visita SET fechaModifica = GETDATE() WHERE idVisita = @idTemp
GO

CREATE TRIGGER VisitanteFechaModifica
ON Visitante FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idVisitante from inserted
UPDATE Visitante SET fechaModifica = GETDATE() WHERE idVisitante = @idTemp
GO

CREATE TRIGGER DepartamentoReactivoFechaModifica
ON DepartamentoReactivo FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idDepartamentoReactivo from inserted
UPDATE DepartamentoReactivo SET fechaModifica = GETDATE() WHERE idDepartamentoReactivo = @idTemp
GO

CREATE TRIGGER DonacionInstitucionFechaModifica
ON DonacionInstitucion FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idDonacionInstitucion from inserted
UPDATE DonacionInstitucion SET fechaModifica = GETDATE() WHERE idDonacionInstitucion = @idTemp
GO

CREATE TRIGGER EmpleadoEspecialidadFechaModifica
ON EmpleadoEspecialidad FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idEmpleadoEspecialidad from inserted
UPDATE EmpleadoEspecialidad SET fechaModifica = GETDATE() WHERE idEmpleadoEspecialidad = @idTemp
GO

CREATE TRIGGER EmpleadoEquipoFechaModifica
ON EmpleadoEquipo FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idEmpleadoEquipo from inserted
UPDATE EmpleadoEquipo SET fechaModifica = GETDATE() WHERE idEmpleadoEquipo = @idTemp
GO

CREATE TRIGGER EmpleadoInstitucionFechaModifica
ON EmpleadoInstitucion FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idEmpleadoInstitucion from inserted
UPDATE EmpleadoInstitucion SET fechaModifica = GETDATE() WHERE idEmpleadoInstitucion = @idTemp
GO

--TRIGGERS PARA MANTENER LOS REGISTROS EN UNA TABLA (ELIMINAR EL QUE SE INSERTE)

CREATE TRIGGER TipoCertificadoEliminarNuevoRegistro
ON TipoCertificado FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoCertificado from inserted
DELETE FROM TipoCertificado WHERE idTipoCertificado = @idTemp
GO

CREATE TRIGGER TipoEmpleadoEliminarNuevoRegistro
ON TipoEmpleado FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoEmpleado from inserted
DELETE FROM TipoEmpleado WHERE idTipoEmpleado = @idTemp
GO

CREATE TRIGGER TipoInstitucionEliminarNuevoRegistro
ON TipoInstitucion FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoInstitucion from inserted
DELETE FROM TipoInstitucion WHERE idTipoInstitucion = @idTemp
GO

CREATE TRIGGER TipoInstrumentoEliminarNuevoRegistro
ON TipoInstrumento FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoInstrumento from inserted
DELETE FROM TipoInstrumento WHERE idTipoInstrumento = @idTemp
GO

CREATE TRIGGER TipoMobiliarioEliminarNuevoRegistro
ON TipoMobiliario FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoMobiliario from inserted
DELETE FROM TipoMobiliario WHERE idTipoMobiliario = @idTemp
GO

CREATE TRIGGER TipoPaseEliminarNuevoRegistro
ON TipoPase FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoPase from inserted
DELETE FROM TipoPase WHERE idTipoPase = @idTemp
GO

CREATE TRIGGER TipoVisitaEliminarNuevoRegistro
ON TipoVisita FOR INSERT
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoVisita from inserted
DELETE FROM TipoVisita WHERE idTipoVisita = @idTemp
GO

--NO ELIMINA, CAMBIA ESTATUS
CREATE TRIGGER BeneficiarioElimina
ON Beneficiario
INSTEAD OF DELETE
AS
DECLARE @est bit, @idBene int
SET @idBene = (SELECT idBeneficiario FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Beneficiario SET estatus = 0 where idBeneficiario = @idBene
END
GO

CREATE TRIGGER CasoElimina
ON Caso
INSTEAD OF DELETE
AS
DECLARE @est bit, @idCaso int
SET @idCaso = (SELECT idCaso FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Caso SET estatus = 0 where idCaso = @idCaso
END
GO

CREATE TRIGGER CertificadoElimina
ON Certificado
INSTEAD OF DELETE
AS
DECLARE @est bit, @idCertificado int
SET @idCertificado = (SELECT idCertificado FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Certificado SET estatus = 0 where idCertificado = @idCertificado
END
GO

CREATE TRIGGER DepartamentoElimina
ON Departamento
INSTEAD OF DELETE
AS
DECLARE @est bit, @idDepartamento int
SET @idDepartamento = (SELECT idDepartamento FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Departamento SET estatus = 0 where idDepartamento = @idDepartamento
END
GO

CREATE TRIGGER DonacionElimina
ON Donacion
INSTEAD OF DELETE
AS
DECLARE @est bit, @idDonacion int
SET @idDonacion = (SELECT idDonacion FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Donacion SET estatus = 0 where idDonacion = @idDonacion
END
GO

CREATE TRIGGER EmpleadoElimina
ON Empleado
INSTEAD OF DELETE
AS
DECLARE @est bit, @idEmpleado int
SET @idEmpleado = (SELECT idEmpleado FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Empleado SET estatus = 0 where idEmpleado = @idEmpleado
END
GO

CREATE TRIGGER EquipoElimina
ON Equipo
INSTEAD OF DELETE
AS
DECLARE @est bit, @idEquipo int
SET @idEquipo = (SELECT idEquipo FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Equipo SET estatus = 0 where idEquipo = @idEquipo
END
GO

CREATE TRIGGER EspecialidadElimina
ON Especialidad
INSTEAD OF DELETE
AS
DECLARE @est bit, @idEspecialidad int
SET @idEspecialidad = (SELECT idEspecialidad FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Especialidad SET estatus = 0 where idEspecialidad = @idEspecialidad
END
GO

CREATE TRIGGER InstitucionElimina
ON Institucion
INSTEAD OF DELETE
AS
DECLARE @est bit, @idInstitucion int
SET @idInstitucion = (SELECT idInstitucion FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Institucion SET estatus = 0 where idInstitucion = @idInstitucion
END
GO

CREATE TRIGGER InstitucionEducativaElimina
ON InstitucionEducativa
INSTEAD OF DELETE
AS
DECLARE @est bit, @idInstitucionEducativa int
SET @idInstitucionEducativa = (SELECT idInstitucionEducativa FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE InstitucionEducativa SET estatus = 0 where idInstitucionEducativa = @idInstitucionEducativa
END
GO

CREATE TRIGGER InstrumentoElimina
ON Instrumento
INSTEAD OF DELETE
AS
DECLARE @est bit, @idInstrumento int
SET @idInstrumento = (SELECT idInstrumento FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Instrumento SET estatus = 0 where idInstrumento = @idInstrumento
END
GO

CREATE TRIGGER MobiliarioElimina
ON Mobiliario
INSTEAD OF DELETE
AS
DECLARE @est bit, @idMobiliario int
SET @idMobiliario = (SELECT idMobiliario FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Mobiliario SET estatus = 0 where idMobiliario = @idMobiliario
END
GO

CREATE TRIGGER PaseElimina
ON Pase
INSTEAD OF DELETE
AS
DECLARE @est bit, @idPase int
SET @idPase = (SELECT idPase FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Pase SET estatus = 0 where idPase = @idPase
END
GO

CREATE TRIGGER ReactivoElimina
ON Reactivo
INSTEAD OF DELETE
AS
DECLARE @est bit, @idReactivo int
SET @idReactivo = (SELECT idReactivo FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Reactivo SET estatus = 0 where idReactivo = @idReactivo
END
GO

CREATE TRIGGER ReporteElimina
ON Reporte
INSTEAD OF DELETE
AS
DECLARE @est bit, @idReporte int
SET @idReporte = (SELECT idReporte FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Reporte SET estatus = 0 where idReporte = @idReporte
END
GO

CREATE TRIGGER TipoCertificadoElimina
ON TipoCertificado
INSTEAD OF DELETE
AS
DECLARE @est bit, @idTipoCertificado int
SET @idTipoCertificado = (SELECT idTipoCertificado FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE TipoCertificado SET estatus = 0 where idTipoCertificado = @idTipoCertificado
END
GO

CREATE TRIGGER TipoEmpleadoElimina
ON TipoEmpleado
INSTEAD OF DELETE
AS
DECLARE @est bit, @idTipoEmpleado int
SET @idTipoEmpleado = (SELECT idTipoEmpleado FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE TipoEmpleado SET estatus = 0 where idTipoEmpleado = @idTipoEmpleado
END
GO

CREATE TRIGGER TipoInstitucionElimina
ON TipoInstitucion
INSTEAD OF DELETE
AS
DECLARE @est bit, @idTipoInstitucion int
SET @idTipoInstitucion = (SELECT idTipoInstitucion FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE TipoInstitucion SET estatus = 0 where idTipoInstitucion = @idTipoInstitucion
END
GO

CREATE TRIGGER TipoInstrumentoElimina
ON TipoInstrumento
INSTEAD OF DELETE
AS
DECLARE @est bit, @idTipoInstrumento int
SET @idTipoInstrumento = (SELECT idTipoInstrumento FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE TipoInstrumento SET estatus = 0 where idTipoInstrumento = @idTipoInstrumento
END
GO

CREATE TRIGGER TipoMobiliarioElimina
ON TipoMobiliario
INSTEAD OF DELETE
AS
DECLARE @est bit, @idTipoMobiliario int
SET @idTipoMobiliario = (SELECT idTipoMobiliario FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE TipoMobiliario SET estatus = 0 where idTipoMobiliario = @idTipoMobiliario
END
GO

CREATE TRIGGER TipoPaseElimina
ON TipoPase
INSTEAD OF DELETE
AS
DECLARE @est bit, @idTipoPase int
SET @idTipoPase = (SELECT idTipoPase FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE TipoPase SET estatus = 0 where idTipoPase = @idTipoPase
END
GO

CREATE TRIGGER TipoVisitaElimina
ON TipoVisita
INSTEAD OF DELETE
AS
DECLARE @est bit, @idTipoVisita int
SET @idTipoVisita = (SELECT idTipoVisita FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE TipoVisita SET estatus = 0 where idTipoVisita = @idTipoVisita
END
GO

CREATE TRIGGER UsuarioElimina
ON Usuario
INSTEAD OF DELETE
AS
DECLARE @est bit, @idUsuario int
SET @idUsuario = (SELECT idUsuario FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Usuario SET estatus = 0 where idUsuario = @idUsuario
END
GO

CREATE TRIGGER VisitaElimina
ON Visita
INSTEAD OF DELETE
AS
DECLARE @est bit, @idVisita int
SET @idVisita = (SELECT idVisita FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Visita SET estatus = 0 where idVisita = @idVisita
END
GO

CREATE TRIGGER VisitanteElimina
ON Visitante
INSTEAD OF DELETE
AS
DECLARE @est bit, @idVisitante int
SET @idVisitante = (SELECT idVisitante FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE Visitante SET estatus = 0 where idVisitante = @idVisitante
END
GO

CREATE TRIGGER DepartamentoReactivoElimina
ON DepartamentoReactivo
INSTEAD OF DELETE
AS
DECLARE @est bit, @idDepartamentoReactivo int
SET @idDepartamentoReactivo = (SELECT idDepartamentoReactivo FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE DepartamentoReactivo SET estatus = 0 where idDepartamentoReactivo = @idDepartamentoReactivo
END
GO

CREATE TRIGGER DonacionInstitucionElimina
ON DonacionInstitucion
INSTEAD OF DELETE
AS
DECLARE @est bit, @idDonacionInstitucion int
SET @idDonacionInstitucion = (SELECT idDonacionInstitucion FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE DonacionInstitucion SET estatus = 0 where idDonacionInstitucion = @idDonacionInstitucion
END
GO

CREATE TRIGGER EmpleadoEspecialidadElimina
ON EmpleadoEspecialidad
INSTEAD OF DELETE
AS
DECLARE @est bit, @idEmpleadoEspecialidad int
SET @idEmpleadoEspecialidad = (SELECT idEmpleadoEspecialidad FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE EmpleadoEspecialidad SET estatus = 0 where idEmpleadoEspecialidad = @idEmpleadoEspecialidad
END
GO

CREATE TRIGGER EmpleadoEquipoElimina
ON EmpleadoEquipo
INSTEAD OF DELETE
AS
DECLARE @est bit, @idEmpleadoEquipo int
SET @idEmpleadoEquipo = (SELECT idEmpleadoEquipo FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE EmpleadoEquipo SET estatus = 0 where idEmpleadoEquipo = @idEmpleadoEquipo
END
GO

CREATE TRIGGER EmpleadoInstitucionElimina
ON EmpleadoInstitucion
INSTEAD OF DELETE
AS
DECLARE @est bit, @idEmpleadoInstitucion int
SET @idEmpleadoInstitucion = (SELECT idEmpleadoInstitucion FROM deleted)
SET @est = (SELECT estatus FROM deleted)
IF(@est = '1')
BEGIN
UPDATE EmpleadoInstitucion SET estatus = 0 where idEmpleadoInstitucion = @idEmpleadoInstitucion
END
GO

--TRIGGER PARA QUE LAS VISITAS NO SE EDITEN

CREATE TRIGGER VisitaNoSeModifica
ON Visita FOR UPDATE
AS
IF (UPDATE (codigo)) OR (UPDATE(fecha)) OR (UPDATE(idTipoVisita)) OR  (UPDATE(idVisitante)) OR (UPDATE(idPase)) OR (UPDATE(estatus))
BEGIN 
RAISERROR ('POR SEGURIDAD NO SE DEBEN ACTUALIZAR O ELIMINAR LAS VISITAS', 10, 1)
ROLLBACK TRANSACTION
END
GO


-- CREATE TRIGGER DESACTIVAR CERTIFICADO

CREATE TRIGGER PaseTipoPase
ON Pase FOR INSERT
AS
DECLARE @pase int
SELECT @pase = idTipoPase from inserted
IF(@pase = '2')
BEGIN
RAISERROR ('LOS PASES DE PASANTE AHORA SON TAMBIÉN EMPLEADO INTERNO (5)', 10, 1)
ROLLBACK TRANSACTION
END
GO

--NO EDITA EL ESTADO DEL CASO SI NO SE ACTUALIZA LA FECHA

CREATE TRIGGER CasoCerrado
ON Caso FOR UPDATE
AS
IF (UPDATE(estado)) AND NOT (UPDATE(fechaCierre))
BEGIN 
RAISERROR ('NO SE PUEDE ACTUALIZAR EL ESTADO SI NO SE ACTUALIZA  FECHA DE CIERRE', 10, 1)
ROLLBACK TRANSACTION
END
GO

--NO EDITA LOS NOMBRES SI NO SE EDITA RFC

CREATE TRIGGER NombresRFCEmpleado
ON Empleado FOR UPDATE
AS
IF (UPDATE(nombre)) OR (UPDATE(apellidoPaterno)) OR (UPDATE(apellidoPaterno)) AND NOT (UPDATE(rfc))
BEGIN 
RAISERROR ('NO SE PUEDE ACTUALIZAR EL NOMBRE SI NO SE ACTUALIZA EL RFC', 10, 1)
ROLLBACK TRANSACTION
END
GO

--NO EDITA LOTE SI NO SE EDITA LA FECHA EMPAQUE

CREATE TRIGGER ReactivoLote
ON DepartamentoReactivo FOR UPDATE
AS
IF (UPDATE(lote)) AND NOT (UPDATE(fechaEmpaque))
BEGIN 
RAISERROR ('NO SE PUEDE ACTUALIZAR EL LOTE SI NO SE ACTUALIZA FECHA DE EMPAQUE', 10, 1)
ROLLBACK TRANSACTION
END
ELSE 
IF (UPDATE(fechaEmpaque)) AND NOT (UPDATE(fechaCaducidad))
BEGIN
RAISERROR ('NO SE PUEDE ACTUALIZAR LA FECHA DE EMPAQUE SI NO SE ACTUALIZA  FECHA DE CADUCIDAD', 10, 1)
ROLLBACK TRANSACTION
END
GO

--EMPLEADOS EXTERNOS SON VISITANTES

CREATE TRIGGER EmpleadoTipoEmpleado
ON Empleado FOR INSERT
AS
DECLARE @emp int
SELECT @emp = idTipoEmpleado from inserted
IF(@emp = '9')
BEGIN
RAISERROR ('LOS EMPLEADOS EXTERNOS AHORA SE CALIFICAN COMO VISITANTES', 10, 1)
ROLLBACK TRANSACTION
END
GO

--LOS CERTIFICADOS NO SE PUEDEN EDITAR

CREATE TRIGGER CertificadoNombre
ON TipoCertificado FOR UPDATE
AS
IF(UPDATE(nombre))
BEGIN
RAISERROR ('LOS NOMBRES DE LOS CERTIFICADOS NO SE PUEDEN EDITAR', 10, 1)
ROLLBACK TRANSACTION
END
GO

--NO SE EDITA EL SUELDO DE EMPLEADOS EXTERNOS

CREATE TRIGGER EmpleadoSueldo
ON TipoEmpleado FOR UPDATE
AS
DECLARE @idTemp int
SELECT @idTemp = idTipoEmpleado from inserted
IF(@idTemp = 9)
BEGIN
RAISERROR ('EL SUELDO DE LOS EMPLEADOS EXTERNOS NO SE PUEDE EDITAR', 10, 1)
ROLLBACK TRANSACTION
END
GO

--DONACIONES TIPOS

CREATE TRIGGER DonacionInstitucionUna 
ON Donacion FOR INSERT
AS
	IF(SELECT valor from inserted)<100000
		Print 'ESTA DONACIÓN SE PUEDE DESTINAR A UNA INSTITUCION'
GO

CREATE TRIGGER DonacionAInstitucionMedia 
ON Donacion FOR INSERT
AS
	IF(SELECT valor from inserted)<250000 AND (SELECT valor from inserted)>100000
		Print 'ESTA DONACIÓN SE PUEDE DESTINAR A DOS INSTITUCIONES'
GO

CREATE TRIGGER DonacionAInstitucionAlta 
ON Donacion FOR INSERT
AS
	IF(SELECT valor from inserted)>250001 
		Print 'ESTA DONACIÓN SE PUEDE DESTINAR A TRES O MÁS INSTITUCIONES'
GO

--PROCEDIMIENTO PARA VER A CADA BENEFICIARIO Y SUS DONACIONES

CREATE PROCEDURE BeneficiarioDonacion (@idBen int) AS
SELECT b.nombre AS 'Beneficiario', d.fecha AS 'Fecha', d.valor AS 'Valor'
FROM Beneficiario b INNER JOIN Donacion d ON b.idBeneficiario = d.idBeneficiario INNER JOIN DonacionInstitucion e ON d.idDonacion = e.idDonacion
WHERE b.idBeneficiario = @idBen
GO
GO

--PROCEDIMIENTO TOTAL EMPLEADOS ACTIVOS

CREATE PROCEDURE TotalEmpleados 
AS
SELECT COUNT(*) AS 'Total empleados'
FROM Empleado WHERE estatus = 1
GO
GO

--PROCEDIMIENTO EMPLEADO PUESTO ACTUAL

CREATE PROCEDURE EmpleadoPuesto 
AS
SELECT CONCAT(e.nombre, ' ', e.apellidoPaterno, ' ', e.apellidoMaterno) AS 'Nombre empleado', p.nombre AS 'Puesto'
FROM Empleado e INNER JOIN TipoEmpleado p ON e.idTipoEmpleado = p.idTipoEmpleado 
WHERE e.estatus = 1
GO
GO

--PROCEDIMIENTO SEMANAS DE REACTIVOS

CREATE PROCEDURE ReactivoSemanas (@idDepReac int) AS
DECLARE @fechaInicio datetime, @fechaFinal datetime
SET @fechaInicio = (SELECT fechaEmpaque FROM DepartamentoReactivo WHERE idDepartamentoReactivo = @idDepReac)
SET @fechaFinal = (SELECT fechaCaducidad FROM DepartamentoReactivo WHERE idDepartamentoReactivo = @idDepReac)
SELECT DATEDIFF(WEEK, @fechaInicio, @fechaFinal) AS 'Semanas que han pasado'
GO

--PROCEDIMIENTO AÑOS QUE HA TRABAJADO UN EMPLEADO EN UNA INSTITUCION

CREATE PROCEDURE EmpleadoAños (@idEmpInsti int) AS
DECLARE @fechaInicio datetime, @fechaFinal datetime
SET @fechaInicio = (SELECT fechaInicio FROM EmpleadoInstitucion WHERE idEmpleadoInstitucion = @idEmpInsti)
SET @fechaFinal = (SELECT fechaFinal FROM EmpleadoInstitucion WHERE idEmpleadoInstitucion = @idEmpInsti)
SELECT CONCAT(e.nombre, ' ', e.apellidoPaterno, ' ', e.apellidoMaterno) AS 'Nombre empleado', i.nombre AS 'Institucion', DATEDIFF(YEAR, @fechaInicio, GETDATE()) AS 'Años que han pasado'
FROM Empleado e INNER JOIN EmpleadoInstitucion z ON e.idEmpleado = z.idEmpleado INNER JOIN Institucion i ON i.idInstitucion = z.idInstitucion 
WHERE z.idEmpleadoInstitucion = @idEmpInsti
GO

--PROCEDIMIENTO DE VISITAS DEL DIA

CREATE PROCEDURE VisitasDia AS
SELECT * FROM Visita WHERE fecha  >= CONVERT(varchar(10), GETDATE(), 112) AND
fecha < CONVERT(varchar(10), GETDATE()+1, 112)
GO

--PROCEDIMIENTO MAXIMO Y MINIMO DE DONACIONES Y EN ORDEN DE VALOR

CREATE PROCEDURE MinimaDonacion AS
SELECT b.nombre AS 'Beneficiario', d.valor AS 'Donación'
FROM Beneficiario b INNER JOIN Donacion d ON b.idBeneficiario = d.idBeneficiario
WHERE valor = (SELECT MIN(valor) FROM Donacion)
GO

CREATE PROCEDURE MaximaDonacion AS
SELECT b.nombre AS 'Beneficiario', d.valor AS 'Donación'
FROM Beneficiario b INNER JOIN Donacion d ON b.idBeneficiario = d.idBeneficiario
WHERE valor = (SELECT MAX(valor) FROM Donacion)
GO

CREATE PROCEDURE DonacionesOrden AS
SELECT b.nombre AS 'Beneficiario', d.valor AS 'Donación'
FROM Beneficiario b INNER JOIN Donacion d ON b.idBeneficiario = d.idBeneficiario
ORDER BY valor
GO

--PROCEDIMIENTO SELECCIONAR EMPLEADOS Y VISITANTES POR ORDEN ALFABETICO DE APELLIDO PATERNO

CREATE PROCEDURE EmpleadoSelectOrden AS
SELECT CONCAT(e.apellidoPaterno, ' ', e.apellidoMaterno, ' ', e.nombre) AS 'Nombre empleado', p.nombre AS 'Puesto'
FROM Empleado e INNER JOIN TipoEmpleado p ON e.idTipoEmpleado = p.idTipoEmpleado
ORDER BY apellidoPaterno
GO

CREATE PROCEDURE VisitantesSelectOrden AS
SELECT CONCAT(v.apellidoPaterno, ' ', v.apellidoMaterno, ' ', v.nombre) AS 'Nombre visitante', v.dni AS 'DNI'
FROM Visitante v 
ORDER BY apellidoPaterno
GO

--PROCEDIMIENTO VISITAS Y VISITANTES

CREATE PROCEDURE VisitanteVisita AS
SELECT CONCAT(v.apellidoPaterno, ' ', v.apellidoMaterno, ' ', v.nombre) AS 'Nombre visitante', v.dni AS 'DNI', a.fecha AS 'Fecha'
FROM Visitante v INNER JOIN Visita a ON v.idVisitante = a.idVisitante
ORDER BY fecha
GO

--PROCEDIMIENTO DE PASANTES

CREATE PROCEDURE EmpleadoSelectOrden AS
SELECT CONCAT(apellidoPaterno, ' ', apellidoMaterno, ' ', nombre) AS 'Nombre empleado', dni AS 'DNI'
FROM Empleado
WHERE idTipoEmpleado = 9
GO

--PROCEDIMIENTO SUMAR DONACIONES

CREATE PROCEDURE TotalDonaciones AS
SELECT SUM(ALL valor) AS 'Total de donaciones'
FROM Donacion
GO

--PROCEDIMIENTO ULTIMA VISITA

CREATE PROCEDURE UltimaVisitaVisitante (@idVis int)
AS
SELECT CONCAT(v.apellidoPaterno, ' ', v.apellidoMaterno, ' ', v.nombre) AS 'Nombre visitante', v.dni AS 'DNI', LAST_VALUE(a.fecha) OVER (ORDER BY a.idVisitante)
FROM Visitante v INNER JOIN Visita a ON v.idVisitante = a.idVisitante WHERE @idVis = a.idVisitante
GO

--PROCEDIMIENTO PRIMERA VISITA

CREATE PROCEDURE PrimeraVisitaVisitante (@idVis int)
AS
SELECT CONCAT(v.apellidoPaterno, ' ', v.apellidoMaterno, ' ', v.nombre) AS 'Nombre visitante', v.dni AS 'DNI', FIRST_VALUE(a.fecha) OVER (ORDER BY v.idVisitante)
FROM Visitante v INNER JOIN Visita a ON v.idVisitante = a.idVisitante WHERE @idVis = v.idVisitante
GO

--PROCEDIMIENTO SELECT SOLO ESTATUS = 1

CREATE PROCEDURE SelectBeneficiario AS
SELECT * FROM Beneficiario WHERE estatus = 1
GO

CREATE PROCEDURE SelectCaso AS
SELECT * FROM Caso WHERE estatus = 1
GO

CREATE PROCEDURE SelectCertificado AS
SELECT * FROM Certificado WHERE estatus = 1
GO

CREATE PROCEDURE SelectDepartamento AS
SELECT * FROM Departamento WHERE estatus = 1
GO

CREATE PROCEDURE SelectDonación AS
SELECT * FROM Donación WHERE estatus = 1
GO

CREATE PROCEDURE SelectEmpleado AS
SELECT * FROM Empleado WHERE estatus = 1
GO

CREATE PROCEDURE SelectEquipo AS
SELECT * FROM Equipo WHERE estatus = 1
GO

CREATE PROCEDURE SelectEspecialidad AS
SELECT * FROM Especialidad WHERE estatus = 1
GO

CREATE PROCEDURE SelectInstitucion AS
SELECT * FROM Institucion WHERE estatus = 1
GO

CREATE PROCEDURE SelectInstitucionEducativa AS
SELECT * FROM InstitucionEducativa WHERE estatus = 1
GO

CREATE PROCEDURE SelectInstrumento AS
SELECT * FROM Instrumento WHERE estatus = 1
GO

CREATE PROCEDURE SelectMobiliario AS
SELECT * FROM Mobiliario WHERE estatus = 1
GO

CREATE PROCEDURE SelectPase AS
SELECT * FROM Pase WHERE estatus = 1
GO

CREATE PROCEDURE SelectReactivo AS
SELECT * FROM Reactivo WHERE estatus = 1
GO

CREATE PROCEDURE SelectReporte AS
SELECT * FROM Reporte WHERE estatus = 1
GO

CREATE PROCEDURE SelectTipoCertificado AS
SELECT * FROM TipoCertificado WHERE estatus = 1
GO

CREATE PROCEDURE SelectTipoEmpleado AS
SELECT * FROM TipoEmpleado WHERE estatus = 1
GO

CREATE PROCEDURE SelectTipoInstitucion AS
SELECT * FROM TipoInstitucion WHERE estatus = 1
GO

CREATE PROCEDURE SelectTipoInstrumento AS
SELECT * FROM TipoInstrumento WHERE estatus = 1
GO

CREATE PROCEDURE SelectTipoMobiliario AS
SELECT * FROM TipoMobiliario WHERE estatus = 1
GO

CREATE PROCEDURE SelectTipoPase AS
SELECT * FROM TipoPase WHERE estatus = 1
GO

CREATE PROCEDURE SelectTipoVisita AS
SELECT * FROM TipoVisita WHERE estatus = 1
GO

CREATE PROCEDURE SelectUsuario AS
SELECT * FROM Usuario WHERE estatus = 1
GO

CREATE PROCEDURE SelectVisita AS
SELECT * FROM Visita WHERE estatus = 1
GO

CREATE PROCEDURE SelectVisitante AS
SELECT * FROM Visitante WHERE estatus = 1
GO

CREATE PROCEDURE SelectDepartamentoReactivo AS
SELECT * FROM DepartamentoReactivo WHERE estatus = 1
GO

CREATE PROCEDURE SelectDonacionInstitucion AS
SELECT * FROM DonacionInstitucion WHERE estatus = 1
GO

CREATE PROCEDURE SelectEmpleadoEspecialidad AS
SELECT * FROM EmpleadoEspecialidad WHERE estatus = 1
GO

CREATE PROCEDURE SelectEmpleadoEquipo AS
SELECT * FROM EmpleadoEquipo WHERE estatus = 1
GO

CREATE PROCEDURE SelectEmpleadoInstitucion AS
SELECT * FROM EmpleadoInstitucion WHERE estatus = 1
GO

--SELECCIONAR TODOS

CREATE PROCEDURE SelectTodoBeneficiario AS
SELECT * FROM Beneficiario
GO

CREATE PROCEDURE SelectTodoCaso AS
SELECT * FROM Caso  
GO

CREATE PROCEDURE SelectTodoCertificado AS
SELECT * FROM Certificado
GO

CREATE PROCEDURE SelectTodoDepartamento AS
SELECT * FROM Departamento 
GO

CREATE PROCEDURE SelectTodoDonacion AS
SELECT * FROM Donacion 
GO

CREATE PROCEDURE SelectTodoEmpleado AS
SELECT * FROM Empleado 
GO

CREATE PROCEDURE SelectTodoEquipo AS
SELECT * FROM Equipo 
GO

CREATE PROCEDURE SelectTodoEspecialidad AS
SELECT * FROM Especialidad
GO

CREATE PROCEDURE SelectTodoInstitucion AS
SELECT * FROM Institucion 
GO

CREATE PROCEDURE SelectTodoInstitucionEducativa AS
SELECT * FROM InstitucionEducativa 
GO

CREATE PROCEDURE SelectTodoInstrumento AS
SELECT * FROM Instrumento 
GO

CREATE PROCEDURE SelectTodoMobiliario AS
SELECT * FROM  Mobiliario
GO

CREATE PROCEDURE SelectTodoPase AS
SELECT * FROM Pase
GO

CREATE PROCEDURE SelectTodoReactivo AS
SELECT * FROM Reactivo
GO

CREATE PROCEDURE SelectTodoReporte AS
SELECT * FROM Reporte
GO

CREATE PROCEDURE SelectTodoTipoCertificado AS
SELECT * FROM TipoCertificado
GO

CREATE PROCEDURE SelectTodoTipoEmpleado AS
SELECT * FROM TipoEmpleado 
GO

CREATE PROCEDURE SelectTodoTipoInstitucion AS
SELECT * FROM TipoInstitucion 
GO

CREATE PROCEDURE SelectTodoTipoInstrumento AS
SELECT * FROM TipoInstrumento
GO

CREATE PROCEDURE SelectTodoTipoMobiliario AS
SELECT * FROM TipoMobiliario 
GO

CREATE PROCEDURE SelectTodoTipoPase AS
SELECT * FROM  TipoPase
GO

CREATE PROCEDURE SelectTodoTipoVisita AS
SELECT * FROM TipoVisita
GO

CREATE PROCEDURE SelectTodoUsuario AS
SELECT * FROM Usuario 
GO

CREATE PROCEDURE SelectTodoVisita AS
SELECT * FROM Visita
GO

CREATE PROCEDURE SelectTodoVisitante AS
SELECT * FROM Visitante
GO

CREATE PROCEDURE SelectTodoDepartamentoReactivo AS
SELECT * FROM DepartamentoReactivo 
GO

CREATE PROCEDURE SelectTodoDonacionInstitucion AS
SELECT * FROM  DonacionInstitucion
GO

CREATE PROCEDURE SelectTodoEmpleadoEspecialidad AS
SELECT * FROM EmpleadoEspecialidad
GO

CREATE PROCEDURE SelectTodoEmpleadoEquipo AS
SELECT * FROM  EmpleadoEquipo
GO

CREATE PROCEDURE SelectTodoEmpleadoInstitucion AS
SELECT * FROM  EmpleadoInstitucion
GO
