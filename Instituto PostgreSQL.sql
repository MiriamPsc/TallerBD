CREATE DATABASE institutojeffersonian
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;



CREATE TABLE public."Beneficiario"
(
    "idBeneficiario" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    nombre character varying(50) NOT NULL,
    rfc character varying(50) NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idBeneficiario")
);

ALTER TABLE IF EXISTS public."Beneficiario"
    OWNER to postgres;

CREATE TABLE public."Caso"
(
    "idCaso" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    codigo "char" NOT NULL,
    estado "char" NOT NULL,
    "fechaInicio" date NOT NULL,
    "fechaCierre" date DEFAULT null,
    "idEquipo" bigint NOT NULL,
    "idEspecialidad" bigint NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idCaso")
);

ALTER TABLE IF EXISTS public."Caso"
    OWNER to postgres;


CREATE TABLE public."Certificado"
(
    "idCertificado" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
	codigo character varying(50) NOT NULL,
    "idInstitucion" bigint NOT NULL,
    "fecha" date NOT NULL,
    ciudad character varying(50) NOT NULL,
	pais character varying(50) NOT NULL,
    "idTipoCertificado" bigint NOT NULL,
    "idEmpleado" bigint NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idCertificado")
);

ALTER TABLE IF EXISTS public."Certificado"
    OWNER to postgres;
	
CREATE TABLE public."Departamento"
(
    "idDepartamento" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    nombre character varying(50) NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idDepartamento")
);

ALTER TABLE IF EXISTS public."Departamento"
    OWNER to postgres;

CREATE TABLE public."Donacion"
(
    "idDonacion" bigint NOT NULL  GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    "fecha" date NOT NULL,
	"valor" bigint NOT NULL,
	"idBeneficiario" bigint NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idDonacion")
);

ALTER TABLE IF EXISTS public."Donacion"
    OWNER to postgres;

CREATE TABLE public."Empleado"
(
    "idEmpleado" bigint NOT NULL  GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
	"numero" bigint NOT NULL,
	nombre character varying(50) NOT NULL,
	apellidoPaterno character varying(50) NOT NULL,
	apellidoMaterno character varying(50) DEFAULT NULL,
    genero character varying(3) NOT NULL,
    ciudad character varying(50) NOT NULL,
	pais character varying(50) NOT NULL,
    "fechaNacimiento" date NOT NULL,
	rfc character varying(13) NOT NULL,
	dni character varying(13) NOT NULL,
	"idTipoEmpleado" bigint NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idEmpleado")
);

ALTER TABLE IF EXISTS public."Empleado"
    OWNER to postgres;

CREATE TABLE public."Equipo"
(
    "idEquipo" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    codigo character varying(5) NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idEquipo")
);

ALTER TABLE IF EXISTS public."Equipo"
    OWNER to postgres;

CREATE TABLE public."Especialidad"
(
    "idEspecialidad" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    nombre character varying(50) NOT NULL,
    descripcion character varying(500) NOT NULL,
    "idDepartamento" bigint NOT NULL,	
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idEspecialidad")
);

ALTER TABLE IF EXISTS public."Especialidad"
    OWNER to postgres;   

CREATE TABLE public."Institucion"
(
    "idInstitucion" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    nombre character varying(100) NOT NULL,
    codigo character varying(6) NOT NULL,
    ciudad character varying(50) NOT NULL,
    pais character varying(50) NOT NULL,
    "idTipoInstitucion" bigint NOT NULL,	
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idInstitucion")
);

ALTER TABLE IF EXISTS public."Institucion"
    OWNER to postgres; 
	
CREATE TABLE public."InstitucionEducativa"
(
    "idInstitucionEducativa" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    nombre character varying(100) NOT NULL,
    ciudad character varying(50) NOT NULL,    
	estado character varying(50) NOT NULL,
    pais character varying(50) NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idInstitucionEducativa")
);

ALTER TABLE IF EXISTS public."InstitucionEducativa"
    OWNER to postgres; 
	
CREATE TABLE public."Instrumento"
(
    "idInstrumento" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    codigo character varying(6) NOT NULL,
    "idTipoInstrumento" bigint DEFAULT null,
    "idDepartamento" bigint DEFAULT null,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idInstrumento")
);

