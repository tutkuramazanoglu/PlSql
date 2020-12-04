Create or replace FUNCTION get_job (f_job_id  VARCHAR)
return varchar
is 
f_job_title varchar(25);
begin 
select job_title into f_job_title  from jobs where job_id=f_job_id;
return f_job_title;
end;

Set SERVEROUTPUT ON 
DECLARE
v_job_title VARCHAR(25);
v_job_id VARCHAR(25);

begin
v_job_id:='&jobID';
v_job_title:=get_job(v_job_id);
dbms_output.put_line(' The job title is ' || v_job_id); 
dbms_output.put_line(' The job title is ' || v_job_title); 
end;

CREATE OR REPLACE FUNCTION avg_sal(f_department_id number)
return number is 
f_avg_salary number;
begin
select avg(salary) into f_avg_salary from employees where department_id=f_department_id;
return f_avg_salary;
end;

set SERVEROUTPUT ON
DECLARE
v_department_id number;
v_avg_salary number;
begin
v_department_id:='&departmentID';
v_avg_salary:=avg_sal(v_department_id);
dbms_output.put_line(' The department id is ' || v_department_id); 
dbms_output.put_line(' The avarage salary is  ' || v_avg_salary);
end;


