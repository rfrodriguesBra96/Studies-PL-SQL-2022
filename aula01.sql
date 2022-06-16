-- Funções
-- Precisam ter um return
-- O programa chamador precisa tratar o retorno

CREATE OR REPLACE FUNCTION FNC_CONSULTA_SALARIO_EMP
   (pemployee_id IN NUMBER) -- Parametro
    RETURN NUMBER -- Tipo do retorno
IS
   vSalary employees.salary%TYPE; -- Variável do tipo salary
BEGIN
   SELECT salary
   INTO vSalary
   FROM employees
   WHERE employee_id = pemployee_id;
   RETURN (vSalary); -- Retorno
END;

-- Programa chamador
SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
   vEmployee_id employees.employee_id%TYPE := 102;
   vSalary employees.salary%TYPE;
BEGIN
    vSalary := FNC_CONSULTA_SALARIO_EMP(vEmployee_id);
    DBMS_OUTPUT.PUT_LINE('Salario: ' || vSalary);
END;

