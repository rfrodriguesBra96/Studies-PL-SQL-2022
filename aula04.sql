-- Cursores com argumentos

SET VERIFY OFF
SET SERVEROUT ON

DECLARE
    CURSOR  employees_cursor
           (pdepartment_id NUMBER, -- Argumento do cursor
            pjob_id VARCHAR2) -- Argumento do cursor
    IS
    SELECT *
    FROM    employees
    WHERE   department_id = pdepartment_id AND  
            job_id = pjob_id;
BEGIN
    FOR employees_record IN employees_cursor(60, 'IT_PROG') -- for loop do cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE(employees_record.first_name || ' - ' ||
                             employees_record.email || ' - ' ||
                             employees_record.salary);
    END LOOP;
END;