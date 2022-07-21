SET SERVEROUTPUT ON;

-- Example 1:
BEGIN
    dbms_output.put_line('Oi Deus');
END;

-- Example 2:
DECLARE
    -- Declaration Section
    l_message VARCHAR2( 255 ) := 'Hello World!';
BEGIN
    -- Execution section
    DBMS_OUTPUT.PUT_LINE( l_message );
END;

-- Example 3:
DECLARE
    -- Declaration Section
    v_result NUMBER;
BEGIN
    -- Execution Section
    v_result := 1 / 0;
    EXCEPTION
    -- Exception Section
      WHEN ZERO_DIVIDE THEN
         DBMS_OUTPUT.PUT_LINE( SQLERRM );
END;