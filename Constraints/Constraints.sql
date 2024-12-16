/*
Oracle Constraint Examples - Unique, Primary Key, and Foreign Key
*/

-- Create parent table with primary key
CREATE TABLE departments (
    dept_id NUMBER,
    dept_name VARCHAR2(50),
    -- Primary Key constraint
    CONSTRAINT pk_dept PRIMARY KEY (dept_id)
);

-- Create table demonstrating constraints
CREATE TABLE employees (
    emp_id NUMBER,
    emp_name VARCHAR2(100),
    email VARCHAR2(100),
    dept_id NUMBER,
    -- Primary Key constraint
    CONSTRAINT pk_emp PRIMARY KEY (emp_id),
    -- Unique constraint
    CONSTRAINT unq_email UNIQUE (email),
    -- Foreign Key constraint
    CONSTRAINT fk_dept FOREIGN KEY (dept_id) 
        REFERENCES departments(dept_id)
);

-- Example data insertion
INSERT INTO departments (dept_id, dept_name) VALUES (1, 'Engineering');

INSERT INTO employees (
    emp_id,
    emp_name, 
    email,
    dept_id
) VALUES (
    1,
    'John Smith',
    'john.smith@company.com',
    1
);

-- PL/SQL Block demonstrating constraint validation
DECLARE
    v_emp_id NUMBER := 1;
BEGIN
    -- Check if employee exists (Primary Key check)
    FOR emp IN (SELECT emp_name FROM employees WHERE emp_id = v_emp_id) LOOP
        DBMS_OUTPUT.PUT_LINE('Found employee: ' || emp.emp_name);
    END LOOP;
END;
/
