CREATE DATABASE institutojeffersonian;

USE institutojeffersonian;

CREATE TABLE Beneficiario
(
    idBeneficiario int AUTO_INCREMENT,
    nombre varchar (50) not null,
    rfc char (13),
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKBeneficiario PRIMARY KEY(idBeneficiario)
);

CREATE TABLE Caso
(
    idCaso int AUTO_INCREMENT,
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
);

CREATE TABLE Certificado
(
    idCertificado int AUTO_INCREMENT,
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
);

CREATE TABLE Departamento
(
    idDepartamento int AUTO_INCREMENT,
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKDepartamento PRIMARY KEY(idDepartamento)
);

CREATE TABLE Donacion
(
    idDonacion int AUTO_INCREMENT,
    fecha datetime not null,
    valor int not null,
    idBeneficiario int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKDonacion PRIMARY KEY(idDonacion)
);

CREATE TABLE Empleado
(
    idEmpleado int AUTO_INCREMENT,
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
);

CREATE TABLE Equipo
(
    idEquipo int AUTO_INCREMENT,
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
    idEspecialidad int AUTO_INCREMENT,
    nombre varchar (50) not null,
    descripcion varchar (250) not null,
    idDepartamento int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKEspecialidad PRIMARY KEY(idEspecialidad)
);

CREATE TABLE Institucion
(
    idInstitucion int AUTO_INCREMENT,
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
);

CREATE TABLE InstitucionEducativa
(
    idInstitucionEducativa int AUTO_INCREMENT,
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
);

CREATE TABLE Instrumento
(
    idInstrumento int AUTO_INCREMENT,
    codigo char (6) not null,
    idTipoInstrumento int not null,
    idDepartamento int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKInstrumento PRIMARY KEY(idInstrumento)
);

CREATE TABLE Mobiliario
(
    idMobiliario int AUTO_INCREMENT,
    codigo char (5) not null,
    idTipoMobiliario int not null,
    idDepartamento int not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKMobiliario PRIMARY KEY(idMobiliario)
);

CREATE TABLE Pase
(
    idPase int AUTO_INCREMENT,
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
);

CREATE TABLE Reactivo
(
    idReactivo int AUTO_INCREMENT,
    nombre varchar (100) not null,
    formula varchar (250) not null,
    tipo char (1) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKReactivo PRIMARY KEY(idReactivo)
);

CREATE TABLE Reporte
(
    idReporte int AUTO_INCREMENT,
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
);

CREATE TABLE TipoCertificado
(
    idTipoCertificado int AUTO_INCREMENT,
    nombre varchar (100) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTipoCertificado PRIMARY KEY(idTipoCertificado)
);

CREATE TABLE TipoEmpleado
(
    idTipoEmpleado int AUTO_INCREMENT,
    nombre varchar (50) not null,
    descripcion varchar (200) not null,
    sueldoBase numeric (10, 2) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTipoEmpleado PRIMARY KEY(idTipoEmpleado)
);

CREATE TABLE TipoInstitucion
(
    idTipoInstitucion int AUTO_INCREMENT,
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTipoInstitucion PRIMARY KEY(idTipoInstitucion)
);

CREATE TABLE TipoInstrumento
(
    idTipoInstrumento int AUTO_INCREMENT,
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTipoInstrumento PRIMARY KEY(idTipoInstrumento)
);

CREATE TABLE TipoMobiliario
(
    idTipoMobiliario int AUTO_INCREMENT,
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTipoMobiliario PRIMARY KEY(idTipoMobiliario)
);

CREATE TABLE TipoPase
(
    idTipoPase int AUTO_INCREMENT,
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTipoPase PRIMARY KEY(idTipoPase)
);

CREATE TABLE TipoVisita
(
    idTipoVisita int AUTO_INCREMENT,
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTipoVisita PRIMARY KEY(idTipoVisita)
);

CREATE TABLE Usuario
(
    idUsuario int AUTO_INCREMENT,
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
);

CREATE TABLE Visita
(
    idVisita int AUTO_INCREMENT,
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
);

CREATE TABLE Visitante
(
    idVisitante int AUTO_INCREMENT,
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
);


--RELACIONES

