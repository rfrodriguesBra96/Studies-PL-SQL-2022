-- Estrutura Bloco An�nimo

-- Seta o buffer para mostrar sa�das
SET SERVEROUTPUT ON

DECLARE
    vNumber1 number(11, 2) := 500;
    vNumber2 number(11, 2) := 400;
    vMedia number(11, 2);
BEGIN
    vMedia := (vNumber1 + vNumber2) / 2;
    DBMS_OUTPUT.PUT_LINE('M�dia = ' ||  vMedia);
END;