-- Declarando vari�vel RECORD com %rowtype

SET SERVEROUTPUT ON
ALTER SESSION SET CURRENT_SCHEMA=RODRIGO_RODRIGUES

DECLARE
    region_record regions%rowtype;           -- Vari�vel do tipo region_rec
BEGIN
    SELECT region_id, region_name
    INTO region_record
    FROM regions
    WHERE 2 = regions.region_id;
    DBMS_OUTPUT.PUT_LINE(region_record.region_id || ' - ' ||
                    region_record.region_name);
END;
