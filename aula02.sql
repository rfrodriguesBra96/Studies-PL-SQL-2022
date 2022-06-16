-- Utilizando argumentos do tipo IN
-- Podemos definir um valor default
-- O tipo IN é o tipo default, se não for especificado um tipo o IN é assumido

ALTER SESSION SET CURRENT_SCHEMA=RODRIGO_RODRIGUES

CREATE OR REPLACE PROCEDURE PRC_AUMENTA_SALARIO_EMPREGADO
   (pemployee_id   IN NUMBER,   -- id do empregado
    ppercentual    IN NUMBER)   -- percentual de aumento
IS
   -- Nenhuma váriável declarada
BEGIN
  UPDATE employees 
  SET salary = salary * (1 + ppercentual / 100)
  WHERE employee_id = pemployee_id;

EXCEPTION
  WHEN OTHERS 
  THEN
     RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
END;

-- Executando a Procedure pelo Bloco PL/SQL

SELECT * FROM employees WHERE employee_id = 109;

BEGIN
  PRC_AUMENTA_SALARIO_EMPREGADO(109,15);
  COMMIT; -- Commit no programa chamador
END;
