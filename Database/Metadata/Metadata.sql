/******************************************************************************/
/***         Generated by IBExpert 2020.4.21.2 07/10/2022 18:19:21          ***/
/******************************************************************************/

/******************************************************************************/
/***      Following SET SQL DIALECT is just for the Database Comparer       ***/
/******************************************************************************/
SET SQL DIALECT 3;



/******************************************************************************/
/***                                Domains                                 ***/
/******************************************************************************/

CREATE DOMAIN FINANCIAL_ACCOUNT_TYPE AS
CHAR(1)
DEFAULT 'S'
CHECK(VALUE IN ('S', 'E'));

CREATE DOMAIN LOGICAL AS
CHAR(1)
DEFAULT 'N'
CHECK (VALUE IN ('Y','N'));

CREATE DOMAIN TASK_CONTEXT AS
CHAR(1)
CHECK (VALUE IN ('H', 'W', 'C', 'F', 'E'));

CREATE DOMAIN TASK_PERIOD AS
CHAR(1)
DEFAULT 'D'
CHECK (VALUE IN ('D', 'W', 'M', 'Y'));

CREATE DOMAIN TASK_STATE AS
CHAR(1)
DEFAULT 'A'
CHECK (VALUE IN ('A', 'T', 'C'));

CREATE DOMAIN VALUE_FINANCIAL AS
NUMERIC(15,2)
DEFAULT 0.00;



/******************************************************************************/
/***                               Generators                               ***/
/******************************************************************************/

CREATE GENERATOR GEN_COMPANY;
CREATE GENERATOR GEN_FINANCIAL_ACCOUNT;
CREATE GENERATOR GEN_JOB;
CREATE GENERATOR GEN_JOB_HISTORIC;
CREATE GENERATOR GEN_PERSON;
CREATE GENERATOR GEN_PERSON_EMPLOYEE;
CREATE GENERATOR GEN_RECORD_SHEET;
CREATE GENERATOR GEN_RECORD_SHEET_TIME;
CREATE GENERATOR GEN_TASK;


/******************************************************************************/
/***                                 Tables                                 ***/
/******************************************************************************/



CREATE TABLE COMPANY (
    ID_COMPANY              INTEGER NOT NULL,
    DESCRIPTION             VARCHAR(100) NOT NULL,
    LOG_DATE_INSERT_RECORD  TIMESTAMP default current_timestamp NOT NULL,
    LOG_DATE_UPDATE_RECORD  TIMESTAMP default current_timestamp NOT NULL
);

CREATE TABLE FINANCIAL_ACCOUNT (
    ID_FINANCIAL_ACCOUNT    INTEGER NOT NULL,
    DESCRIPTION             VARCHAR(255) NOT NULL,
    TYPE_ACCOUNT            FINANCIAL_ACCOUNT_TYPE NOT NULL,
    DATA_ACCOUNT            DATE NOT NULL,
    VALUE_ACCOUNT           VALUE_FINANCIAL NOT NULL,
    LOG_DATE_INSERT_RECORD  TIMESTAMP DEFAULT current_timestamp NOT NULL,
    LOG_DATE_UPDATE_RECORD  TIMESTAMP DEFAULT current_timestamp NOT NULL
);

CREATE TABLE JOB (
    ID_JOB                  INTEGER NOT NULL,
    DESCRIPTION             VARCHAR(30) NOT NULL,
    CD_COMPANY              INTEGER NOT NULL,
    DATE_ADMISSION          DATE default current_date NOT NULL,
    DATE_RESIGNATION        DATE,
    LOG_DATE_INSERT_RECORD  TIMESTAMP default current_timestamp NOT NULL,
    LOG_DATE_UPDATE_RECORD  TIMESTAMP default current_timestamp NOT NULL
);

CREATE TABLE JOB_HISTORIC (
    ID_JOB_HISTORIC         INTEGER NOT NULL,
    CD_PERSON               INTEGER NOT NULL,
    CD_JOB                  INTEGER NOT NULL,
    CD_COMPANY              INTEGER NOT NULL,
    DATE_ADMISSION          DATE NOT NULL,
    DATE_RESIGNATION        DATE DEFAULT CURRENT_DATE NOT NULL,
    LOG_DATE_INSERT_RECORD  TIMESTAMP default current_timestamp NOT NULL,
    LOG_DATE_UPDATE_RECORD  TIMESTAMP default current_timestamp NOT NULL
);