ALTER TABLE IF EXISTS public."Instrumento"
    OWNER to postgres; 

CREATE TABLE public."Mobiliario"
(
    "idMobiliario" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    codigo character varying(5) NOT NULL,
    "idTipoMobiliario" bigint NOT null,
    "idDepartamento" bigint NOT null,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idMobiliario")
);

ALTER TABLE IF EXISTS public."Mobiliario"
    OWNER to postgres; 
	
CREATE TABLE public."Pase"
(
    "idPase" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    codigo character varying(5) NOT NULL,
    "fechaInicio" date NOT NULL,
    "fechaFinal" date NOT NULL,
	"idTipoPase" bigint NOT NULL,
	"idInstitucion" bigint NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idPase")
);

ALTER TABLE IF EXISTS public."Pase"
    OWNER to postgres;
	
CREATE TABLE public."Reactivo"
(
    "idReactivo" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    nombre character varying(100) NOT NULL,
    formula character varying(250) NOT NULL,
	tipo character varying(1) NOT NULL,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idReactivo")
);

ALTER TABLE IF EXISTS public."Reactivo"
    OWNER to postgres;

CREATE TABLE public."Reporte"
(
    "idReporte" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    codigo character varying(5) NOT NULL,
    "idCaso" bigint NOT null,
	"fechaEntrega" date NOT null,
    "idEmpleadoEntrega" bigint NOT null,
    "idEmpleadoRecibe" bigint NOT null,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idReporte")
);

ALTER TABLE IF EXISTS public."Reporte"
    OWNER to postgres; 

CREATE TABLE public."TipoCertificado"
(
    "idTipoCertificado" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    nombre character varying(100) NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idTipoCertificado")
);

ALTER TABLE IF EXISTS public."TipoCertificado"
    OWNER to postgres;
	
CREATE TABLE public."TipoEmpleado"
(
    "idTipoEmpleado" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    nombre character varying(50) NOT NULL,
    descripcion character varying(200) NOT NULL,
	sueldoBase numeric (10, 2) NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idTipoEmpleado")
);

ALTER TABLE IF EXISTS public."TipoEmpleado"
    OWNER to postgres;
	
CREATE TABLE public."TipoInstitucion"
(
    "idTipoInstitucion" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    nombre character varying(50) NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idTipoInstitucion")
);

ALTER TABLE IF EXISTS public."TipoInstitucion"
    OWNER to postgres;
	
CREATE TABLE public."TipoInstrumento"
(
    "idTipoInstrumento" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    nombre character varying(50) NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idTipoInstrumento")
);

ALTER TABLE IF EXISTS public."TipoInstrumento"
    OWNER to postgres;

CREATE TABLE public."TipoMobiliario"
(
    "idTipoMobiliario" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    nombre character varying(50) NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idTipoMobiliario")
);

ALTER TABLE IF EXISTS public."TipoMobiliario"
    OWNER to postgres;

CREATE TABLE public."TipoPase"
(
    "idTipoPase" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    nombre character varying(50) NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idTipoPase")
);

ALTER TABLE IF EXISTS public."TipoPase"
    OWNER to postgres;
	
CREATE TABLE public."TipoVisita"
(
    "idTipoVisita" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    nombre character varying(50) NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idTipoVisita")
);

ALTER TABLE IF EXISTS public."TipoVisita"
    OWNER to postgres;

CREATE TABLE public."Usuario"
(
    "idUsuario" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
	nombre character varying(50) NOT NULL,
	apellidoPaterno character varying(50) NOT NULL,
	apellidoMaterno character varying(50) DEFAULT NULL,
    correo character varying(50) NOT NULL,
    clave character varying(50) NOT NULL,
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idUsuario")
);

ALTER TABLE IF EXISTS public."Usuario"
    OWNER to postgres;

CREATE TABLE public."Visita"
(
    "idVisita" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    codigo character varying(5) NOT NULL,	
	"fecha" date NOT NULL,
	"idTipoVisita" bigint NOT null,	
	"idVisitante" bigint NOT null,	
	"idPase" bigint NOT null,	
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idVisita")
);

