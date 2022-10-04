SET SERVEROUTPUT ON
DECLARE
   --custom data type
   TYPE emp_table_type is table of
      emp%ROWTYPE INDEX BY BINARY_INTEGER;
   v_emp_table  emp_table_type;
   v_count       NUMBER(3) := 18; 
BEGIN
  
  FOR i IN 10..v_count
  LOOP
	  SELECT * INTO v_emp_table(i) FROM emp
	  WHERE empno = i;
  END LOOP;
  FOR i IN v_emp_table.FIRST..v_emp_table.LAST 
  LOOP
     DBMS_OUTPUT.PUT_LINE(v_emp_table(i).empno || v_emp_table(i).empname || v_emp_table(i).salary || v_emp_table(i).deptno);
  END LOOP;
END; 
/