CREATE TABLE PERSON (
    ID_PERSON               INTEGER NOT NULL,
    NAME                    VARCHAR(50) NOT NULL,
    CPF                     CHAR(11) NOT NULL,
    CLASS_ONE               LOGICAL,
    LOG_DATE_INSERT_RECORD  TIMESTAMP default current_timestamp NOT NULL,
    LOG_DATE_UPDATE_RECORD  TIMESTAMP default current_timestamp NOT NULL
);

CREATE TABLE PERSON_EMPLOYEE (
    ID_PERSON_EMPLOYEE      INTEGER NOT NULL,
    CD_PERSON               INTEGER NOT NULL,
    CD_JOB                  INTEGER NOT NULL,
    DATE_ADMISSION          DATE DEFAULT CURRENT_DATE,
    ENROLLMENT              CHAR(10),
    PIS                     CHAR(12),
    LOG_DATE_INSERT_RECORD  TIMESTAMP default current_timestamp NOT NULL,
    LOG_DATE_UPDATE_RECORD  TIMESTAMP default current_timestamp NOT NULL
);

CREATE TABLE RECORD_SHEET (
    ID_RECORD_SHEET         INTEGER NOT NULL,
    CD_PERSON_EMPLOYEE      INTEGER NOT NULL,
    DATE_RECORD             DATE DEFAULT CURRENT_DATE NOT NULL,
    LOG_DATE_INSERT_RECORD  TIMESTAMP default current_timestamp NOT NULL,
    LOG_DATE_UPDATE_RECORD  TIMESTAMP default current_timestamp NOT NULL
);

CREATE TABLE RECORD_SHEET_TIME (
    ID_RECORD_SHEET_TIME    INTEGER NOT NULL,
    CD_RECORD_SHEET         INTEGER NOT NULL,
    TIME_START              TIME DEFAULT current_time NOT NULL,
    TIME_END                TIME,
    LOG_DATE_INSERT_RECORD  TIMESTAMP DEFAULT current_timestamp NOT NULL,
    LOG_DATE_UPDATE_RECORD  TIMESTAMP DEFAULT current_timestamp NOT NULL
);

CREATE TABLE TASK (
    ID_TASK                 INTEGER NOT NULL,
    DESCRIPTION             VARCHAR(255) NOT NULL,
    STATE                   TASK_STATE NOT NULL,
    REMARK                  VARCHAR(500),
    PERIOD                  TASK_PERIOD NOT NULL,
    CONTEXT                 TASK_CONTEXT NOT NULL,
    DATE_REGISTRATION       DATE DEFAULT CURRENT_DATE NOT NULL,
    DATE_TO_DO              DATE,
    DATE_CONCLUDED          DATE,
    LOG_DATE_INSERT_RECORD  TIMESTAMP default current_timestamp NOT NULL,
    LOG_DATE_UPDATE_RECORD  TIMESTAMP default current_timestamp NOT NULL
);



/******************************************************************************/
/***                              Primary keys                              ***/
/******************************************************************************/

ALTER TABLE COMPANY ADD CONSTRAINT PK_COMPANY PRIMARY KEY (ID_COMPANY);
ALTER TABLE JOB ADD CONSTRAINT PK_JOB PRIMARY KEY (ID_JOB);
ALTER TABLE JOB_HISTORIC ADD CONSTRAINT PK_JOB_HISTORIC PRIMARY KEY (ID_JOB_HISTORIC);
ALTER TABLE PERSON ADD CONSTRAINT PK_PERSON PRIMARY KEY (ID_PERSON);
ALTER TABLE PERSON_EMPLOYEE ADD CONSTRAINT PK_PERSON_EMPLOYEE PRIMARY KEY (ID_PERSON_EMPLOYEE);
ALTER TABLE RECORD_SHEET ADD CONSTRAINT PK_RECORD_SHEET PRIMARY KEY (ID_RECORD_SHEET);
ALTER TABLE RECORD_SHEET_TIME ADD CONSTRAINT PK_RECORD_SHEET_TIME PRIMARY KEY (ID_RECORD_SHEET_TIME);
ALTER TABLE TASK ADD CONSTRAINT PK_ID_TASK PRIMARY KEY (ID_TASK);


/******************************************************************************/
/***                              Foreign keys                              ***/
/******************************************************************************/

