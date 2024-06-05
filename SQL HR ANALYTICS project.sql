show databases;
create database HR;
use HR;
drop database hr;
select * from  hrdata limit 15;
                                /*KPI 1*/
select department,(avg(case when attrition = 'Yes' then 1 else 0 end)*100) as 'avg_attrition'
 from hrdata group by department order by avg_attrition desc;
                                  /*KPI 2*/
select avg(Hourly_Rate) as 'hrly_rate' from hrdata where gender = 'male' and job_role = 'Research Scientist';
                                 /*KPI 4*/
select department,avg(Years_At_Company) as 'Avg_working_yrs' from hrdata group by department order by Avg_working_yrs desc;
                                 /*KPI 5*/
select department,count(emp_no) as 'count_of_emp' from hrdata group by department order by count_of_emp desc;
                                  /*KPI 6*/
select Education_Field,count(emp_no) as 'count_of_emp' from hrdata group by Education_Field order by count_of_emp desc;
                                            /*KPI 9*/
select gender,count(*) as 'total_no',round((count(*)/(select count(*) from hrdata))*100,2) as 'percentage' from hrdata group by gender;
										   /*KPI 11*/
select department,job_role,avg(Job_Satisfaction) as 'satisfaction_rating',
case
    when avg(Job_Satisfaction) < 2 then 'poor'
    when avg(Job_Satisfaction) >=2.4 and avg(Job_Satisfaction) <=2.69 then 'Fair'
    when avg(Job_Satisfaction) >2.69 then 'excellent'
end as 'category'
from hrdata group by department,job_role;

                     /* rough work as  column names not in order as per given file*/
desc Hrdata;
alter table hrdatanew rename column ï»¿Attrition to Attrition;
desc hr_new;