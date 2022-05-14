-- Identificadores e Variáveis

-- Quoted identifiers "vNumero" := 1 (entre "")

-- Literal String vTexto := 'Um texto'

-- Literal String de Datas vData := 'DD/MM/AA'
--                                  '17/03/96'
--                                  '17/03/1996'
-- O tipo é convertido para Data implicitamente

-- Literal númerico 500, 2.0d (double), 2.0f (float)

-- Literal booleano, TRUE, FALSE, NULL

SET SERVEROUTPUT ON

DECLARE
    vNumero NUMBER(11,2) := 1000.50;
    vCharFixo CHAR(2) := 'RS';
    vCharVariavel VARCHAR(100) := 'Dentista';
    vData1 DATE := '14/05/2022';
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('vNumero = ' || vNumero);
    DBMS_OUTPUT.PUT_LINE('vCharFixo = ' || vCharFixo);
    DBMS_OUTPUT.PUT_LINE('vCharVariavel = ' || vCharVariavel);
    DBMS_OUTPUT.PUT_LINE('vData = ' || vData1);
END;