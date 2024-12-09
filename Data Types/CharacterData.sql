/*
Oracle Character Data Types Documentation and Examples
*/

CREATE TABLE character_datatypes_demo (
    -- Fixed-Length Character Types
    char_col CHAR(10),                   -- Fixed-length character string, padded with spaces
    
    -- Variable-Length Character Types
    varchar_col VARCHAR(100),            -- Variable-length character string (deprecated)
    varchar2_col VARCHAR2(200)           -- Variable-length character string, recommended type
);

-- Example data insertion
INSERT INTO character_datatypes_demo (
    char_col,
    varchar_col,
    varchar2_col
) 
VALUES (
    'Hello',               -- Will be padded with spaces to 10 characters
    'Variable text',       -- Only uses space needed
    'Flexible string'      -- Most efficient variable-length storage
);

-- PL/SQL Block demonstrating character type handling
DECLARE
    v_char CHAR(10) := 'Test';          -- Fixed 10 characters with space padding
    v_varchar VARCHAR(20) := 'Hello';    -- Variable length up to 20 characters
    v_varchar2 VARCHAR2(30) := 'World';  -- Preferred variable length type
BEGIN
    -- Demonstrate space padding in CHAR
    DBMS_OUTPUT.PUT_LINE('CHAR Length: ' || LENGTH(v_char));
    DBMS_OUTPUT.PUT_LINE('VARCHAR Length: ' || LENGTH(v_varchar));
    DBMS_OUTPUT.PUT_LINE('VARCHAR2 Length: ' || LENGTH(v_varchar2));
END;
/