ALTER TABLE Beneficiario
ADD CONSTRAINT FKBeneficiarioUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Beneficiario
ADD CONSTRAINT FKBeneficiarioUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Caso
ADD CONSTRAINT FKCasoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Caso
ADD CONSTRAINT FKCasoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Certificado
ADD CONSTRAINT FKCertificadoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Certificado
ADD CONSTRAINT FKCertificadoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Departamento
ADD CONSTRAINT FKDepartamentoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Departamento
ADD CONSTRAINT FKDepartamentoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Donacion
ADD CONSTRAINT FKDonacionUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Donacion
ADD CONSTRAINT FKDonacionUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Empleado
ADD CONSTRAINT FKEmpleadoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Empleado
ADD CONSTRAINT FKEmpleadoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Especialidad
ADD CONSTRAINT FKEspecialidadUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Especialidad
ADD CONSTRAINT FKEspecialidadUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Institucion
ADD CONSTRAINT FKInstitucionUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Institucion
ADD CONSTRAINT FKInstitucionUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE InstitucionEducativa
ADD CONSTRAINT FKInstitucionEducativaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE InstitucionEducativa
ADD CONSTRAINT FKInstitucionEducativaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Instrumento
ADD CONSTRAINT FKInstrumentoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Instrumento
ADD CONSTRAINT FKInstrumentoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Mobiliario
ADD CONSTRAINT FKMobiliarioUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Mobiliario
ADD CONSTRAINT FKMobiliarioUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Pase
ADD CONSTRAINT FKPaseUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Pase
ADD CONSTRAINT FKPaseUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Reactivo
ADD CONSTRAINT FKReactivoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Reactivo
ADD CONSTRAINT FKReactivoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Reporte
ADD CONSTRAINT FKReporteUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Reporte
ADD CONSTRAINT FKReporteUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoCertificado
ADD CONSTRAINT FKTipoCertificadoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoCertificado
ADD CONSTRAINT FKTipoCertificadoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoEmpleado
ADD CONSTRAINT FKTipoEmpleadoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoEmpleado
ADD CONSTRAINT FKTipoEmpleadoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoInstitucion
ADD CONSTRAINT FKTipoInstitucionUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoInstitucion
ADD CONSTRAINT FKTipoInstitucionUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoInstrumento
ADD CONSTRAINT FKTipoInstrumentoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoInstrumento
ADD CONSTRAINT FKTipoInstrumentoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoMobiliario
ADD CONSTRAINT FKTipoMobiliarioUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoMobiliario
ADD CONSTRAINT FKTipoMobiliarioUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoPase
ADD CONSTRAINT FKTipoPaseUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoPase
ADD CONSTRAINT FKTipoPaseUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoVisita
ADD CONSTRAINT FKTipoVisitaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoVisita
ADD CONSTRAINT FKTipoVisitaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Visita
ADD CONSTRAINT FKVisitaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Visita
ADD CONSTRAINT FKVisitaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Visitante
ADD CONSTRAINT FKVisitanteUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Visitante
ADD CONSTRAINT FKVisitanteUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE DepartamentoReactivo
ADD CONSTRAINT FKDepartamentoReactivoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE DepartamentoReactivo
ADD CONSTRAINT FKDepartamentoReactivoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE DonacionInstitucion
ADD CONSTRAINT FKDonacionInstitucionUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE DonacionInstitucion
ADD CONSTRAINT FKDonacionInstitucionUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE EmpleadoEspecialidad
ADD CONSTRAINT FKEmpleadoEspecialidadUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE EmpleadoEspecialidad
ADD CONSTRAINT FKEmpleadoEspecialidadUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE EmpleadoEquipo
ADD CONSTRAINT FKEmpleadoEquipoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE EmpleadoEquipo
ADD CONSTRAINT FKEmpleadoEquipoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE EmpleadoInstitucion
ADD CONSTRAINT FKEmpleadoInstitucionUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE EmpleadoInstitucion
ADD CONSTRAINT FKEmpleadoInstitucionUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Caso
ADD CONSTRAINT FKCasoEquipo FOREIGN KEY (idEquipo)
REFERENCES Equipo(idEquipo);

ALTER TABLE Caso
ADD CONSTRAINT FKCasoEspecialidad FOREIGN KEY (idEspecialidad)
REFERENCES Especialidad(idEspecialidad);

ALTER TABLE Certificado
ADD CONSTRAINT FKCertificadoInstitucionEducativa FOREIGN KEY (idInstitucion)
REFERENCES InstitucionEducativa(idInstitucionEducativa);

ALTER TABLE Certificado
ADD CONSTRAINT FKCertificadoTipoCertificado FOREIGN KEY (idTipoCertificado)
REFERENCES TipoCertificado(idTipoCertificado);

ALTER TABLE Certificado
ADD CONSTRAINT FKCertificadoEmpleado FOREIGN KEY (idEmpleado)
REFERENCES Empleado(idEmpleado);

ALTER TABLE Donacion
ADD CONSTRAINT FKDonacionBeneficiario FOREIGN KEY (idBeneficiario)
REFERENCES Beneficiario(idBeneficiario);

ALTER TABLE Empleado
ADD CONSTRAINT FKEmpleadoTipoEmpleado FOREIGN KEY (idTipoEmpleado)
REFERENCES TipoEmpleado(idTipoEmpleado);

ALTER TABLE Especialidad
ADD CONSTRAINT FKEspecialidadDepartamento FOREIGN KEY (idDepartamento)
REFERENCES Departamento(idDepartamento);

ALTER TABLE Institucion
ADD CONSTRAINT FKInstitucionTipoInstitucion FOREIGN KEY (idTipoInstitucion)
REFERENCES TipoInstitucion(idTipoInstitucion);

ALTER TABLE Instrumento
ADD CONSTRAINT FKInstrumentoTipoInstrumento FOREIGN KEY (idTipoInstrumento)
REFERENCES TipoInstrumento(idTipoInstrumento);

ALTER TABLE Instrumento
ADD CONSTRAINT FKInstrumentoDepartamento FOREIGN KEY (idDepartamento)
REFERENCES Departamento(idDepartamento);

ALTER TABLE Mobiliario
ADD CONSTRAINT FKMobiliarioTipoMobiliario FOREIGN KEY (idTipoMobiliario)
REFERENCES TipoMobiliario(idTipoMobiliario);

ALTER TABLE Mobiliario
ADD CONSTRAINT FKMobiliarioDepartamento FOREIGN KEY (idDepartamento)
REFERENCES Departamento(idDepartamento);

ALTER TABLE Pase
ADD CONSTRAINT FKPaseTipoPase FOREIGN KEY (idTipoPase)
REFERENCES TipoPase(idTipoPase);

ALTER TABLE Pase
ADD CONSTRAINT FKPaseInstitucion FOREIGN KEY (idInstitucion)
REFERENCES Institucion(idInstitucion);

ALTER TABLE Reporte
ADD CONSTRAINT FKReporteCaso FOREIGN KEY (idCaso)
REFERENCES Caso(idCaso);

ALTER TABLE Reporte
ADD CONSTRAINT FKReporteEmpleadoEntrega FOREIGN KEY (idEmpleadoEntrega)
REFERENCES Empleado(idEmpleado);

ALTER TABLE Reporte
ADD CONSTRAINT FKReporteEmpleadoRecibe FOREIGN KEY (idEmpleadoRecibe)
REFERENCES Empleado(idEmpleado);

ALTER TABLE Visita
ADD CONSTRAINT FKVisitaTipoVisita FOREIGN KEY (idTipoVisita)
REFERENCES TipoVisita(idTipoVisita);

