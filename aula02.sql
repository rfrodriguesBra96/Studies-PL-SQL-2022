-- Associative array of record
-- Bulk collections

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  -- Associative array of record (employees)
  TYPE employees_table_type IS TABLE OF employees%rowtype
  INDEX BY BINARY_INTEGER;  -- Type Associative Array
  employees_table  employees_table_type;
BEGIN
  SELECT *
    -- Coloca todas as linhas da tabela employees em employees_table
    -- Cada indice de employees_table armazena uma linha da tabela (como se fosse um objeto)
    BULK COLLECT INTO employees_table 
  FROM employees;
  -- Usa métodos da collectoin bulk para pegar do primeiro ao ultimo elemento
  FOR i IN employees_table.first..employees_table.last  
  LOOP
    DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' || 
                         employees_table(i).first_name || ' - ' || 
                         employees_table(i).last_name || ' - ' ||
                         employees_table(i).phone_number || ' - ' ||
                         employees_table(i).job_id || ' - ' ||
                         TO_CHAR(employees_table(i).salary,'99G999G999D99'));   
  END LOOP;
END;