ALTER TABLE IF EXISTS public."Visita"
    OWNER to postgres;

CREATE TABLE public."Visitante"
(
    "idVisitante" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
	nombre character varying(50) NOT NULL,
	apellidoPaterno character varying(50) NOT NULL,
	apellidoMaterno character varying(50) DEFAULT NULL,
    correo character varying(50) NOT NULL,
    telefono character varying(10) NOT NULL,
	"fechaNacimiento" date NOT NULL,
	dni character varying(13) NOT NULL,
	estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idVisitante")
);

ALTER TABLE IF EXISTS public."Visitante"
    OWNER to postgres;

CREATE TABLE public."DepartamentoReactivo"
(
    "idDepartamentoReactivo" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    "idDepartamento" bigint NOT null,	
	"idReactivo" bigint NOT null,
	lote character varying(5) NOT NULL,	
	codigo character varying(10) NOT NULL,	
	"fechaEmpaque" date NOT NULL,
	"fechaCaducidad" date NOT NULL,		
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idDepartamentoReactivo")
);

ALTER TABLE IF EXISTS public."DepartamentoReactivo"
    OWNER to postgres;
	
CREATE TABLE public."DonacionInstitucion"
(
    "idDonacionInstitucion" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    "idDonacion" bigint NOT null,	
	"idInstitucion" bigint NOT null,	
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idDonacionInstitucion")
);

ALTER TABLE IF EXISTS public."DonacionInstitucion"
    OWNER to postgres;
	
CREATE TABLE public."EmpleadoEspecialidad"
(
    "idEmpleadoEspecialidad" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    "idEmpleado" bigint NOT null,	
	"idEspecialidad" bigint NOT null,	
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idEmpleadoEspecialidad")
);

ALTER TABLE IF EXISTS public."EmpleadoEspecialidad"
    OWNER to postgres;
	
CREATE TABLE public."EmpleadoEquipo"
(
    "idEmpleadoEquipo" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    "idEmpleado" bigint NOT null,	
	"idEquipo" bigint NOT null,	
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idEmpleadoEquipo")
);

ALTER TABLE IF EXISTS public."EmpleadoEquipo"
    OWNER to postgres;
	
CREATE TABLE public."EmpleadoInstitucion"
(
    "idEmpleadoInstitucion" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    "idEmpleado" bigint NOT null,	
	"idInstitucion" bigint NOT null,
	"fechaInicio" date NOT NULL,
	"fechaFinal" date DEFAULT NULL,	
    estatus bigint DEFAULT 1,
    "idUsuarioCrea" bigint DEFAULT null,
    "fechaCrea" date DEFAULT null,
    "idUsuarioModifica" bigint DEFAULT null,
    "fechaModifica" date DEFAULT null,
    PRIMARY KEY ("idEmpleadoInstitucion")
);

ALTER TABLE IF EXISTS public."EmpleadoInstitucion"
    OWNER to postgres;

--INDEX

CREATE INDEX "IXBeneficiario"
    ON public."Beneficiario" USING btree
    ("idBeneficiario" ASC NULLS LAST)
;

CREATE INDEX "IXCaso"
    ON public."Caso" USING btree
    ("idCaso" ASC NULLS LAST)
;

CREATE INDEX "IXCertificado"
    ON public."Certificado" USING btree
    ("idCertificado" ASC NULLS LAST)
;

CREATE INDEX "IXDepartamento"
    ON public."Departamento" USING btree
    ("idDepartamento" ASC NULLS LAST)
;

CREATE INDEX "IXDonacion"
    ON public."Donacion" USING btree
    ("idDonacion" ASC NULLS LAST)
;

CREATE INDEX "IXEmpleado"
    ON public."Empleado" USING btree
    ("idEmpleado" ASC NULLS LAST)
;

CREATE INDEX "IXEquipo"
    ON public."Equipo" USING btree
    ("idEquipo" ASC NULLS LAST)
;

CREATE INDEX "IXEspecialidad"
    ON public."Especialidad" USING btree
    ("idEspecialidad" ASC NULLS LAST)