ALTER TABLE Visita
ADD CONSTRAINT FKVisitaVisitante FOREIGN KEY (idVisitante)
REFERENCES Visitante(idVisitante);

ALTER TABLE Visita
ADD CONSTRAINT FKVisitaPase FOREIGN KEY (idPase)
REFERENCES Pase(idPase);

ALTER TABLE DepartamentoReactivo
ADD CONSTRAINT FKDepartamentoReactivoDepartamento FOREIGN KEY (idDepartamento)
REFERENCES Departamento(idDepartamento);

ALTER TABLE DepartamentoReactivo
ADD CONSTRAINT FKDepartamentoReactivoReactivo FOREIGN KEY (idReactivo)
REFERENCES Reactivo(idReactivo);

ALTER TABLE DonacionInstitucion
ADD CONSTRAINT FKDonacionInstitucionDonacion FOREIGN KEY (idDonacion)
REFERENCES Donacion(idDonacion);

ALTER TABLE DonacionInstitucion
ADD CONSTRAINT FKDonacionInstitucionInstitucion FOREIGN KEY (idInstitucion)
REFERENCES Institucion(idInstitucion);

ALTER TABLE EmpleadoEspecialidad
ADD CONSTRAINT FKEmpleadoEspecialidadEmpleado FOREIGN KEY (idEmpleado)
REFERENCES Empleado(idEmpleado);

ALTER TABLE EmpleadoEspecialidad
ADD CONSTRAINT FKEmpleadoEspecialidadEspecialidad FOREIGN KEY (idEspecialidad)
REFERENCES Especialidad(idEspecialidad);

ALTER TABLE EmpleadoEquipo
ADD CONSTRAINT FKEmpleadoEquipoEmpleado FOREIGN KEY (idEmpleado)
REFERENCES Empleado(idEmpleado);

ALTER TABLE EmpleadoEquipo
ADD CONSTRAINT FKEmpleadoEquipoEquipo FOREIGN KEY (idEquipo)
REFERENCES Equipo(idEquipo);

ALTER TABLE EmpleadoInstitucion
ADD CONSTRAINT FKEmpleadoInstitucionEmpleado FOREIGN KEY (idEmpleado)
REFERENCES Empleado(idEmpleado);

ALTER TABLE EmpleadoInstitucion
ADD CONSTRAINT FKEmpleadoInstitucionInstitucion FOREIGN KEY (idInstitucion)
REFERENCES Institucion(idInstitucion);

--INSERT

