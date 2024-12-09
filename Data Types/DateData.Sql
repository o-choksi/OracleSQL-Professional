/*
Oracle Date Data Type Documentation and Examples
*/

CREATE TABLE date_datatypes (
    -- Date Type
    date_col DATE                        -- Stores date and time values from 4712 BC to 9999 AD
);

-- Example data insertion
INSERT INTO date_datatypes (
    date_col
) 
VALUES (
    SYSDATE                -- Current system date and time
);

-- PL/SQL Block demonstrating date type handling
DECLARE
    v_date DATE := SYSDATE;          -- Current date and time
BEGIN
    -- Demonstrate date operations
    DBMS_OUTPUT.PUT_LINE('Current Date: ' || TO_CHAR(v_date, 'DD-MON-YYYY HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('Tomorrow: ' || TO_CHAR(v_date + 1, 'DD-MON-YYYY HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('Last Week: ' || TO_CHAR(v_date - 7, 'DD-MON-YYYY HH24:MI:SS'));
END;
/