;

CREATE INDEX "IXInstitucion"
    ON public."Institucion" USING btree
    ("idInstitucion" ASC NULLS LAST)
;

CREATE INDEX "IXInstitucionEducativa"
    ON public."InstitucionEducativa" USING btree
    ("idInstitucionEducativa" ASC NULLS LAST)
;

CREATE INDEX "IXInstrumento"
    ON public."Instrumento" USING btree
    ("idInstrumento" ASC NULLS LAST)
;

CREATE INDEX "IXMobiliario"
    ON public."Mobiliario" USING btree
    ("idMobiliario" ASC NULLS LAST)
;

CREATE INDEX "IXPase"
    ON public."Pase" USING btree
    ("idPase" ASC NULLS LAST)
;

CREATE INDEX "IXReactivo"
    ON public."Reactivo" USING btree
    ("idReactivo" ASC NULLS LAST)
;

CREATE INDEX "IXReporte"
    ON public."Reporte" USING btree
    ("idReporte" ASC NULLS LAST)
;

CREATE INDEX "IXTipoCertificado"
    ON public."TipoCertificado" USING btree
    ("idTipoCertificado" ASC NULLS LAST)
;

CREATE INDEX "IXTipoEmpleado"
    ON public."TipoEmpleado" USING btree
    ("idTipoEmpleado" ASC NULLS LAST)
;

CREATE INDEX "IXTipoInstitucion"
    ON public."TipoInstitucion" USING btree
    ("idTipoInstitucion" ASC NULLS LAST)
;

CREATE INDEX "IXTipoInstrumento"
    ON public."TipoInstrumento" USING btree
    ("idTipoInstrumento" ASC NULLS LAST)
;

CREATE INDEX "IXTipoMobiliario"
    ON public."TipoMobiliario" USING btree
    ("idTipoMobiliario" ASC NULLS LAST)
;

CREATE INDEX "IXTipoPase"
    ON public."TipoPase" USING btree
    ("idTipoPase" ASC NULLS LAST)
;

CREATE INDEX "IXTipoVisita"
    ON public."TipoVisita" USING btree
    ("idTipoVisita" ASC NULLS LAST)
;

CREATE INDEX "IXUsuario"
    ON public."Usuario" USING btree
    ("idUsuario" ASC NULLS LAST)
;

CREATE INDEX "IXVisita"
    ON public."Visita" USING btree
    ("idVisita" ASC NULLS LAST)
;

CREATE INDEX "IXVisitante"
    ON public."Visitante" USING btree
    ("idVisitante" ASC NULLS LAST)
;

CREATE INDEX "IXDepartamentoReactivo"
    ON public."DepartamentoReactivo" USING btree
    ("idDepartamentoReactivo" ASC NULLS LAST)
;

CREATE INDEX "IXDonacionInstitucion"
    ON public."DonacionInstitucion" USING btree
    ("idDonacionInstitucion" ASC NULLS LAST)
;

CREATE INDEX "IXEmpleadoEspecialidad"
    ON public."EmpleadoEspecialidad" USING btree
    ("idEmpleadoEspecialidad" ASC NULLS LAST)
;

CREATE INDEX "IXEmpleadoEquipo"
    ON public."EmpleadoEquipo" USING btree
    ("idEmpleadoEquipo" ASC NULLS LAST)
;

CREATE INDEX "IXEmpleadoInstitucion"
    ON public."EmpleadoInstitucion" USING btree
    ("idEmpleadoInstitucion" ASC NULLS LAST)
;


--RELACIONES


ALTER TABLE IF EXISTS public."Beneficiario"
    ADD CONSTRAINT "FKBeneficiarioUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Beneficiario"
    ADD CONSTRAINT "FKBeneficiarioUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;