INSERT INTO Usuario (nombre, apellidoPaterno, apellidoMaterno, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Miriam Priscila', 'Moreno', 'Reyna', 'I19050460@monclova.tecnm.mx', 'Tec12345.', 1, NOW());

INSERT INTO Beneficiario (nombre, rfc, idUsuarioCrea, fechaCrea)
    VALUES ('Grupo Cantilever', 'CLV890521FDS', 1, NOW()),
           ('Fundación General CISC', 'FGC631208D4E', 1, NOW()),
           ('Grupo SCAI', 'SCA200522RED', 1, NOW()),
           ('WATT ESTUDIO', 'WAT750417ER3', 1, NOW()),
           ('ALWYN INC.', 'SWI170513189', 1, NOW()),
           ('SCOTT ENT', 'SCT891213ER4', 1, NOW()),
           ('Fundación SKJN', 'KSJ9212023ED', 1, NOW()),
           ('Grupo Min', 'MYG930309SW3', 1, NOW()),
           ('TAE INC', 'KOT951230TRE', 1, NOW()),
           ('Fundación Namu', 'KNJ940912MCL', 1, NOW());

INSERT INTO Departamento (nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Antropología', 1, NOW()),
           ('Restauración y conservación', 1, NOW()),
           ('Historia del arte', 1, NOW()),
           ('Historia de la lingüistica', 1, NOW()),
           ('Historia nacional', 1, NOW()),
           ('Biología', 1, NOW()),
           ('Paleontología', 1, NOW()),
           ('Historia universal', 1, NOW()),
           ('Cosmología', 1, NOW()),
           ('Historia de la religión', 1, NOW());

INSERT INTO Donacion (fecha, valor, idBeneficiario, idUsuarioCrea, fechaCrea)
    VALUES ('2021-10-31', 35000, 3, 1, NOW()),
           ('2021-10-31', 45000, 7, 1, NOW()),
           ('2021-11-25', 85300, 10, 1, NOW()),
           ('2021-12-12', 100500, 8, 1, NOW()),
           ('2021-12-24', 200000, 10, 1, NOW()),
           ('2022-01-28', 95000, 2, 1, NOW()),
           ('2022-02-12', 105000, 1, 1, NOW()),
           ('2022-02-24', 80200, 5, 1, NOW()),
           ('2022-03-10', 90000, 3, 1, NOW()),
           ('2022-04-20', 120000, 2, 1, NOW());

INSERT INTO Equipo (codigo, idUsuarioCrea, fechaCrea)
    VALUES ('EJ-101', 1, NOW()),
           ('EJ-102', 1, NOW()),
           ('EJ-103', 1, NOW()),
           ('EJ-104', 1, NOW()),
           ('EJ-105', 1, NOW()),
           ('EJ-106', 1, NOW()),
           ('EJ-107', 1, NOW()),
           ('EJ-108', 1, NOW()),
           ('EJ-109', 1, NOW()),
           ('EJ-110', 1, NOW());

INSERT INTO Especialidad (nombre, descripcion, idDepartamento, idUsuarioCrea, fechaCrea)
    VALUES ('Antropología forense', 'Aplicación de la ciencia de la antropología física o antropología biológica al proceso legal.', 1,  1, NOW()),
           ('Antropología filosófica', 'Se ocupa de las incertidumbres de índole ontológica, centrado su atención en el ser humano.', 1, 1, NOW()),
           ('Arqueoastronomía', 'Estudio del cómo las poblaciones del pasado «entendieron el fenómeno del cielo, cómo usaron estos fenómenos y cuál fue el papel del cielo en sus culturas».​', 9, 1, NOW()),
           ('Arquitectura', 'Arte y la técnica de proyectar, diseñar y construir, ​modificando el hábitat humano, estudiando la estética, el buen uso y la función de los espacios.', 3, 1, NOW()),
           ('Arte de la edad moderna', 'Subdivisión temporal de la historia del arte que corresponde a la Edad Moderna.', 3, 1, NOW()),
           ('Estudios medievales', 'Período histórico de la civilización occidental comprendido entre los siglos V y XV.', 8, 1, NOW()),
           ('Mitología griega', 'Conjunto de mitos y leyendas pertenecientes a la cultura de la Antigua Grecia.', 10,  1, NOW()),
           ('Mitología egipcia', 'Estudio de creencias sustentadas en la religión del Antiguo Egipto', 10, 1, NOW()),
           ('Entomología', 'Estudio científico de los insectos.', 6, 1, NOW()),
           ('Lingüística histórica', 'Estudio del cambio de las lenguas con el tiempo y el proceso de cambio lingüístico.', 4, 1, NOW());

INSERT INTO TipoCertificado (nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Certificación de cursos aprobados', 1, NOW()),
           ('Certificación de historia académica', 1, NOW()),
           ('Certificación de egresado', 1, NOW()),
           ('Certificación de reconocimiento y/o equiparación título y/o grado académico', 1, NOW()),
           ('Certificación especial', 1, NOW()),
           ('Certificación de Título, (Estudiantes en condición de graduando ó graduado)', 1, NOW()),
           ('Certificación de idoneidad, suficiencia, aptitud superior, autorizado, (Salida Lateral)', 1, NOW()),
           ('Certificación especial', 1, NOW()),
           ('Certificación de estudiante', 1, NOW()),
           ('Certificación de materias pendientes', 1, NOW());

INSERT INTO TipoEmpleado(nombre, descripcion, sueldoBase, idUsuarioCrea, fechaCrea)
    VALUES ('Director', 'Dirección de instituto', 25000, 1, NOW()),
           ('Vigilante de seguridad', 'Vigilancia de puertas, exhibiciones y laboratorios', 8750, 1, NOW()),
           ('Intendente', 'Limpieza del instituto', 8000, 1, NOW()),
           ('Documentalista', 'Documentación de las investigaciones del museo', 25000, 1, NOW()),
           ('Investigador', 'Investigador para el laboratortio', 15000, 1, NOW()),
           ('Pasante', 'Estudiante que realiza prácticas profesionales.', 8000, 1, NOW()),
           ('Director de departamento', 'Dirección de departamento', 15000, 1, NOW()),
           ('Recepcionista', 'Recibimiento de visitantes', 9000, 1, NOW()),
           ('Externo', 'Empleado externo al instituto', 0, 1, NOW()),
           ('Mantenimiento', 'Mantenimiento del instituto', 8000, 1, NOW());

INSERT INTO TipoInstitucion (nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Museo', 1, NOW()),
           ('Centro de investigación', 1, NOW()),
           ('Zoológico', 1, NOW()),
           ('Editorial', 1, NOW()),
           ('Tienda', 1, NOW()),
           ('Observatorio', 1, NOW()),
           ('Invernadero', 1, NOW()),
           ('Acuario', 1, NOW()),
           ('Biblioteca', 1, NOW()),
           ('Centro de estudios', 1, NOW());

INSERT INTO TipoInstrumento (nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Embudo de vidrio', 1, NOW()),
           ('Vaso precipitado', 1, NOW()),
           ('Matraz volumétrico', 1, NOW()),
           ('Frasco de reactivo', 1, NOW()),
           ('Condensador de espiral', 1, NOW()),
           ('Probeta milimetrada', 1, NOW()),
           ('Pipeta', 1, NOW()),
           ('Mechero de bunsen', 1, NOW()),
           ('Rejilla de asbesto', 1, NOW()),
           ('Tubo de ensayo', 1, NOW());

INSERT INTO TipoMobiliario(nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Mesa de laboratorio central', 1, NOW()),
           ('Armario de seguridad', 1, NOW()),
           ('Campana de gas', 1, NOW()),
           ('Silla de laboratorio', 1, NOW()),
           ('Lavador de gases', 1, NOW()),
           ('Fregadero', 1, NOW()),
           ('Cajonera', 1, NOW()),
           ('Estantería', 1, NOW()),
           ('Taburete', 1, NOW()),
           ('Mesa de laboratorio mural', 1, NOW());

INSERT INTO TipoPase (nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Estudiante', 1, NOW()),
           ('Pasante', 1, NOW()),
           ('Visitante', 1, NOW()),
           ('Empleado externo', 1, NOW()),
           ('Empleado interno', 1, NOW()),
           ('Exhibición', 1, NOW()),
           ('Invitado', 1, NOW()),
           ('Prensa', 1, NOW()),
           ('Socio', 1, NOW()),
           ('Personal', 1, NOW());

INSERT INTO TipoVisita(nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Educativa', 1, NOW()),
           ('Prensa', 1, NOW()),
           ('Corporativa', 1, NOW()),
           ('Evento', 1, NOW()),
           ('Empresarial', 1, NOW()),
           ('Trabajo interno', 1, NOW()),
           ('Trabajo externo', 1, NOW()),
           ('Administrativa', 1, NOW()),
           ('Gubernamental', 1, NOW()),
           ('Personal', 1, NOW());

INSERT INTO Visitante (nombre, apellidoPaterno, apellidoMaterno, correo, telefono, fechaNacimiento, dni, idUsuarioCrea, fechaCrea)
    VALUES ('Namjoon', 'Kim', '', 'namgreen@gmail.com', '8226672918', '1994-09-12', '1425369685741', 1, NOW()),
           ('Seokjin', 'Kim', '', 'wwhuknow@hotmail.com', '8220964892', '1992-12-04','2014785345129', 1, NOW()),
           ('Yoongi', 'Min', '', 'tangerinedark@gmail.com', '8223902765', '1993-03-09','0193749878321', 1, NOW()),
           ('Hoseok', 'Jung', '', 'urhope@yahoo.com', '8226397201', '1994-02-18', '0198327454253', 1, NOW()),
           ('Jimin', 'Park', '', 'lachimolala@hotmail.com', '8228495027', '1995-10-13', '7412589630147', 1, NOW()),
           ('Taehyung', 'Kim', '', 'blueandgrey@hotmail.com', '8224839672', '1995-12-30', '0123996334111', 1, NOW()),
           ('Jungkook', 'Jung', '', 'lovearmy@hotmail.com', '8225362500', '1997-09-01', '0123354784155', 1, NOW()),
           ('Micol', 'Alanis', 'López', 'alanismicol@hotmail.com', '8661397396', '1995-04-20', '0007864552179', 1, NOW()),
           ('Max', 'Alanis', 'López', 'maxiblue@hotmail.com', '8661245790', '1989-12-13', '1035574122985', 1, NOW()),
           ('Adele', 'Blue', 'Adkins', 'easyonmail@hotmail.com', '0203827156', '1988-05-05', '7895555441238', 1, NOW());

INSERT INTO Empleado (numero, nombre, apellidoPaterno, apellidoMaterno, genero, ciudad, pais, fechaNacimiento, rfc, dni, idTipoEmpleado, idUsuarioCrea, fechaCrea)
    VALUES ('12345', 'Temperance', 'Brennan', '', 'FEM','Washington D. C.', 'Estados Unidos de América', '1976-01-10', 'BRET760110JGS', '6387419601247', 5, 1, NOW()),
           ('67891', 'Seeley Joseph', 'Booth', '', 'MAS', 'Filadelfia', 'Pensilvania', '1971-11-12', 'BOSJ7111128DE', '9317000123210', 9, 1, NOW()),
           ('01112', 'Camille', 'Saroyan', '', 'FEM', 'Managua', 'Nicaragua', '1970-07-22', 'SACA700722FRE', '7845123260000', 7, 1, NOW()),
           ('13141', 'Angela', 'Montenegro', '', 'FEM', 'Washington D. C.', 'Estados Unidos de América', '1978-04-16', 'MOAG780416LJE', '7403927412013', 5, 1, NOW()),
           ('51617', 'Zackary Uriah', 'Addy ', '', 'MAS', 'Lansing', 'Michigan', '1981-12-30', 'ADZA811230PIR', '1000789014520', 5, 1, NOW()),
           ('18192', 'Jonathan', 'Hodgins', '', 'MAS', 'Washington D. C.', 'Estados Unidos de América', '1976-09-20', 'HOJA760920EDS', '7830196874444', 5, 1, NOW()),
           ('02122', 'Vincent', 'Nigel-Murray', '', 'MAS', 'Londres', 'Reino Unido', '1990-09-16', 'NIVI900916TRE', '7896540000130', 6, 1, NOW()),           
           ('52627', 'Lance ', 'Sweets', '', 'MAS', 'Washington D. C.', 'Estados Unidos de América', '1985-02-27', 'SWLA850227LKA', '1023988877453', 7, 1, NOW()),
           ('28293', 'Jessica', 'Warren', '', 'FEM', 'Monterey', 'California', '1992-05-14', 'WAJE920514CSZ', '9630167981560', 6, 1, NOW()),
           ('28545', 'Jorge', 'Pérez', 'Sánchez', 'MAS', 'Monterrey', 'México', '1988-05-14', 'PESJ880514CSZ', '9630167981560', 6, 1, NOW());

INSERT INTO Institucion (nombre, codigo, ciudad, pais, idTipoInstitucion, idUsuarioCrea, fechaCrea)
    VALUES ('Galería Arthur M. Sackler', 'IT-101', 'Washington D. C.', 'Estados Unidos de América', 1, 1, NOW()),
           ('Museo Nacional del Aire y el Espacio de Estados Unidos', 'IT-102', 'Washington D. C.', 'Estados Unidos de América', 1, 1, NOW()),
           ('Parque Zoológico Nacional del Jeffersonian', 'IT-103', 'Washington D. C.', 'Estados Unidos de América', 3, 1, NOW()),
           ('Museo Nacional de Diseño Cooper-Hewitt', 'IT-104', 'Nueva York', 'Estados Unidos de América', 1, 1, NOW()),
           ('Edificio de las Artes y la Industria', 'IT-105', 'Washington D. C.', 'Estados Unidos de América', 3, 1, NOW()),
           ('Biblioteca del Instituto Jeffersoniano', 'IT-106', 'Washington D. C.', 'Estados Unidos de América', 10, 1, NOW()),
           ('Instituto Jeffersoniano de Investigaciones Tropicales', 'IT-107', 'Barro Colorado', 'Panamá', 2, 1, NOW()),
           ('Centro de Estudios Planetarios y de la Tierra', 'IT-108', 'Washington D. C.', 'Estados Unidos de América', 6, 1, NOW()),
           ('Museo Nacional de Arte y Cultura Afroamericana', 'IT-109', 'Nueva York', 'Estados Unidos de América', 4, 1, NOW()),
           ('Instituto Jeffersoniano', 'IT-110', 'Washington D. C.', 'Estados Unidos de América', 2, 1, NOW());

INSERT INTO InstitucionEducativa (nombre, ciudad, estado, pais, idUsuarioCrea, fechaCrea)
    VALUES ('Northwestern University', 'Chicago', 'Illinois', 'Estados Unidos de América', 1, NOW()),
           ('Universidad de Harvard', 'Cambridge', 'Massachusetts', 'Estados Unidos de América', 1, NOW()),
           ('Instituto de Tecnología de Massachusetts', 'Cambridge', 'Massachusetts', 'Estados Unidos de América', 1, NOW()),
           ('Universidad de California', 'Berkeley', 'California', 'Estados Unidos de América', 1, NOW()),
           ('Universidad de Oxford', 'Oxford', 'Inglaterra', 'Reino Unido',  1, NOW()),
           ('Universidad de Columbia', 'Nueva York', 'Nueva York', 'Estados Unidos de América', 1, NOW()),
           ('Universidad de Cambridge', 'Cambridge', 'Inglaterra', 'Reino Unido',  1, NOW()),
           ('Instituto de Tecnología de California Caltech', 'Pasadena', 'California', 'Estados Unidos de América', 1, NOW()),
           ('Universidad Johns Hopkins', 'Baltimore', 'Maryland', 'Estados Unidos de América', 1, NOW()),
           ('Universidad de Washington', 'Seattle', 'Washington', 'Estados Unidos de América', 1, NOW());

INSERT INTO Instrumento (codigo, idTipoInstrumento, idDepartamento, idUsuarioCrea, fechaCrea)
    VALUES ('IN-100', 3, 2, 1, NOW()),
           ('IN-101', 3, 2, 1, NOW()),
           ('IN-102', 3, 1, 1, NOW()),
           ('IN-103', 9, 1, 1, NOW()),
           ('IN-104', 9, 1, 1, NOW()),
           ('IN-105', 10, 1, 1, NOW()),
           ('IN-106', 10, 1, 1, NOW()),
           ('IN-107', 7, 6, 1, NOW()),
           ('IN-108', 8, 1, 1, NOW()),
           ('IN-109', 4, 1, 1, NOW());

INSERT INTO Mobiliario (codigo, idTipoMobiliario, idDepartamento, idUsuarioCrea, fechaCrea)
    VALUES ('M-100', 1, 1, 1, NOW()),
           ('M-101', 1, 1, 1, NOW()),
           ('M-102', 1, 1, 1, NOW()),
           ('M-103', 10, 1, 1, NOW()),
           ('M-104', 10, 1, 1, NOW()),
           ('M-105', 3, 1, 1, NOW()),
           ('M-106', 3, 6, 1, NOW()),
           ('M-107', 3, 6, 1, NOW()),
           ('M-108', 2, 6, 1, NOW()),
           ('M-109', 2, 1, 1, NOW());

INSERT INTO Pase (codigo, fechaInicio, fechaFinal, idTipoPase, idInstitucion, idUsuarioCrea, fechaCrea)
    VALUES ('P-100', '2022-04-01', '2022-04-10', 10, 4, 1, NOW()),
           ('P-101', '2022-04-04', '2022-04-15', 10, 4, 1, NOW()),
           ('P-102', '2022-04-05', '2022-04-20', 10, 2, 1, NOW()),
           ('P-103', '2022-04-05', '2022-04-20', 10, 2, 1, NOW()),
           ('P-104', '2022-04-05', '2022-04-20', 10, 2, 1, NOW()),
           ('P-105', '2022-04-05', '2022-04-30', 10, 2, 1, NOW()),
           ('P-106', '2022-04-10', '2022-04-10', 10, 1, 1, NOW()),
           ('P-107', '2022-04-10', '2022-04-10', 10, 1, 1, NOW()),
           ('P-108', '2022-04-15', '2022-04-15', 10, 8, 1, NOW()),
           ('P-109', '2022-04-15', '2022-04-15', 10, 8, 1, NOW());

INSERT INTO Reactivo (nombre, formula, tipo, idUsuarioCrea, fechaCrea)
    VALUES ('Ácido acético', 'CH3COOH', 'L', 1, NOW()),
           ('Ácido fluorhídrico', 'HF', 'L', 1, NOW()),
           ('Anilina', 'C6H5NH2', 'L', 1, NOW()),
           ('Tolueno', 'C7H8', 'L', 1, NOW()),
           ('Naftalina', 'C10H8', 'S', 1, NOW()),
           ('Benceno', 'C6H6', 'L', 1, NOW()),
           ('Butano', 'C4H10', 'G', 1, NOW()),
           ('Propano', 'C3H8', 'L', 1, NOW()), 
           ('Isopreno', 'C5H8', 'L', 1, NOW()),
           ('Ciclohexanol', 'C6H12O', 'L', 1, NOW());

INSERT INTO Visita (codigo, fecha, idTipoVisita, idVisitante, idPase, idUsuarioCrea, fechaCrea)
    VALUES ('V-101', '2022-04-01', 7, 1, 1, 1, NOW()),
           ('V-102', '2022-04-02', 7, 1, 1, 1, NOW()),
           ('V-103', '2022-04-05', 7, 1, 1, 1, NOW()),
           ('V-104', '2022-04-10', 1, 7, 7, 1, NOW()),
           ('V-105', '2022-04-10', 1, 9, 8, 1, NOW()),
           ('V-106', '2022-04-15', 2, 8, 9, 1, NOW()),
           ('V-107', '2022-04-15', 2, 10, 10, 1, NOW()),
           ('V-108', '2022-04-20', 6, 2, 6, 1, NOW()),
           ('V-109', '2022-04-20', 6, 3, 5, 1, NOW()),
           ('V-110', '2022-04-21', 6, 2, 6, 1, NOW());

INSERT INTO Caso (codigo, estado, fechaInicio, idEquipo, idEspecialidad, idUsuarioCrea, fechaCrea)
    VALUES ('C-100', 'A', '2022-01-28', 1, 1, 1, NOW()),
           ('C-101', 'A', '2022-02-04', 2, 9, 1, NOW()),
           ('C-102', 'A', '2022-02-05', 1, 1, 1, NOW()),
           ('C-103', 'A', '2022-02-18', 2, 2, 1, NOW()),
           ('C-104', 'A', '2022-03-09', 3, 1, 1, NOW()),
           ('C-105', 'A', '2022-03-13', 1, 1, 1, NOW()),
           ('C-106', 'A', '2022-03-14', 5, 6, 1, NOW()),
           ('C-108', 'A', '2022-04-03', 6, 9, 1, NOW()),
           ('C-109', 'A', '2022-04-20', 1, 9, 1, NOW()),
           ('C-110', 'A', '2022-04-20', 10, 1, 1, NOW());

INSERT INTO Certificado (codigo, idInstitucion, fecha, ciudad, pais, idTipoCertificado, idEmpleado, idUsuarioCrea, fechaCrea)
    VALUES ('A584', 1, '1999-02-17', 'Washington D. C.', 'Estados Unidos de América', 1, 1, 1, NOW()),
           ('54G5D', 1, '2001-06-15', 'Washington D. C.', 'Estados Unidos de América', 6, 1, 1, NOW()),
           ('R4GG', 1, '2003-08-20', 'Washington D. C.', 'Estados Unidos de América', 6, 1, 1, NOW()),
           ('EDX7', 6, '2003-07-19', 'Nueva York', 'Estados Unidos de América', 1, 4, 1, NOW()),
           ('TXT5', 9, '2002-12-05', 'Baltimore', 'Maryland', 1, 6, 1, NOW()),
           ('ENH7', 9, '2003-01-11', 'Baltimore', 'Maryland', 6, 6, 1, NOW()),
           ('BT57', 10, '2004-06-08',  'Washington', 'Estados Unidos de América', 6, 6, 1, NOW()),
           ('TW1C3', 1, '2004-06-08',  'Washington', 'Estados Unidos de América', 6, 6, 1, NOW()),
           ('3NHYP3N', 5, '2013-06-18', 'Oxford', 'Inglaterra', 1, 7, 1, NOW()),
           ('4GU57D', 1, '2012-06-25', 'Washington D. C.', 'Estados Unidos de América', 1, 9, 1, NOW());

INSERT INTO Reporte (codigo, idCaso, fechaEntrega, idEmpleadoEntrega, idEmpleadoRecibe, idUsuarioCrea, fechaCrea)
    VALUES ('R-100', 5, '2022-03-10', 5, 3, 1, NOW()),
           ('R-101', 5, '2022-03-11', 5, 3, 1, NOW()),
           ('R-102', 6, '2022-03-13', 4, 3, 1, NOW()),
           ('R-103', 5, '2022-03-15', 4, 3, 1, NOW()),
           ('R-104', 7, '2022-03-15', 1, 3, 1, NOW()),
           ('R-105', 6, '2022-03-17', 5, 3, 1, NOW()),
           ('R-106', 8, '2022-04-04', 5, 3, 1, NOW()),
           ('R-107', 8, '2022-04-06', 7, 1, 1, NOW()),
           ('R-108', 10, '2022-04-21', 7, 1, 1, NOW()),
           ('R-109', 10, '2022-04-24', 6, 3, 1, NOW());

INSERT INTO DepartamentoReactivo (idDepartamento, idReactivo, lote, codigo, fechaEmpaque, fechaCaducidad, idUsuarioCrea, fechaCrea)
    VALUES (1, 1, '10000', 'R-100', '2022-02-01', '2022-12-31', 1, NOW()),
           (1, 1, '10000', 'R-101', '2022-02-10', '2022-12-31', 1, NOW()),
           (1, 3, '10003', 'R-130', '2022-02-10', '2022-10-01', 1, NOW()),
           (2, 3, '10003', 'R-131', '2022-02-20', '2022-10-10', 1, NOW()),
           (3, 3, '10003', 'R-132', '2022-02-20', '2022-10-10', 1, NOW()),
           (3, 6, '10006', 'R-160', '2022-02-20', '2022-06-01', 1, NOW()),
           (3, 6, '10006', 'R-161', '2022-02-20', '2022-06-01', 1, NOW()),
           (4, 6, '10006', 'R-162', '2022-02-25', '2022-06-10', 1, NOW()),
           (1, 2, '10002', 'R-120', '2022-02-04', '2022-04-20', 1, NOW()),
           (5, 2, '10002', 'R-121', '2022-02-04', '2022-04-20', 1, NOW());

INSERT INTO DonacionInstitucion (idDonacion, idInstitucion, idUsuarioCrea, fechaCrea)
    VALUES (1, 6, 1, NOW()),
           (2, 9, 1, NOW()),
           (3, 1, 1, NOW()),
           (4, 10, 1, NOW()),
           (4, 6, 1, NOW()),
           (5, 7, 1, NOW()),
           (5, 7, 1, NOW()),
           (6, 4, 1, NOW()),
           (7, 8, 1, NOW()),
           (8, 8, 1, NOW());

INSERT INTO EmpleadoEspecialidad (idEmpleado, idEspecialidad, idUsuarioCrea, fechaCrea)
    VALUES (1, 1, 1, NOW()),
           (1, 2, 1, NOW()),
           (4, 5, 1, NOW()),
           (5, 7, 1, NOW()),
           (5, 8, 1, NOW()),
           (5, 1, 1, NOW()),
           (9, 1, 1, NOW()),
           (7, 1, 1, NOW()),
           (5, 3, 1, NOW()),
           (6, 9, 1, NOW());

INSERT INTO EmpleadoEquipo (idEmpleado, idEquipo, idUsuarioCrea, fechaCrea)
    VALUES (1, 1, 1, NOW()),
           (2, 1, 1, NOW()),
           (4, 1, 1, NOW()),
           (6, 1, 1, NOW()),
           (5, 1, 1, NOW()),
           (1, 2, 1, NOW()),
           (4, 2, 1, NOW()),
           (6, 2, 1, NOW()),
           (7, 2, 1, NOW()),
           (9, 2, 1, NOW());

INSERT INTO EmpleadoInstitucion (idEmpleado, idInstitucion, fechaInicio, idUsuarioCrea, fechaCrea)
    VALUES (1, 10, '2004-03-18', 1, NOW()),
           (1, 7, '2006-07-20', 1, NOW()),
           (6, 10, '2006-08-10', 1, NOW()),
           (1, 10, '2006-11-04', 1, NOW()),
           (5, 10, '2006-11-05', 1, NOW()),
           (4, 10, '2006-12-06', 1, NOW()),
           (4, 10, '2007-02-10', 1, NOW()),
           (7, 10, '2013-08-20', 1, NOW()),
           (8, 10, '2001-06-21', 1, NOW()),
           (5, 10, '2010-03-15', 1, NOW());



-- TRIGGERS FECHA

CREATE TRIGGER `BeneficiarioFechaModifica` BEFORE UPDATE ON `beneficiario`
 FOR EACH ROW BEGIN 
SET NEW.fechaModifica = NOW();

CREATE TRIGGER `CasoFechaModifica` BEFORE UPDATE ON `caso`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

CREATE TRIGGER `CertificadoFechaModifica` BEFORE UPDATE ON `certificado`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

CREATE TRIGGER `DepartamentoFechaModifica` BEFORE UPDATE ON `departamento`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

CREATE TRIGGER `DepartamentoReactivoFechaModifica` BEFORE UPDATE ON `departamentoreactivo`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

CREATE TRIGGER `DonacionFechaModifica` BEFORE UPDATE ON `donacion`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

CREATE TRIGGER `DonacionInstitucion` BEFORE UPDATE ON `donacioninstitucion`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `EmpleadoFechaModifica` BEFORE UPDATE ON `empleado`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

CREATE TRIGGER `EmpleadoEquipoFechaModifica` BEFORE UPDATE ON `empleadoequipo`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

CREATE TRIGGER `EmpleadoEspecialidadFechaModifica` BEFORE UPDATE ON `empleadoespecialidad`
 FOR EACH ROW SET NEW.fechaModifica = NOW();
 
CREATE TRIGGER `EmpleadoInstitucionFechaModifica` BEFORE UPDATE ON `empleadoinstitucion`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `EquipoFechaModifica` BEFORE UPDATE ON `equipo`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `InstitucionEspecialidadFechaModifica` BEFORE UPDATE ON `institucion`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `InstitucionEducativaFechaModifica` BEFORE UPDATE ON `institucioneducativa`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `InstrumentoFechaModifica` BEFORE UPDATE ON `instrumento`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `MobiliarioFechaModifica` BEFORE UPDATE ON `mobiliario`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `PaseFechaModifica` BEFORE UPDATE ON `pase`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `ReactivoFechaModifica` BEFORE UPDATE ON `reactivo`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

CREATE TRIGGER `ReporteFechaModifica` BEFORE UPDATE ON `reporte`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `TipoCertificadoFechaModifica` BEFORE UPDATE ON `tipocertificado`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `TipoEmpleadoFechaModifica` BEFORE UPDATE ON `tipoempleado`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `TipoInstitucionFechaModifica` BEFORE UPDATE ON `tipoinstitucion`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `TipoInstrumentoFechaModifica` BEFORE UPDATE ON `tipoinstrumento`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `TipoMobiliarioFechaModifica` BEFORE UPDATE ON `tipomobiliario`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `TipoPaseFechaModifica` BEFORE UPDATE ON `tipopase`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `TipoVisitaFechaModifica` BEFORE UPDATE ON `tipovisita`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `UsuarioFechaModifica` BEFORE UPDATE ON `usuario`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `VisitaFechaModifica` BEFORE UPDATE ON `visita`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `VisitanteFechaModifica` BEFORE UPDATE ON `visitante`
 FOR EACH ROW SET NEW.fechaModifica = NOW();

 CREATE TRIGGER `FechaModifica` BEFORE UPDATE ON ``
 FOR EACH ROW SET NEW.fechaModifica = NOW();


--MANTENER REGISTROS


CREATE TRIGGER `TipoCertificadoEliminarNuevoRegistro` AFTER INSERT ON `tipocertificado`
 FOR EACH ROW DELETE FROM TipoCertificado WHERE idTipoCertificado = NEW.idTipoCertificado;

CREATE TRIGGER `TipoEmpleadoEliminarNuevoRegistro` AFTER INSERT ON `tipoempleado`
 FOR EACH ROW DELETE FROM TipoEmpleado WHERE idTipoEmpleado = NEW.idTipoEmpleado;

CREATE TRIGGER `TipoInstitucionEliminarNuevoRegistro` AFTER INSERT ON `tipoinstitucion`
 FOR EACH ROW DELETE FROM TipoInstitucion WHERE idTipoInstitucion = NEW.idTipoInstitucion;

CREATE TRIGGER `TipoInstrumentoEliminarNuevoRegistro` AFTER INSERT ON `tipoinstrumento`
 FOR EACH ROW DELETE FROM TipoInstrumento WHERE idTipoInstrumento = NEW.idTipoInstrumento;

 CREATE TRIGGER `TipoMobiliarioEliminarNuevoRegistro` AFTER INSERT ON `tipomobiliario`
 FOR EACH ROW DELETE FROM TipoMobiliario WHERE idTipoMobiliario = NEW.idTipoMobiliario;

CREATE TRIGGER `TipoPaseEliminarNuevoRegistro` AFTER INSERT ON `tipopase`
 FOR EACH ROW DELETE FROM TipoPase WHERE idTipoPase = NEW.idTipoPase;

CREATE TRIGGER `TipoVisitaEliminarNuevoRegistro` AFTER INSERT ON `tipovisita`
 FOR EACH ROW DELETE FROM TipoVisita WHERE idTipoVisita = NEW.idTipoVisita;

CREATE TRIGGER  'NO EDITAR VISITAS' BEFORE UPDATE 'Visita'
FOR EACH ROW 