ALTER TABLE JOB ADD CONSTRAINT FK_JOB_COMPANY FOREIGN KEY (CD_COMPANY) REFERENCES COMPANY (ID_COMPANY);
ALTER TABLE JOB_HISTORIC ADD CONSTRAINT FK_JOB_HISTORIC_JOB FOREIGN KEY (CD_JOB) REFERENCES JOB (ID_JOB);
ALTER TABLE JOB_HISTORIC ADD CONSTRAINT FK_JOB_HISTORIC_PERSON FOREIGN KEY (CD_PERSON) REFERENCES PERSON (ID_PERSON);
ALTER TABLE PERSON_EMPLOYEE ADD CONSTRAINT FK_PERSON_EMPLOYEE_JOB FOREIGN KEY (CD_JOB) REFERENCES JOB (ID_JOB);
ALTER TABLE PERSON_EMPLOYEE ADD CONSTRAINT FK_PERSON_EMPLOYEE_PERSON FOREIGN KEY (CD_PERSON) REFERENCES PERSON (ID_PERSON);
ALTER TABLE RECORD_SHEET ADD CONSTRAINT FK_RECORD_SHEET_PERSON_EMPLOYEE FOREIGN KEY (CD_PERSON_EMPLOYEE) REFERENCES PERSON_EMPLOYEE (ID_PERSON_EMPLOYEE);
ALTER TABLE RECORD_SHEET_TIME ADD CONSTRAINT FK_REC_SHEET_TIME_RECORD_SHEET FOREIGN KEY (CD_RECORD_SHEET) REFERENCES RECORD_SHEET (ID_RECORD_SHEET) ON DELETE CASCADE ON UPDATE CASCADE;


/******************************************************************************/
/***                                Triggers                                ***/
/******************************************************************************/



SET TERM ^ ;



/******************************************************************************/
/***                          Triggers for tables                           ***/
/******************************************************************************/



/* Trigger: TBIU_COMPANY_LOG */
CREATE TRIGGER TBIU_COMPANY_LOG FOR COMPANY
ACTIVE BEFORE INSERT OR UPDATE POSITION 1
as
begin
  if (inserting) then
  begin
    new.LOG_DATE_INSERT_RECORD = current_timestamp;
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
  else
  if (updating) then
  begin
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
end
^

/* Trigger: TBIU_FINANCIAL_ACCOUNT_LOG */
CREATE TRIGGER TBIU_FINANCIAL_ACCOUNT_LOG FOR FINANCIAL_ACCOUNT
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
  BEGIN
    NEW.LOG_DATE_INSERT_RECORD = current_timestamp;
    NEW.LOG_DATE_UPDATE_RECORD = current_timestamp;
  END
  ELSE
  IF (UPDATING) THEN
  BEGIN
    NEW.LOG_DATE_UPDATE_RECORD = current_timestamp;
  END
END
^

/* Trigger: TBIU_JOB_HISTORIC_LOG */
CREATE TRIGGER TBIU_JOB_HISTORIC_LOG FOR JOB_HISTORIC
ACTIVE BEFORE INSERT OR UPDATE POSITION 1
as
begin
  if (inserting) then
  begin
    new.LOG_DATE_INSERT_RECORD = current_timestamp;
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
  else
  if (updating) then
  begin
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
end
^

/* Trigger: TBIU_JOB_LOG */
CREATE TRIGGER TBIU_JOB_LOG FOR JOB
ACTIVE BEFORE INSERT OR UPDATE POSITION 1
as
begin
  if (inserting) then
  begin
    new.LOG_DATE_INSERT_RECORD = current_timestamp;
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
  else
  if (updating) then
  begin
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
end
^

/* Trigger: TBIU_PERSON_EMPLOYEE_LOG */
CREATE TRIGGER TBIU_PERSON_EMPLOYEE_LOG FOR PERSON_EMPLOYEE
ACTIVE BEFORE INSERT OR UPDATE POSITION 1
as
begin
  if (inserting) then
  begin
    new.LOG_DATE_INSERT_RECORD = current_timestamp;
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
  else
  if (updating) then
  begin
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
end
^

/* Trigger: TBIU_PERSON_LOG */
CREATE TRIGGER TBIU_PERSON_LOG FOR PERSON
ACTIVE BEFORE INSERT OR UPDATE POSITION 1
as
begin
  if (inserting) then
  begin
    new.LOG_DATE_INSERT_RECORD = current_timestamp;
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
  else
  if (updating) then
  begin
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
end
^

/* Trigger: TBIU_RECORD_SHEET_LOG */
CREATE TRIGGER TBIU_RECORD_SHEET_LOG FOR RECORD_SHEET
ACTIVE BEFORE INSERT OR UPDATE POSITION 1
as
begin
  if (inserting) then
  begin
    new.LOG_DATE_INSERT_RECORD = current_timestamp;
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
  else
  if (updating) then
  begin
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
end
^

/* Trigger: TBIU_RECORD_SHEET_TIME_LOG */
CREATE TRIGGER TBIU_RECORD_SHEET_TIME_LOG FOR RECORD_SHEET_TIME
ACTIVE BEFORE INSERT OR UPDATE POSITION 1
as
begin
  if (inserting) then
  begin
    new.LOG_DATE_INSERT_RECORD = current_timestamp;
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
  else
  if (updating) then
  begin
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
end
^

