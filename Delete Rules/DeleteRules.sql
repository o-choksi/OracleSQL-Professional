/*
Oracle Delete Rules Examples - ON DELETE CASCADE, ON DELETE SET NULL, ON DELETE RESTRICT/NO ACTION
*/

-- Create parent table with primary key
CREATE TABLE departments (
    dept_id NUMBER,
    dept_name VARCHAR2(50),
    CONSTRAINT pk_dept PRIMARY KEY (dept_id)
);

-- Create child table with ON DELETE CASCADE
CREATE TABLE employees_cascade (
    emp_id NUMBER,
    emp_name VARCHAR2(100),
    dept_id NUMBER,
    CONSTRAINT pk_emp1 PRIMARY KEY (emp_id),
    CONSTRAINT fk_dept1 FOREIGN KEY (dept_id) 
        REFERENCES departments(dept_id) ON DELETE CASCADE
);

-- Create child table with ON DELETE SET NULL
CREATE TABLE employees_set_null (
    emp_id NUMBER,
    emp_name VARCHAR2(100), 
    dept_id NUMBER,
    CONSTRAINT pk_emp2 PRIMARY KEY (emp_id),
    CONSTRAINT fk_dept2 FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id) ON DELETE SET NULL
);

-- Create child table with ON DELETE RESTRICT (default behavior)
CREATE TABLE employees_restrict (
    emp_id NUMBER,
    emp_name VARCHAR2(100),
    dept_id NUMBER,
    CONSTRAINT pk_emp3 PRIMARY KEY (emp_id),
    CONSTRAINT fk_dept3 FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

-- Insert sample data
INSERT INTO departments VALUES (1, 'Engineering');
INSERT INTO employees_cascade VALUES (1, 'John Smith', 1);
INSERT INTO employees_set_null VALUES (1, 'Jane Doe', 1);
INSERT INTO employees_restrict VALUES (1, 'Bob Wilson', 1);

-- Example of CASCADE: Deleting department will delete related employees
DELETE FROM departments WHERE dept_id = 1;
-- Result: Records deleted from both departments and employees_cascade
-- employees_set_null will have dept_id set to NULL
-- employees_restrict will prevent deletion due to foreign key constraint

-- To demonstrate SET NULL separately:
INSERT INTO departments VALUES (2, 'Marketing');
INSERT INTO employees_set_null VALUES (2, 'Mary Johnson', 2);
DELETE FROM departments WHERE dept_id = 2;
-- Result: department deleted, employee record remains with dept_id = NULL

-- To demonstrate RESTRICT:
INSERT INTO departments VALUES (3, 'Sales');
INSERT INTO employees_restrict VALUES (2, 'Tom Brown', 3);
-- This will fail:
DELETE FROM departments WHERE dept_id = 3;
-- Result: Error ORA-02292: integrity constraint violation - child record found
