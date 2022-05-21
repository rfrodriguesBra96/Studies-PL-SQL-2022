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
END;