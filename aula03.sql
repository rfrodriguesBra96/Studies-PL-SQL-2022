-- Datatypes
-- Escalar: armazena um único valor, são eles: númerico, caractare, booleano e data
-- NUMBER(p,d), p é a precisão, d é o número de decimais
-- NOT NULL: variável precisa ser inicializada
-- LONG: armazena string de chars
-- LONG RAW: armazena dados binários (arquivos, fotos, etc).
-- DATE: armazenar datas

-- NCHAR e NVARCHAR, possuem o mesmo comportamento de CHAR E VARCHAR, mas aceitam caracteres universais.
-- Qualquer idioma diferente do configuração como padrão, usado em CHAR e VARCHAR

-- BINARY_INTEGER: adicionar númericos sem decimais (mais eficiente que NUMBER para armazenar inteiros),
-- ocupa menos espaço em disco.

-- Declarar variáveis usando %TYPE
-- vFirst_name = employees.first_name%TYPE, possui o tipo e tamanho de first_name

SET SERVEROUTPUT ON

DECLARE
    vNumber1 NUMBER(11,2) := 26.5; -- 11 digitos, 9 inteiros e 2 decimais
    vNumber2 NUMBER(24) := 2022; -- 24 digitos inteiros
    vChar CHAR(2) NOT NULL := 'RS';  -- Tamanho fixo sempre gasta 2
    vCharVariavel VARCHAR(40) NOT NULL := 'Pelotas'; -- Gasta o que for necessário, tamanho da palavra Pelotas
    vDataAtual DATE := SYSDATE; -- SYSDATE retorna a data atual
    vDataInplicita DATE := '16/05/2022'; -- Converte para o tipo Date
    vDataTimeStamp1  TIMESTAMP := SYSTIMESTAMP; -- Retorna a data e a hora com precisão nos segundos
    vDataTimeStamp2  TIMESTAMP(0) := SYSTIMESTAMP; -- Retorna a data e a hora com precisão nos segundos com precisão 0 para segs
    vDataTimeStampZone TIMESTAMP WITH TIME ZONE := SYSTIMESTAMP; -- UTC da configuração do BDA
    vDataTimeStampLocalZone TIMESTAMP WITH LOCAL TIME ZONE := SYSTIMESTAMP; -- UTC da estação de trabalho
    -- Podemos acessar um BDA configurado em Londres numa estação em Pelotas.
    vBinaryIntenger BINARY_INTEGER := 26;
BEGIN
    DBMS_OUTPUT.PUT_LINE('vNumber1 is = ' || vNumber1);
    DBMS_OUTPUT.PUT_LINE('vNumber2 is = ' || vNumber2);
    DBMS_OUTPUT.PUT_LINE('vChar is = ' || vChar);
    DBMS_OUTPUT.PUT_LINE('vCharVariavel is = ' || vCharVariavel);
    DBMS_OUTPUT.PUT_LINE('vDataAtual is = ' || vDataAtual);
    DBMS_OUTPUT.PUT_LINE('vDataInplicita is = ' || vDataInplicita);
    DBMS_OUTPUT.PUT_LINE('vDataTimeStam1 is = ' || vDataTimeStamp1);
    DBMS_OUTPUT.PUT_LINE('vDataTimeStam2 is = ' || vDataTimeStamp2);
    DBMS_OUTPUT.PUT_LINE('vDataTimeStampZone is = ' || vDataTimeStampZone);
    DBMS_OUTPUT.PUT_LINE('vDataTimeStampLocalZone is = ' || vDataTimeStampLocalZone);
    DBMS_OUTPUT.PUT_LINE('vBinaryIntenger is = ' || vBinaryIntenger);
END;