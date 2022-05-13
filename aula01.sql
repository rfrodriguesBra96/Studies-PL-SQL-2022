-- Estrutura Bloco Anônimo

-- Seta o buffer para mostrar saídas
SET SERVEROUTPUT ON

DECLARE
    vNumber1 number(11, 2) := 500;
    vNumber2 number(11, 2) := 400;
    vMedia number(11, 2);
BEGIN
    vMedia := (vNumber1 + vNumber2) / 2;
    DBMS_OUTPUT.PUT_LINE('Média = ' ||  vMedia);
END;