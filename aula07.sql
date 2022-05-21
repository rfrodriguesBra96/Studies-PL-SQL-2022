-- Cursos implícito
-- Sempre que você executa um comando SQL,
-- o Oracle cria uma área de memória, na qual o comando é analisado e executado.
-- Que controla o cursor implícito é o Oracle

-- SQL%ROWCOUNT número de linhas afetadas pelo cursor
-- SQL%FOUND retorna TRUE se o cursor uma ou mais linhas
-- SQL%NOTFOUND retorna TRUE se o cursor não afertou uma ou mais linhas
-- SQL%ISOPEN retorna FALSE, fechando o cursor

SET SERVEROUTPUT ON
DECLARE
   vdepartment_id  employees.department_id%type := 60;
   vpercentual     NUMBER(3) := 10;
BEGIN
   UPDATE employees 
   SET salary = salary * (1 + vpercentual / 100)
   WHERE department_id =  vdepartment_id;
   DBMS_OUTPUT.PUT_LINE('Numero de empregados atualizados: ' || SQL%ROWCOUNT);
   DBMS_OUTPUT.PUT_LINE('Teve algum empregado atualizado? ' || SQL%FOUND);
   -- COMMIT;  
END;

ROLLBACK;