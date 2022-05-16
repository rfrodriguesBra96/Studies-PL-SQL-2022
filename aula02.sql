-- funções SQL de conversão podem ser utilizadas em expressões PL/SQL (to_char, to_number, ..)

-- Não podemos utilizar as seguintes funções em expressões PL/SQL: AVG, MIN, MAX, COUNT SUM, STDDEV, VARIANCE, ..

SET SERVEROUTPUT ON

DECLARE
  vNumero1  NUMBER(13,2);  -- Declaração de variável para o Primeiro número
  vNumero2  NUMBER(13,2);  -- Declaração de variável para o Segundo número
  vMedia    NUMBER(13,2);  -- Declaração de variável para a Média
BEGIN
  vNumero1  :=  5000.8888;
  vNumero2  :=  3000.4444;
  vMedia    :=  ROUND((vNumero1 + vNumero2) / 2, 2); -- Arredonda para duas casas decimais
  DBMS_OUTPUT.PUT_LINE('vnumero1 = ' || vnumero1);  -- Impressão do Primeiro Número
  DBMS_OUTPUT.PUT_LINE('vnumero2 = ' || vnumero2);  -- Impressão do Segundo Número
  DBMS_OUTPUT.PUT_LINE('Media = ' || TO_CHAR(vMedia,'99G999G999D99'));     -- Impressão da Média calculada 
END;