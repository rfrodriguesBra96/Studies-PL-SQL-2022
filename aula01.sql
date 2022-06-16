-- Criação de programas
-- Para executar um programa precisamos associar a um JOB

ALTER SESSION SET CURRENT_SCHEMA=RODRIGO_RODRIGUES

CREATE TABLE AGENDA
(agenda_id    NUMBER,
 agenda_data  DATE);
  
CREATE SEQUENCE AGENDA_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOMAXVALUE
NOCYCLE;

CREATE OR REPLACE PROCEDURE PRC_INSERE_DATA_AGENDA
IS
BEGIN
  INSERT INTO RODRIGO_RODRIGUES.agenda
  VALUES (agenda_seq.NEXTVAL, sysdate);
  COMMIT;
END;

-- Criando e Habilitado um Programa

BEGIN
    DBMS_SCHEDULER.create_program(
        program_name => 'RODRIGO_RODRIGUES.PRC_INSERE_AGENDA', -- nome do programa
        program_action => 'RODRIGO_RODRIGUES.PRC_INSERE_DATA_AGENDA', -- procedure que executa
        program_type => 'STORED_PROCEDURE', -- tipo de programa
        number_of_arguments => 0, -- quantidade de argumentos
        comments => 'Insere dados na agenda', -- documentação
        enabled => TRUE); -- cria como habilitado
/*
    DBMS_SCHEDULER.ENABLE(name=>'HR.PRC_INSERE_AGENDA');    
*/
END;

-- Removendo um Programa

BEGIN
    DBMS_SCHEDULER.drop_program(
        program_name => 'RODRIGO_RODRIGUES.PRC_INSERE_AGENDA',
        force => TRUE);
END;
 
