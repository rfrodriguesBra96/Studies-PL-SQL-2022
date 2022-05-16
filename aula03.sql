-- Escopo de Identificadores ( variáveis, cursores, constante, etc )

SET SERVEROUTPUT ON

DECLARE
    -- var declarada no bloco 1
    vBloco1 VARCHAR(20) := 'Bloco 1';
BEGIN
    DBMS_OUTPUT.PUT_LINE('vBloco1 is = ' || VBloco1);
    DECLARE
        -- var declarada no bloco 1
        vBloco2 VARCHAR(20)  := 'Bloco 2';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('vBloco1 is = ' || VBloco1);
        DBMS_OUTPUT.PUT_LINE('vBloco2 is = ' || VBloco2);
    END; 
    -- Fora do bloco
    -- DBMS_OUTPUT.PUT_LINE('vBloco2 is - ' ||  vBloco2);
END;