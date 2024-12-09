/*
Oracle Numeric Data Types Documentation and Examples
*/

CREATE TABLE numeric_datatypes (
    -- Integer Types
    int_col INTEGER,                     -- Whole numbers, equivalent to NUMBER(38)
    pls_integer_var PLS_INTEGER,         -- PL/SQL only, faster than NUMBER for integers
    
    -- Decimal/Number Types  
    decimal_col DECIMAL(10,2),           -- Fixed-point number with 10 digits, 2 decimals
    number_col NUMBER,                   -- Variable-length number up to 38 digits
    number_precise NUMBER(15,4)          -- Number with 15 digits, 4 decimals
);

-- Example data insertion
INSERT INTO numeric_datatypes (
    int_col, 
    decimal_col,
    number_col,
    number_precise
) 
VALUES (
    42,                     -- Integer
    1234.56,               -- Decimal 
    3.14159265359,         -- Number with high precision
    12345.6789             -- Number with specific precision
);

-- PL/SQL Block demonstrating PLS_INTEGER
DECLARE
    v_pls_int PLS_INTEGER := 100;    -- Faster for integer arithmetic
    v_result PLS_INTEGER;
BEGIN
    -- PLS_INTEGER arithmetic is more efficient
    v_result := v_pls_int * 2;
    DBMS_OUTPUT.PUT_LINE('PLS_INTEGER Result: ' || v_result);
END;
/