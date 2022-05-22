--
-- Seção 9 - Estruturas de Controle 
--
-- Aula 1 - Operadores PL/SQL
--

-- Operadores PL/SQL - Com erro no cálculo devido ao mal uso da regra de precedência
ALTER SESSION SET CURRENT_SCHEMA=RODRIGO_RODRIGUES

-- Corrigindo o cálculo da média sobrepondo a regra de precedência utilizando parenteses

SET SERVEROUTPUT ON
DECLARE
   vNota1     NUMBER(11,2) := 7.0;
   vNota2     NUMBER(11,2) := 6.0;
   vNota3     NUMBER(11,2) := 9.0;
   vNota4     NUMBER(11,2) := 6.0;
   vMedia     NUMBER(11,2);
BEGIN
  vMedia := (vNota1 + vNota2 + vNota3 + vNota4) / 4;
  DBMS_OUTPUT.PUT_LINE('Media = ' || vMedia);   
END;

-- Operador LIKE ( Usado para fazer filtro no back-end)

-- pattern%, todos os registros que comecam o padrão seguido de qq coisa
select * from jobs where job_title LIKE 'S%'; -- Sales, Stock, ..
select * from jobs where job_title LIKE 'Sa%'; -- Sales, ..

-- %pattern%, todos os registros que começam com qq coisa seguido do pattern, terminando com qq coisa
select * from jobs where job_title LIKE '%le%';

-- Combinando pattern % com _(qualquer caractere)
select * from jobs where job_title LIKE 'S_%'; -- Sales, Stock, ..

-- %pattern, todos os registros que começam com qq coisa e terminam exatamente com o pattern
select * from jobs where job_title LIKE '%Manager';

-- Operador IN, seleciona os registros em que o salario é 4000, 6000 ou 8000
select * from jobs where min_salary IN (4000, 6000, 8000);

-- Operador BETWEEN filtrar um intervalo de registros (datas, ..)
select * from employees where hire_date between '07/12/02' and '21/04/08';