ALTER TABLE IF EXISTS public."Caso"
    ADD CONSTRAINT "FKCasoUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Caso"
    ADD CONSTRAINT "FKCasoUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Certificado"
    ADD CONSTRAINT "FKCertificadoUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Certificado"
    ADD CONSTRAINT "FKCertificadoUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Departamento"
    ADD CONSTRAINT "FKDepartamentoUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Departamento"
    ADD CONSTRAINT "FKDepartamentoUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Donacion"
    ADD CONSTRAINT "FKDonacionUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Donacion"
    ADD CONSTRAINT "FKDonacionDonacionUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Empleado"
    ADD CONSTRAINT "FKEmpleadoUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Empleado"
    ADD CONSTRAINT "FKEmpleadoEmpleadoUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Equipo"
    ADD CONSTRAINT "FKEquipoUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Equipo"
    ADD CONSTRAINT "FKEquipoUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Especialidad"
    ADD CONSTRAINT "FKEspecialidadUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Especialidad"
    ADD CONSTRAINT "FKEspecialidadUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Institucion"
    ADD CONSTRAINT "FKInstitucionUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Institucion"
    ADD CONSTRAINT "FKInstitucionUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."InstitucionEducativa"
    ADD CONSTRAINT "FKInstitucionEducativaUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."InstitucionEducativa"
    ADD CONSTRAINT "FKInstitucionEducativaUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Instrumento"
    ADD CONSTRAINT "FKInstrumentoUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Instrumento"
    ADD CONSTRAINT "FKInstrumentoUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Mobiliario"
    ADD CONSTRAINT "FKMobiliarioUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Mobiliario"
    ADD CONSTRAINT "FKMobiliarioUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Pase"
    ADD CONSTRAINT "FKPaseUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Pase"
    ADD CONSTRAINT "FKPaseUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Reactivo"
    ADD CONSTRAINT "FKReactivoUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Reactivo"
    ADD CONSTRAINT "FKReactivoUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Reporte"
    ADD CONSTRAINT "FKReporteUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Reporte"
    ADD CONSTRAINT "FKReporteUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."TipoCertificado"
    ADD CONSTRAINT "FKTipoCertificadoUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."TipoCertificado"
    ADD CONSTRAINT "FKTipoCertificadoUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."TipoEmpleado"
    ADD CONSTRAINT "FKTipoEmpleadoUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."TipoEmpleado"
    ADD CONSTRAINT "FKTipoEmpleadoUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."TipoInstitucion"
    ADD CONSTRAINT "FKTipoInstitucionUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."TipoInstitucion"
    ADD CONSTRAINT "FKTipoInstitucionUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."TipoInstrumento"
    ADD CONSTRAINT "FKTipoInstrumentoUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."TipoInstrumento"
    ADD CONSTRAINT "FKTipoInstrumentoUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."TipoMobiliario"
    ADD CONSTRAINT "FKTipoMobiliarioUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."TipoMobiliario"
    ADD CONSTRAINT "FKTipoMobiliarioUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."TipoPase"
    ADD CONSTRAINT "FKTipoPaseUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."TipoPase"
    ADD CONSTRAINT "FKTipoPaseUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."TipoVisita"
    ADD CONSTRAINT "FKTipoVisitaUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."TipoVisita"
    ADD CONSTRAINT "FKTipoVisitaUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Usuario"
    ADD CONSTRAINT "FKUsuarioUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Usuario"
    ADD CONSTRAINT "FKUsuarioUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Visita"
    ADD CONSTRAINT "FKVisitaUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Visita"
    ADD CONSTRAINT "FKVisitaUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Visitante"
    ADD CONSTRAINT "FKVisitanteUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Visitante"
    ADD CONSTRAINT "FKVisitanteUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."DepartamentoReactivo"
    ADD CONSTRAINT "FKDepartamentoReactivoUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."DepartamentoReactivo"
    ADD CONSTRAINT "FKDepartamentoReactivoUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."DonacionInstitucion"
    ADD CONSTRAINT "FKDonacionInstitucionUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."DonacionInstitucion" ("idDonacionInstitucion") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."DonacionInstitucion"
    ADD CONSTRAINT "FKDonacionInstitucionUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."DonacionInstitucion" ("idDonacionInstitucion") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."EmpleadoEspecialidad"
    ADD CONSTRAINT "FKEmpleadoEspecialidadUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."EmpleadoEspecialidad" ("idEmpleadoEspecialidad") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."EmpleadoEspecialidad"
    ADD CONSTRAINT "FKEmpleadoEspecialidadUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."EmpleadoEspecialidad" ("idEmpleadoEspecialidad") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."EmpleadoEquipo"
    ADD CONSTRAINT "FKEmpleadoEquipoUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."EmpleadoEquipo" ("idEmpleadoEquipo") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."EmpleadoEquipo"
    ADD CONSTRAINT "FKEmpleadoEquipoUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."EmpleadoEquipo" ("idEmpleadoEquipo") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."EmpleadoInstitucion"
    ADD CONSTRAINT "FKEmpleadoInstitucionUsuarioCrea" FOREIGN KEY ("idUsuarioCrea")
    REFERENCES public."EmpleadoInstitucion" ("idEmpleadoInstitucion") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."EmpleadoInstitucion"
    ADD CONSTRAINT "FKEmpleadoInstitucionUsuarioModifica" FOREIGN KEY ("idUsuarioModifica")
    REFERENCES public."EmpleadoInstitucion" ("idEmpleadoInstitucion") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Caso"
    ADD CONSTRAINT "FKCasoEquipo" FOREIGN KEY ("idEquipo")
    REFERENCES public."Equipo" ("idEquipo") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Caso"
    ADD CONSTRAINT "FKCasoEspecialidad" FOREIGN KEY ("idEspecialidad")
    REFERENCES public."Especialidad" ("idEspecialidad") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Certificado"
    ADD CONSTRAINT "FKCertificadoInstitucionEducativa" FOREIGN KEY ("idInstitucion")
    REFERENCES public."InstitucionEducativa" ("idInstitucionEducativa") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Certificado"
    ADD CONSTRAINT "FKCertificadoTipoCertificado" FOREIGN KEY ("idTipoCertificado")
    REFERENCES public."TipoCertificado" ("idTipoCertificado") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Certificado"
    ADD CONSTRAINT "FKCertificadoEmpleado" FOREIGN KEY ("idEmpleado")
    REFERENCES public."Empleado" ("idEmpleado") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Donacion"
    ADD CONSTRAINT "FKDonacionBeneficiario" FOREIGN KEY ("idBeneficiario")
    REFERENCES public."Beneficiario" ("idBeneficiario") MATCH SIMPLE;

