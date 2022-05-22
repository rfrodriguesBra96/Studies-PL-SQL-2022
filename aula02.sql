-- Declarando variável RECORD com %rowtype

SET SERVEROUTPUT ON
ALTER SESSION SET CURRENT_SCHEMA=RODRIGO_RODRIGUES

DECLARE
    region_record regions%rowtype;           -- Variável do tipo region_rec
BEGIN
    SELECT region_id, region_name
    INTO region_record
    FROM regions
    WHERE 2 = regions.region_id;
    DBMS_OUTPUT.PUT_LINE(region_record.region_id || ' - ' ||
                    region_record.region_name);
END;