/* Trigger: TBIU_TASK_LOG */
CREATE TRIGGER TBIU_TASK_LOG FOR TASK
ACTIVE BEFORE INSERT OR UPDATE POSITION 1
as
begin
  if (inserting) then
  begin
    new.LOG_DATE_INSERT_RECORD = current_timestamp;
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
  else
  if (updating) then
  begin
    new.LOG_DATE_UPDATE_RECORD = current_timestamp;
  end
end
^

/* Trigger: TBI_COMPANY */
CREATE TRIGGER TBI_COMPANY FOR COMPANY
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF(NEW.ID_COMPANY IS NULL) THEN
  BEGIN
    NEW.ID_COMPANY = GEN_ID(GEN_COMPANY, 1);
  END
END
^

/* Trigger: TBI_FINANCIAL_ACCOUNT */
CREATE TRIGGER TBI_FINANCIAL_ACCOUNT FOR FINANCIAL_ACCOUNT
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.ID_FINANCIAL_ACCOUNT IS NULL) THEN
  BEGIN
    NEW.ID_FINANCIAL_ACCOUNT = GEN_ID(GEN_FINANCIAL_ACCOUNT, 1);
  END
END
^

/* Trigger: TBI_JOB */
CREATE TRIGGER TBI_JOB FOR JOB
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF(NEW.ID_JOB IS NULL) THEN
  BEGIN
    NEW.ID_JOB = GEN_ID(GEN_JOB, 1);
  END
END
^

/* Trigger: TBI_JOB_HITORIC */
CREATE TRIGGER TBI_JOB_HITORIC FOR JOB_HISTORIC
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF(NEW.ID_JOB_HISTORIC IS NULL) THEN
  BEGIN
    NEW.ID_JOB_HISTORIC = GEN_ID(GEN_JOB_HISTORIC, 1);
  END
END
^

/* Trigger: TBI_PERSON */
CREATE TRIGGER TBI_PERSON FOR PERSON
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF(NEW.ID_PERSON IS NULL) THEN
  BEGIN
    NEW.ID_PERSON = GEN_ID(GEN_PERSON, 1);
  END
END
^

/* Trigger: TBI_PERSON_EMPLOYEE */
CREATE TRIGGER TBI_PERSON_EMPLOYEE FOR PERSON_EMPLOYEE
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF(NEW.ID_PERSON_EMPLOYEE IS NULL) THEN
  BEGIN
    NEW.ID_PERSON_EMPLOYEE = GEN_ID(GEN_PERSON_EMPLOYEE, 1);
  END
END
^

/* Trigger: TBI_RECORD_SHEET */
CREATE TRIGGER TBI_RECORD_SHEET FOR RECORD_SHEET
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF(NEW.ID_RECORD_SHEET IS NULL) THEN
  BEGIN
    NEW.ID_RECORD_SHEET = GEN_ID(GEN_RECORD_SHEET, 1);
  END
END
^

/* Trigger: TBI_RECORD_SHEET_TIME */
CREATE TRIGGER TBI_RECORD_SHEET_TIME FOR RECORD_SHEET_TIME
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF(NEW.ID_RECORD_SHEET_TIME IS NULL) THEN
  BEGIN
    NEW.ID_RECORD_SHEET_TIME = GEN_ID(GEN_RECORD_SHEET_TIME, 1);
  END
END
^

/* Trigger: TBI_TASK */
CREATE TRIGGER TBI_TASK FOR TASK
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF(NEW.ID_TASK IS NULL) THEN
  BEGIN
    NEW.ID_TASK = GEN_ID(GEN_TASK, 1);
  END
END
^
SET TERM ; ^



/******************************************************************************/
/***                              Descriptions                              ***/
/******************************************************************************/

DESCRIBE DOMAIN FINANCIAL_ACCOUNT_TYPE
'S-EXIT   E-PROHIBITED';

DESCRIBE DOMAIN LOGICAL
'Y-YEA   N-No';

DESCRIBE DOMAIN TASK_CONTEXT
'H-HOUSE   W-WORK   C-COURSE   F-COLLAGE   E-ENTERPRISE';

DESCRIBE DOMAIN TASK_PERIOD
'D-DAY   W-WEEK   M-MONTH   Y-YEAR';

DESCRIBE DOMAIN TASK_STATE
'A-ACTIVE   T-ACCOMPLISHED   C-CANCELED';

DESCRIBE DOMAIN VALUE_FINANCIAL
'USED FOR FINANCIAL DATA';

