-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-11-04 02:04:31.831

-- tables
-- Table: APODERADO
CREATE TABLE APODERADO (
    CODAPOD char(5) NOT NULL COMMENT 'Aqui agregamos el codigo del apoderado.',
    NOMAPOD varchar(50) NOT NULL COMMENT 'Aqui agregamos el nombre del apoderado.',
    APEAPOD varchar(50) NOT NULL COMMENT 'Aqui agregamos el apellido del apoderado.',
    DIREAPOD varchar(50) NOT NULL COMMENT 'En esta seccion agregamos la direccion del apoderado.',
    PROAPOD varchar(70) NOT NULL COMMENT 'En esta seccion agregamos la provincia del apoderado.',
    CELAPOD char(9) NOT NULL COMMENT 'En esta seccion agregamos numero de celular del apoderado.',
    EMAAPOD varchar(20) NOT NULL COMMENT 'En esta seccion agregamos el correo electronico del apoderado.',
    DNIAPOD char(8) NOT NULL COMMENT 'En esta seccion agregamos documento de identificacion del apoderado.',
    CODUBI char(6) NOT NULL COMMENT 'En esta seccion agregamos codigo de ubigeo del apoderado.',
    CONSTRAINT APODERADO_pk PRIMARY KEY (CODAPOD)
) COMMENT 'En esta entidad, recopilaremos la informacion del apoderado del estudiante.';

-- Table: ENCARGADO_MATRICULA
CREATE TABLE ENCARGADO_MATRICULA (
    CODENC char(6) NOT NULL COMMENT 'En esta seccion agregamos el codigo del encargado de las matriculas.',
    NOMENC varchar(50) NOT NULL COMMENT 'En esta seccion agregamos el nombre del encargado de las matriculas.',
    APEENC varchar(50) NOT NULL COMMENT 'En esta seccion agregamos el apellido del encargado de las matriculas.',
    CELENC char(9) NOT NULL COMMENT 'En esta seccion agregamos el numero de celular del encargado de las matriculas.',
    DNIENC char(8) NOT NULL COMMENT 'En esta seccion agregamos el documento de identidad del encargado de las matriculas.',
    CARENC varchar(50) NOT NULL COMMENT 'En esta seccion agregamos el cargo que ocupa el encargado de las matriculas.',
    EMAENC varchar(50) NOT NULL COMMENT 'En esta seccion agregamos el correo electronico  del encargado de las matriculas.',
    CONSTRAINT ENCARGADO_MATRICULA_pk PRIMARY KEY (CODENC)
) COMMENT 'En esta entidad, recopilaremos la informacion del  de la persona que realizara la matricula.';

-- Table: ESTUDIANTE
CREATE TABLE ESTUDIANTE (
    CODESTU char(5) NOT NULL COMMENT 'En esta seccion agregamos el codigo del estudiante.',
    NOMESTU varchar(50) NOT NULL COMMENT 'En esta seccion agregamos el nombre del estudiante.',
    APEESTU varchar(50) NOT NULL COMMENT 'En esta seccion agregamos el apellido del estudiante.',
    DIRESTU varchar(50) NOT NULL COMMENT 'En esta seccion agregamos la direccion del estudiante.',
    CELESTU char(9) NOT NULL COMMENT 'En esta seccion agregamos el numero de cellular del estudiante.',
    EMAESTU varchar(20) NOT NULL COMMENT 'En esta seccion agregamos el correo electronico del estudiante.',
    DNIESTU char(8) NOT NULL COMMENT 'En esta seccion agregamos el documento de identidad del estudiante.',
    FECNACESTU date NOT NULL COMMENT 'En esta seccion agregamos la fecha de nacimiento del estudiante.',
    CODUBI char(6) NOT NULL COMMENT 'En esta seccion agregamos el codigo de ubigeo del estudiante.',
    CONSTRAINT ESTUDIANTE_pk PRIMARY KEY (CODESTU)
) COMMENT 'En esta entidad, recopilaremos la informacion del  del estudiante.';

-- Table: MATRICULA
CREATE TABLE MATRICULA (
    IDMATR char(5) NOT NULL COMMENT 'En esta seccion agregamos la identificacion del estudiante que se va a matricular.',
    CODENC char(6) NOT NULL COMMENT 'En esta seccion agregamos el codigo del encargado de las matriculas.',
    CODAPOD char(5) NOT NULL COMMENT 'En esta seccion agregamos el codigo del apoderado .',
    CODESTU char(5) NOT NULL COMMENT 'En esta seccion agregamos el codigo del del estudiante.',
    FECMATR date NOT NULL COMMENT 'En esta seccion agregamos la fecha de matricula.',
    TIPMATR char(1) NOT NULL COMMENT 'En esta seccion agregamos el tipo de matricula que se realizara.',
    GRADMATR int NOT NULL COMMENT 'En esta seccion agregamos el grado de matricula del estudiante.',
    CONSTRAINT MATRICULA_pk PRIMARY KEY (IDMATR)
) COMMENT 'En esta entidad, recopilaremos la informacion del  de matricula.';

-- Table: UBIGEO
CREATE TABLE UBIGEO (
    CODUBI char(6) NOT NULL COMMENT 'En esta seccion agregamos el codigo de ubigeo de la persona.',
    DISTUBI varchar(60) NOT NULL COMMENT 'En esta seccion agregamos distrito de ubigeo de la persona.',
    PROVUBI varchar(80) NOT NULL COMMENT 'En esta seccion agregamos provincia de ubigeo de la persona.',
    DEPUBI varchar(60) NOT NULL COMMENT 'En esta seccion agregamos departamento de ubigeo de la persona.',
    CONSTRAINT UBIGEO_pk PRIMARY KEY (CODUBI)
) COMMENT 'En esta entidad , recopilaremos la informacion de la ubicacion de la persona.';

-- foreign keys
-- Reference: APODERADO_UBIGEO (table: APODERADO)
ALTER TABLE APODERADO ADD CONSTRAINT APODERADO_UBIGEO FOREIGN KEY APODERADO_UBIGEO (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: ESTUDIANTE_UBIGEO (table: ESTUDIANTE)
ALTER TABLE ESTUDIANTE ADD CONSTRAINT ESTUDIANTE_UBIGEO FOREIGN KEY ESTUDIANTE_UBIGEO (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: MATRICULA_APODERADO (table: MATRICULA)
ALTER TABLE MATRICULA ADD CONSTRAINT MATRICULA_APODERADO FOREIGN KEY MATRICULA_APODERADO (CODENC)
    REFERENCES APODERADO (CODAPOD);

-- Reference: MATRICULA_ENCARGADO_MATRICULA (table: MATRICULA)
ALTER TABLE MATRICULA ADD CONSTRAINT MATRICULA_ENCARGADO_MATRICULA FOREIGN KEY MATRICULA_ENCARGADO_MATRICULA (CODAPOD)
    REFERENCES ENCARGADO_MATRICULA (CODENC);

-- Reference: MATRICULA_ESTUDIANTE (table: MATRICULA)
ALTER TABLE MATRICULA ADD CONSTRAINT MATRICULA_ESTUDIANTE FOREIGN KEY MATRICULA_ESTUDIANTE (CODESTU)
    REFERENCES ESTUDIANTE (CODESTU);

-- End of file.

