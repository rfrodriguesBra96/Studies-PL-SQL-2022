-- Usando cursor FOR LOOP
-- O OPEN e FETCH do CURSOR são implícitos
-- Não precisamos controlar not%found é feito no END LOOP

ALTER SESSION SET CURRENT_SCHEMA=RODRIGO_RODRIGUES

DECLARE
    CURSOR countries_cursor IS
    SELECT *
    FROM countries;
BEGIN
    -- variável countries_record tem o mesmo tipo do countries_cursor
    FOR countries_record IN countries_cursor
    LOOP -- OPEN E FETCH IMPLICITOS
        DBMS_OUTPUT.PUT_LINE(countries_record.country_name);
    END LOOP; -- CLOSE IMPLICITO
END;