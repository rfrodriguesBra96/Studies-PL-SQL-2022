-- fun��es SQL de convers�o podem ser utilizadas em express�es PL/SQL (to_char, to_number, ..)

-- N�o podemos utilizar as seguintes fun��es em express�es PL/SQL: AVG, MIN, MAX, COUNT SUM, STDDEV, VARIANCE, ..

SET SERVEROUTPUT ON

DECLARE
  vNumero1  NUMBER(13,2);  -- Declara��o de vari�vel para o Primeiro n�mero
  vNumero2  NUMBER(13,2);  -- Declara��o de vari�vel para o Segundo n�mero
  vMedia    NUMBER(13,2);  -- Declara��o de vari�vel para a M�dia
BEGIN
  vNumero1  :=  5000.8888;
  vNumero2  :=  3000.4444;
  vMedia    :=  ROUND((vNumero1 + vNumero2) / 2, 2); -- Arredonda para duas casas decimais
  DBMS_OUTPUT.PUT_LINE('vnumero1 = ' || vnumero1);  -- Impress�o do Primeiro N�mero
  DBMS_OUTPUT.PUT_LINE('vnumero2 = ' || vnumero2);  -- Impress�o do Segundo N�mero
  DBMS_OUTPUT.PUT_LINE('Media = ' || TO_CHAR(vMedia,'99G999G999D99'));     -- Impress�o da M�dia calculada 
END;