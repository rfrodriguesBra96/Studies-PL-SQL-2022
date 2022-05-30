-- Collection PL/SQL
-- Array de uma dimensão

-- Associative Array
    -- Array de uma dimensão de tipos de dados oracle
    -- Sintaxe
        -- TYPE nome_do_tipo
        -- IS TABLE OF nome_tabela.nome_coluna%type /* tipo de dado do oracle ou coluna de uma tabela */
        -- INDEX BY BINARY_INTEGER /* indices inteiros */
        --          VARCHAR2 /* indices strings */

-- Associative Array de Records
    -- Sintaxe
        -- nome_variavel_table(indice).nome_campo := valor
        
-- Declarar variável que implementa o tipo array

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
  -- Array associativo de números de 2 digitos
  TYPE Numero_Table_Type IS TABLE OF NUMBER(2) 
  -- Indices númericos
  INDEX BY BINARY_INTEGER;
  Numero_table  Numero_Table_Type;
BEGIN
  -- Armazena números de 1 a 15 em um Associative Array
  FOR i IN 1..15
  LOOP
    Numero_Table(i) := i*2;
  END LOOP;
 
  FOR i IN 1..15
  LOOP
    DBMS_OUTPUT.PUT_LINE('Associative Array: Indice = ' || TO_CHAR(i) || ', Valor = ' || TO_CHAR(Numero_Table(I)));
  END LOOP;
END;

-- Array associativo do tipo tabela

DECLARE
  TYPE Regions_Table_Type IS TABLE OF rodrigo_rodrigues.regions%rowtype 
  -- Indices númericos
  INDEX BY BINARY_INTEGER;
 Regions_table  Regions_Table_Type;
BEGIN
  -- Armazena números de 1 a 15 em um Associative Array
  
  FOR i IN 1..5
  LOOP
    Regions_table(i).region_id := i;
    Regions_table(i).region_name := 'Brasil';
  END LOOP;
  
   FOR i IN 1..5
  LOOP
    DBMS_OUTPUT.PUT_LINE(Regions_table(i).region_id || ' - ' || Regions_table(i).region_name);
  END LOOP;
END;