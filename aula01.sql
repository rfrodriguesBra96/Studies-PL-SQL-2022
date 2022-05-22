--
--
-- Seção 12 - Cursor Explícito
--
-- Aula 1 - Controlando um Cursor Explícito
--

-- Controlando um Cursor Explícito com LOOP Básico

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  CURSOR  employees_cursor  IS
  SELECT  *
  FROM    employees;  -- Declaração do Cursor
  
  employees_record  employees_cursor%rowtype;   -- Variável do tipo employees_cursor que é do tipo tabela employees
BEGIN
  /* Inicializa */
  
  OPEN  employees_cursor;  -- Abrindo o Cursor
  
  -- Obtem result set
  
  /* Loop */
  
  LOOP  -- Loop Básico
    FETCH  employees_cursor  
    INTO  employees_record; -- Fetch do Cursor
    
    EXIT WHEN employees_cursor%notfound;
    
    DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' || 
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
    
  END LOOP;
  
  CLOSE employees_cursor; -- Close do Cursor
END;


-- Exemplo  cursor feito por mim
ALTER SESSION SET CURRENT_SCHEMA=RODRIGO_RODRIGUES
DECLARE
    CURSOR countries_cursor IS          -- Declaração do cursor
    SELECT *
    FROM   countries;
    countries_record countries_cursor%rowtype;         -- Variável record para armazernar a estrutura da tabela
BEGIN
    OPEN countries_cursor;           -- Abrindo cursor
        LOOP            -- Loop básico
            FETCH countries_cursor          -- Fetch
            INTO countries_record;
            EXIT WHEN countries_cursor%notfound;
            DBMS_OUTPUT.PUT_LINE('Country Name = ' || countries_record.country_name);
        END LOOP;
    CLOSE countries_cursor; -- Close do cursor
END;

-- Controlando um Cursor Explícito com WHILE LOOP

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  CURSOR  employees_cursor  IS
  SELECT  *
  FROM    employees; -- Declaração do Cursor
  employees_record  employees_cursor%rowtype; 
BEGIN
  /* Inicializa */
  
  OPEN  employees_cursor; -- Abrindo o Cursor
  
  FETCH  employees_cursor  
    INTO  employees_record; -- Fetch do Cursor
	
  /* Loop */
  
  WHILE  employees_cursor%found  LOOP
     DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' || 
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
    FETCH  employees_cursor  
      INTO  employees_record;
  END LOOP;
  
  CLOSE employees_cursor; -- Close do Cursor
END;
