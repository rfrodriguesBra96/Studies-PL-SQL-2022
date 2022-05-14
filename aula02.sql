-- Constantes
-- Não pode ser alterado uma vez inicializado

SET SERVEROUTPUT ON

DECLARE
    vAge  CONSTANT NUMBER(2,0) := 26;
BEGIN
    -- vAge := 27;
    DBMS_OUTPUT.PUT_LINE('vAge = ' || vAge);
END;