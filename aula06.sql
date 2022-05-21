-- Controlando Transa��es do Banco de Dados

ALTER SESSION SET CURRENT_SCHEMA=RODRIGO_RODRIGUES;

-- COMMIT
SET SERVEROUTPUT ON
DECLARE
   vEmployee_id    employees.employee_id%type := 150;
BEGIN
   -- UPDATE � um comando DML, necessita de commit
   -- Come�o da transa��o
   UPDATE employees 
   SET    salary = 15000
   WHERE  employee_id =  vEmployee_id;
   -- Final da tansa��o
   COMMIT;  
END;

-- ROLLBACK
SET SERVEROUTPUT ON
DECLARE
   vEmployee_id    employees.employee_id%type := 150;
BEGIN
   -- Comando DML, inicio da transa��o
   UPDATE employees 
   SET    salary = 20000
   WHERE  employee_id =  vEmployee_id;
   -- Final da transa��o
   -- Desfaz o comando UPDATE com ROLLBACK
   ROLLBACK;   
END;

-- SAVEPOINT
BEGIN
    INSERT INTO employees 
    (employee_id, first_name, last_name, email, phone_number, hire_date,
    job_id, salary, commission_pct, manager_id, department_id)
    VALUES 
    (employees_seq.nextval, 'Kobe', 'Bryant', 'KBRYANT', '515.123.45568', SYSDATE,
    'IT_PROG', 15000, 0.4, 103, 60);
    
    -- inicio do savepoint
    SAVEPOINT INSERTOK;
    
    UPDATE employees 
    SET    salary = 30000
    WHERE  job_id = 'IT_PROG';
    
    -- o update ser� descartado
    ROLLBACK TO INSERTOK;
    -- save point n�o encerra a transa��o
    -- � necess�rio decidir se ser� feito um commit ou rollback
    
    COMMIT;
END;