ALTER TABLE IF EXISTS public."Empleado"
    ADD CONSTRAINT "FKEmpleadoTipoEmpleado" FOREIGN KEY ("idTipoEmpleado")
    REFERENCES public."TipoEmpleado" ("idTipoEmpleado") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Especialidad"
    ADD CONSTRAINT "FKEspecialidadDepartamento" FOREIGN KEY ("idDepartamento")
    REFERENCES public."Departamento" ("idDepartamento") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Institucion"
    ADD CONSTRAINT "FKInstitucionTipoInstitucion" FOREIGN KEY ("idTipoInstitucion")
    REFERENCES public."TipoInstitucion" ("idTipoInstitucion") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Instrumento"
    ADD CONSTRAINT "FKInstrumentoTipoInstrumento" FOREIGN KEY ("idTipoInstrumento")
    REFERENCES public."TipoInstrumento" ("idTipoInstrumento") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Instrumento"
    ADD CONSTRAINT "FKInstrumentoDepartamento" FOREIGN KEY ("idDepartamento")
    REFERENCES public."Departamento" ("idDepartamento") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Mobiliario"
    ADD CONSTRAINT "FKMobiliarioTipoMobiliario" FOREIGN KEY ("idTipoMobiliario")
    REFERENCES public."TipoMobiliario" ("idTipoMobiliario") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Mobiliario"
    ADD CONSTRAINT "FKMobiliarioDepartamento" FOREIGN KEY ("idDepartamento")
    REFERENCES public."Departamento" ("idDepartamento") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Pase"
    ADD CONSTRAINT "FKPaseTipoPase" FOREIGN KEY ("idTipoPase")
    REFERENCES public."TipoPase" ("idTipoPase") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Pase"
    ADD CONSTRAINT "FKPaseInstitucion" FOREIGN KEY ("idInstitucion")
    REFERENCES public."Institucion" ("idInstitucion") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Reporte"
    ADD CONSTRAINT "FKReporteCaso" FOREIGN KEY ("idCaso")
    REFERENCES public."Caso" ("idCaso") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Reporte"
    ADD CONSTRAINT "FKReporteEmpleadoEntrega" FOREIGN KEY ("idEmpleadoEntrega")
    REFERENCES public."Empleado" ("idEmpleado") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Reporte"
    ADD CONSTRAINT "FKReporteEmpleadoRecibe" FOREIGN KEY ("idEmpleadoRecibe")
    REFERENCES public."Empleado" ("idEmpleado") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Visita"
    ADD CONSTRAINT "FKVisitaTipoVisita" FOREIGN KEY ("idTipoVisita")
    REFERENCES public."TipoVisita" ("idTipoVisita") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Visita"
    ADD CONSTRAINT "FKVisitaVisitante" FOREIGN KEY ("idVisitante")
    REFERENCES public."Visitante" ("idVisitante") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."Visita"
    ADD CONSTRAINT "FKVisitaPase" FOREIGN KEY ("idPase")
    REFERENCES public."Pase" ("idPase") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."DepartamentoReactivo"
    ADD CONSTRAINT "FKDepartamentoReactivoDepartamento" FOREIGN KEY ("idDepartamento")
    REFERENCES public."Departamento" ("idDepartamento") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."DepartamentoReactivo"
    ADD CONSTRAINT "FKDepartamentoReactivoReactivo" FOREIGN KEY ("idReactivo")
    REFERENCES public."Reactivo" ("idReactivo") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."DonacionInstitucion"
    ADD CONSTRAINT "FKDonacionInstitucionDonacion" FOREIGN KEY ("idDonacion")
    REFERENCES public."Donacion" ("idDonacion") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."DonacionInstitucion"
    ADD CONSTRAINT "FKDonacionInstitucionInstitucion" FOREIGN KEY ("idInstitucion")
    REFERENCES public."Institucion" ("idInstitucion") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."EmpleadoEspecialidad"
    ADD CONSTRAINT "FKEmpleadoEspecialidadEmpleado" FOREIGN KEY ("idEmpleado")
    REFERENCES public."Empleado" ("idEmpleado") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."EmpleadoEspecialidad"
    ADD CONSTRAINT "FKEmpleadoEspecialidadEspecialidad" FOREIGN KEY ("idEspecialidad")
    REFERENCES public."Especialidad" ("idEspecialidad") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."EmpleadoEquipo"
    ADD CONSTRAINT "FKEmpleadoEquipoEmpleado" FOREIGN KEY ("idEmpleado")
    REFERENCES public."Empleado" ("idEmpleado") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."EmpleadoEquipo"
    ADD CONSTRAINT "FKEmpleadoEquipoEquipo" FOREIGN KEY ("idEquipo")
    REFERENCES public."Equipo" ("idEquipo") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."EmpleadoInstitucion"
    ADD CONSTRAINT "FKEmpleadoInstitucionEmpleado" FOREIGN KEY ("idEmpleado")
    REFERENCES public."Empleado" ("idEmpleado") MATCH SIMPLE;
	
