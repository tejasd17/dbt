/*1. Display manager ID and number of employees managed by the manager. */
select MANAGER_ID , count(EMPLOYEE_ID)
from employees
group by manager_ID;
+------------+--------------------+
| MANAGER_ID | count(EMPLOYEE_ID) |
+------------+--------------------+
|       NULL |                  1 |
|        100 |                 14 |
|        101 |                  5 |
|        102 |                  1 |
|        103 |                  4 |
|        108 |                  5 |
|        114 |                  5 |
|        120 |                  8 |
|        121 |                  8 |
|        122 |                  8 |
|        123 |                  8 |
|        124 |                  8 |
|        145 |                  6 |
|        146 |                  6 |
|        147 |                  6 |
|        148 |                  6 |
|        149 |                  6 |
|        201 |                  1 |
|        205 |                  1 |
+------------+--------------------+

/*2. Display the country ID and number of cities we have in the country. */
select COUNTRY_ID,count(city)
from locations
group by COUNTRY_ID;
+------------+-------------+
| COUNTRY_ID | count(city) |
+------------+-------------+
| AU         |           1 |
| BR         |           1 |
| CA         |           2 |
| CH         |           2 |
| CN         |           1 |
| DE         |           1 |
| GB         |           3 |
| IN         |           1 |
| IT         |           2 |
| JP         |           2 |
| MX         |           1 |
| NL         |           1 |
| SG         |           1 |
| US         |           4 |
+------------+-------------+

/* 3. Display average salary of employees in each department who have 
commission percentage. */
select department_id , avg(salary)
from employees
group by department_id;
+---------------+--------------+
| department_id | avg(salary)  |
+---------------+--------------+
|          NULL |  7000.000000 |
|            10 |  4400.000000 |
|            20 |  9500.000000 |
|            30 |  4150.000000 |
|            40 |  6500.000000 |
|            50 |  3475.555556 |
|            60 |  5760.000000 |
|            70 | 10000.000000 |
|            80 |  8955.882353 |
|            90 | 19333.333333 |
|           100 |  8601.333333 |
|           110 | 10154.000000 |
+---------------+--------------+

/* 4. Display job ID, number of employees, sum of salary, and difference 
between highest salary and lowest salary of the employees for each job. */
    select JOB_ID,count(EMPLOYEE_ID),sum(salary),max(salary)-min(salary) as diff
    from employees
    group by JOB_ID;
    +------------+--------------------+-------------+---------+
| JOB_ID     | count(EMPLOYEE_ID) | sum(salary) | diff    |
+------------+--------------------+-------------+---------+
| AC_ACCOUNT |                  1 |     8300.00 |    0.00 |
| AC_MGR     |                  1 |    12008.00 |    0.00 |
| AD_ASST    |                  1 |     4400.00 |    0.00 |
| AD_PRES    |                  1 |    24000.00 |    0.00 |
| AD_VP      |                  2 |    34000.00 |    0.00 |
| FI_ACCOUNT |                  5 |    39600.00 | 2100.00 |
| FI_MGR     |                  1 |    12008.00 |    0.00 |
| HR_REP     |                  1 |     6500.00 |    0.00 |
| IT_PROG    |                  5 |    28800.00 | 4800.00 |
| MK_MAN     |                  1 |    13000.00 |    0.00 |
| MK_REP     |                  1 |     6000.00 |    0.00 |
| PR_REP     |                  1 |    10000.00 |    0.00 |
| PU_CLERK   |                  5 |    13900.00 |  600.00 |
| PU_MAN     |                  1 |    11000.00 |    0.00 |
| SA_MAN     |                  5 |    61000.00 | 3500.00 |
| SA_REP     |                 30 |   250500.00 | 5400.00 |
| SH_CLERK   |                 20 |    64300.00 | 1700.00 |
| ST_CLERK   |                 20 |    55700.00 | 1500.00 |
| ST_MAN     |                  5 |    36400.00 | 2400.00 |
+------------+--------------------+-------------+---------+

/* 5. Display job ID for jobs with average salary more than 10000.*/
select JOB_ID ,avg(salary)
from employees
group by JOB_ID
having avg(salary)>10000;
+---------+--------------+
| JOB_ID  | avg(salary)  |
+---------+--------------+
| AC_MGR  | 12008.000000 |
| AD_PRES | 24000.000000 |
| AD_VP   | 17000.000000 |
| FI_MGR  | 12008.000000 |
| MK_MAN  | 13000.000000 |
| PU_MAN  | 11000.000000 |
| SA_MAN  | 12200.000000 |
+---------+--------------+

/* 6. Display the years in which more than 10 employees joined.*/
select year(hire_date) AS HIRE_DATE,count(employee_id) AS EMP_ID
from employees
GROUP BY year(hire_date)
HAVING count(employee_id) > 10;
+-----------+--------+
| HIRE_DATE | EMP_ID |
+-----------+--------+
|      2015 |     29 |
|      2016 |     24 |
|      2017 |     19 |
|      2018 |     11 |
+-----------+--------+


/* 7. Display departments in which more than five employees have 
commission percentage.*/
SELECT DEPARTMENT_ID,COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
WHERE COMMISSION_PCT > 0.05
GROUP BY DEPARTMENT_ID;
+---------------+--------------------+
| department_id | count(employee_id) |
+---------------+--------------------+
|            80 |                 34 |
+---------------+--------------------+

/* 8. Display employee ID for the employees who did more than one job in the 
past.*/
select EMPLOYEE_ID ,count(job_id)
from job_history
group by employee_id
having count(job_id)>1;
+-------------+---------------+
| EMPLOYEE_ID | count(job_id) |
+-------------+---------------+
|         101 |             2 |
|         176 |             2 |
|         200 |             2 |
+-------------+---------------\

