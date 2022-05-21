-- Usando o comando UPDATE

ALTER SESSION SET CURRENT_SCHEMA=RODRIGO_RODRIGUES;

SET SERVEROUTPUT ON;

DECLARE

BEGIN
    UPDATE  employees
    SET     first_name = 'Bianca'
    WHERE   employee_id = 129;
    COMMIT;
END;