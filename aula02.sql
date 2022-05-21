-- Comando SELECT: deve retornar somente uma e somente uma linha
-- Se retornar mais de uma linha gera a exceção chamada TOO_MANY_ROWS
-- Se não retornar nenhuma linha gera a exceção chamada NO_DATA_FOUND
-- Para retornar mais de uma linha usaremos cursores..

ALTER SESSION SET CURRENT_SCHEMA=RODRIGO_RODRIGUES;

SET SERVEROUTPUT ON;

DECLARE
    -- Variaveis para armazenar o retorno da query
    -- Devem ter o mesmo tipo das colunas da tabela
    -- Para isso usamos %type
    vFirst_name employees.first_name%type;
    vLast_name employees.last_name%type;
    vSalary employees.salary%type;
    vEmployee_id employees.employee_id%type := 121;
BEGIN
    SELECT first_name, last_name, salary -- Colunas selecionadas
    INTO vFirst_name, vLast_name, vSalary -- São armazendas dentro dessas variáveis
    FROM employees
    -- Como alterou o schemma
    -- Acessa employee_id from rodrigo_rodrigues.employees
    WHERE employee_id = vEmployee_id;
    DBMS_OUTPUT.PUT_LINE('vFirst_name IS ' || vFirst_name);
    DBMS_OUTPUT.PUT_LINE('vLast_name IS ' || vLast_name);
    DBMS_OUTPUT.PUT_LINE('vSalary IS ' || vSalary);
END;

-- Exceção NO_DATA_FOUND

DECLARE
    -- Variaveis para armazenar o retorno da query
    -- Devem ter o mesmo tipo das colunas da tabela
    -- Para isso usamos %type
    vFirst_name employees.first_name%type;
    vLast_name employees.last_name%type;
    vSalary employees.salary%type;
    vEmployee_id employees.employee_id%type := 50; -- procura por um empregado que não existe
BEGIN
    SELECT first_name, last_name, salary -- Colunas selecionadas
    INTO vFirst_name, vLast_name, vSalary -- São armazendas dentro dessas variáveis
    FROM employees
    -- Como alterou o schemma
    -- Acessa employee_id from rodrigo_rodrigues.employees
    WHERE employee_id = vEmployee_id;
    DBMS_OUTPUT.PUT_LINE('vFirst_name IS ' || vFirst_name);
    DBMS_OUTPUT.PUT_LINE('vLast_name IS ' || vLast_name);
    DBMS_OUTPUT.PUT_LINE('vSalary IS ' || vSalary);
END;

-- Select usando ROUND e AVG

DECLARE
   vJob_id          employees.job_id%type := 'AD_VP';
   vAvg_Salary      employees.salary%type;
   vSum_Salary      employees.salary%type;
BEGIN
    -- Soma os salarios dos employees com id = AD_VP
    -- Calcula a media dos employees  com id = AD_VP
    -- ROUND e AVG garantem que seja retornado apenas uma linha
   SELECT ROUND(AVG(salary),2), ROUND(SUM(salary),2)
   INTO   vAvg_Salary, vSum_Salary 
   FROM   employees
   WHERE  job_id = vJob_id;
   DBMS_OUTPUT.PUT_LINE('Cargo: ' || vJob_id);
   DBMS_OUTPUT.PUT_LINE('Média de salários: ' || vAvg_Salary);
   DBMS_OUTPUT.PUT_LINE('Somatório de salarios: ' || vSum_Salary);
END;

-- Erro TOO_MANY_ROWS

DECLARE
   vJob_id          employees.job_id%type;
   vAvg_Salary      employees.salary%type;
   vSum_Salary      employees.salary%type;
BEGIN
   SELECT job_id, ROUND(AVG(salary),2), ROUND(SUM(salary),2)
   INTO   vJob_id, vAvg_Salary, vSum_Salary 
   FROM   employees
   GROUP BY job_id;
   DBMS_OUTPUT.PUT_LINE('Cargo: ' || vJob_id);
   DBMS_OUTPUT.PUT_LINE('Média de salários: ' || vAvg_Salary);
   DBMS_OUTPUT.PUT_LINE('Somatório de salarios: ' || vSum_Salary);
END;
