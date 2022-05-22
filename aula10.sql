-- Variável Tipo PL/SQL Record
-- Uma estrutura de campos na memória

SET SERVEROUTPUT ON
ALTER SESSION SET CURRENT_SCHEMA=RODRIGO_RODRIGUES

DECLARE
    TYPE region_rec_type IS RECORD
        (region_id regions.region_id%type,
        region_name regions.region_name%type);
    region_record region_rec_type;           -- Variável do tipo region_rec
BEGIN
    SELECT region_id, region_name
    INTO region_record
    FROM regions
    WHERE 2 = regions.region_id;
    DBMS_OUTPUT.PUT_LINE(region_record.region_id || ' - ' ||
                    region_record.region_name);
END;