ALTER TABLE IF EXISTS public."EmpleadoInstitucion"
    ADD CONSTRAINT "FKEmpleadoInstitucionInstitucion" FOREIGN KEY ("idInstitucion")
    REFERENCES public."Institucion" ("idInstitucion") MATCH SIMPLE;

--INSERT

INSERT INTO public."Usuario"(
	nombre, apellidopaterno, apellidomaterno, correo, clave, "idUsuarioCrea", "fechaCrea")
    VALUES ('Miriam Priscila', 'Moreno', 'Reyna', 'I19050460@monclova.tecnm.mx', 'Tec12345.', 1, NOW());


INSERT INTO public."Beneficiario"(
	nombre, rfc, "idUsuarioCrea", "fechaCrea")    
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

INSERT INTO public."Departamento" (nombre, "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."Donacion"(
	fecha, valor, "idBeneficiario", "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."Equipo" (codigo, idUsuarioCrea, fechaCrea)
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

NSERT INTO public."Especialidad"(
	nombre, descripcion, "idDepartamento", "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."TipoCertificado"(
	nombre, "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."TipoEmpleado"(
	nombre, descripcion, sueldobase, "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."TipoInstitucion"(
	nombre, "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."TipoInstrumento"(
	nombre, "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."TipoMobiliario"(
	nombre, "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."TipoPase"(
	nombre, "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."TipoVisita"(
	nombre, "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."Visitante"(
	nombre, apellidopaterno, apellidomaterno, correo, telefono, "fechaNacimiento", dni, "idUsuarioCrea", "fechaCrea")
    VALUES ('Namjoon', 'Kim', ' ', 'namgreen@gmail.com', '8226672918', '1994-09-12', '1425369685741', 1, NOW()),
           ('Seokjin', 'Kim', ' ', 'wwhuknow@hotmail.com', '8220964892', '1992-12-04','2014785345129', 1, NOW()),
           ('Yoongi', 'Min', ' ', 'tangerinedark@gmail.com', '8223902765', '1993-03-09','0193749878321', 1, NOW()),
           ('Hoseok', 'Jung', ' ', 'urhope@yahoo.com', '8226397201', '1994-02-18', '0198327454253', 1, NOW()),
           ('Jimin', 'Park', ' ', 'lachimolala@hotmail.com', '8228495027', '1995-10-13', '7412589630147', 1, NOW()),
           ('Taehyung', 'Kim', ' ', 'blueandgrey@hotmail.com', '8224839672', '1995-12-30', '0123996334111', 1, NOW()),
           ('Jungkook', 'Jung', ' ', 'lovearmy@hotmail.com', '8225362500', '1997-09-01', '0123354784155', 1, NOW()),
           ('Micol', 'Alanis', 'López', 'alanismicol@hotmail.com', '8661397396', '1995-04-20', '0007864552179', 1, NOW()),
           ('Max', 'Alanis', 'López', 'maxiblue@hotmail.com', '8661245790', '1989-12-13', '1035574122985', 1, NOW()),
           ('Adele', 'Blue', 'Adkins', 'easyonmail@hotmail.com', '0203827156', '1988-05-05', '7895555441238', 1, NOW());

INSERT INTO public."Empleado"(
	numero, nombre, apellidopaterno, apellidomaterno, genero, ciudad, pais, "fechaNacimiento", rfc, dni, "idTipoEmpleado", "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."Institucion"(
	nombre, codigo, ciudad, pais, "idTipoInstitucion", "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."InstitucionEducativa"(
	nombre, ciudad, estado, pais,"idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."Instrumento"(
	codigo, "idTipoInstrumento", "idDepartamento", "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."Mobiliario"(
	codigo, "idTipoMobiliario", "idDepartamento", "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."Pase"(
	codigo, "fechaInicio", "fechaFinal", "idTipoPase", "idInstitucion", "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."Reactivo"(
	nombre, formula, tipo, "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."Visita"(
	codigo, fecha, "idTipoVisita", "idVisitante", "idPase", "idUsuarioCrea", "fechaCrea")
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


INSERT INTO public."Caso"(
	codigo, estado, "fechaInicio", "idEquipo", "idEspecialidad", "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."Certificado"(
	codigo, "idInstitucion", fecha, ciudad, pais, "idTipoCertificado", "idEmpleado", "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."Reporte"(
	codigo, "idCaso", "fechaEntrega", "idEmpleadoEntrega", "idEmpleadoRecibe", "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."DepartamentoReactivo"(
	"idDepartamento", "idReactivo", lote, codigo, "fechaEmpaque", "fechaCaducidad", "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."DonacionInstitucion"(
	"idDonacion", "idInstitucion", "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."EmpleadoEspecialidad"(
	"idEmpleado", "idEspecialidad", "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."EmpleadoEquipo"(
	"idEmpleado", "idEquipo", "idUsuarioCrea", "fechaCrea")
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

INSERT INTO public."EmpleadoInstitucion"(
	"idEmpleado", "idInstitucion", "fechaInicio", "idUsuarioCrea", "fechaCrea")
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