/* 9. Display job ID of jobs that were done by 2 or more employees for more 
than 100 days individually. */
SELECT job_id , count(DISTINCT employee_id)
FROM job_history
WHERE TIMESTAMPDIFF(DAY, start_date, end_date) > 100
GROUP BY job_id
HAVING COUNT(DISTINCT employee_id) >= 2;
+------------+-----------------------------+
| job_id     | count(DISTINCT employee_id) |
+------------+-----------------------------+
| AC_ACCOUNT |                           2 |
| ST_CLERK   |                           2 |
+------------+-----------------------------+


/* 10. Display the department ID, year of hiring, and the number of employees 
who joined each department in each year. */

SELECT DEPARTMENT_ID,YEAR(HIRE_DATE) ,COUNT(EMPLOYEE_ID)
FROM employees
GROUP BY DEPARTMENT_ID,YEAR(HIRE_DATE)
ORDER BY DEPARTMENT_ID,YEAR(HIRE_DATE);
+---------------+-----------------+--------------------+
| department_id | YEAR(hire_date) | count(employee_id) |
+---------------+-----------------+--------------------+
|          NULL |            2017 |                  1 |
|            10 |            2013 |                  1 |
|            20 |            2014 |                  1 |
|            20 |            2015 |                  1 |
|            30 |            2012 |                  1 |
|            30 |            2013 |                  1 |
|            30 |            2015 |                  2 |
|            30 |            2016 |                  1 |
|            30 |            2017 |                  1 |
|            40 |            2012 |                  1 |
|            50 |            2013 |                  3 |
|            50 |            2014 |                  4 |
|            50 |            2015 |                 12 |
|            50 |            2016 |                 13 |
|            50 |            2017 |                  9 |
|            50 |            2018 |                  4 |
|            60 |            2015 |                  1 |
|            60 |            2016 |                  2 |
|            60 |            2017 |                  2 |
|            70 |            2012 |                  1 |
|            80 |            2014 |                  5 |
|            80 |            2015 |                 10 |
|            80 |            2016 |                  7 |
|            80 |            2017 |                  5 |
|            80 |            2018 |                  7 |
|            90 |            2011 |                  1 |
|            90 |            2013 |                  1 |
|            90 |            2015 |                  1 |
|           100 |            2012 |                  2 |
|           100 |            2015 |                  2 |
|           100 |            2016 |                  1 |
|           100 |            2017 |                  1 |
|           110 |            2012 |                  2 |
+---------------+-----------------+--------------------+

/* 11. Display the count of employees joined in each month of the year 2017.*/
SELECT MONTH(HIRE_DATE) AS MONTH, COUNT(EMPLOYEE_ID) AS EMP_COUNT
FROM EMPLOYEES
WHERE YEAR(HIRE_DATE) = 2017
GROUP BY MONTH(HIRE_DATE)
ORDER BY MONTH(HIRE_DATE);
+-------+-----------+
| MONTH | EMP_COUNT |
+-------+-----------+
|     1 |         1 |
|     2 |         3 |
|     3 |         3 |
|     4 |         1 |
|     5 |         2 |
|     6 |         2 |
|     8 |         1 |
|    10 |         1 |
|    11 |         2 |
|    12 |         3 |
+-------+-----------+

/* 12. Display the details of departments in which the maximum salary is more 
than 10000. */
SELECT DEPARTMENT_ID, MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) > 10000;
+---------------+------------+
| DEPARTMENT_ID | MAX_SALARY |
+---------------+------------+
|            20 |   13000.00 |
|            30 |   11000.00 |
|            80 |   14000.00 |
|            90 |   24000.00 |
|           100 |   12008.00 |
|           110 |   12008.00 |
+---------------+------------+

/* 1. Write a query that counts the number of salespeople registering orders 
for each day. (If a salesperson has more than one order on a given day, 
he or she should be counted only once.).*/
select odate, count(distinct snum) as salespeople_count
from orders
group by odate;
+------------+-------------------+
| odate      | salespeople_count |
+------------+-------------------+
| 1990-10-03 |                 4 |
| 1990-10-04 |                 3 |
+------------+-------------------+

/* 2. Write a query on the Customers table that will find the highest rating in 
each city. Put the output in this form: 
For the city (city), the highest rating is: (rating).*/


/* 3 Write an SQL query to calculate the total order amount for each day and 
display the results in descending order of total orders.*/
select odate, sum(amt) as total_order_amount
from orders
group by odate
order by total_order_amount desc;
+------------+--------------------+
| odate      | total_order_amount |
+------------+--------------------+
| 1990-10-04 |           16713.81 |
| 1990-10-03 |            8944.59 |
+------------+--------------------+

/* 4. Write a query that selects the total amount in orders for each 
salesperson for whom this total is greater than the average amount of the 
order in the table. 
(Note Use the average amount value directly →2565.84)*/
select snum, sum(amt) as total_amount
from orders
group by snum
having sum(amt) > 2565.84;
+------+--------------+
| snum | total_amount |
+------+--------------+
| 1001 |     15382.07 |
| 1002 |      5546.15 |
+------+--------------+

/* 5. Write a query that selects the highest rating in each city. */
select city, max(rating) as highest_rating
from customers
group by city;
+----------+----------------+
| city     | highest_rating |
+----------+----------------+
| London   |            100 |
| Rome     |            200 |
| San Jose |            300 |
| Berlin   |            300 |
+----------+----------------+

/* 6. Retrieve the maximum order amount for each salesperson from the 
orders table, including only those orders whose value exceeds Rs. 3000.*/
select snum, max(amt) as max_order_amount
from orders
where amt > 3000
group by snum;