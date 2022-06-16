-- Declaração de procedure

ALTER SESSION SET CURRENT_SCHEMA=RODRIGO_RODRIGUES; 

CREATE OR REPLACE PROCEDURE PRC_INSERE_EMPREGADO
    -- Argumentos do tipo IN (entrada)
    (pfirst_name    IN VARCHAR2,
     plast_name     IN VARCHAR2,
     pemail         IN VARCHAR2,
     pphone_number  IN VARCHAR2,
     phire_date     IN DATE DEFAULT SYSDATE, -- Se não for passado um valor, assume a data atual
     pjob_id        IN VARCHAR2,
     pSALARY        IN NUMBER,
     pCOMMICION_PCT IN NUMBER,
     pMANAGER_ID    IN NUMBER,
     pDEPARTMENT_ID IN NUMBER)
IS -- Equivale ao DECLARE
    -- Nenhuma variável declarada entre IS / BEGIN
BEGIN
    INSERT INTO employees (
        employee_id,
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id )
    VALUES (
        employees_seq.nextval,
        pfirst_name,
        plast_name,
        pemail,
        pphone_number,
        phire_date,
        pjob_id,
        psalary,
        pcommicion_pct,
        pmanager_id,
        pdepartment_id );
    -- Programa chamador (procedure) faz o commit
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle ' || SQLCODE || SQLERRM);
END PRC_INSERE_EMPREGADO;

-- Programa chamador
DECLARE
BEGIN
    PRC_INSERE_EMPREGADO('David', 'Bowie','DBOWIE','515.127.4861',SYSDATE,'IT_PROG',15000,NULL,103,60);
    COMMIT;
END;

-- Verifica os dados da tabela
SELECT * FROM employees;