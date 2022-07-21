-- Tipos de dados escalares
-- Dados escalares podem ter subtipos
-- Um subtipo restringe o valor ou  tamanho do tipo de dados base

set serveroutput on;

declare
    v_simple simple_integer := 25;
    v_natural natural := 26; -- Only positive
begin
    dbms_output.put_line(v_number);
    dbms_output.put_line(v_natural);
end;