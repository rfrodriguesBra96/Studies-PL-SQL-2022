-- Usando cursor FOR LOOP
-- O OPEN e FETCH do CURSOR s�o impl�citos
-- N�o precisamos controlar not%found � feito no END LOOP

ALTER SESSION SET CURRENT_SCHEMA=RODRIGO_RODRIGUES

DECLARE
    CURSOR countries_cursor IS
    SELECT *
    FROM countries;
BEGIN
    -- vari�vel countries_record tem o mesmo tipo do countries_cursor
    FOR countries_record IN countries_cursor
    LOOP -- OPEN E FETCH IMPLICITOS
        DBMS_OUTPUT.PUT_LINE(countries_record.country_name);
    END LOOP; -- CLOSE IMPLICITO
END;