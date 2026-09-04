/* 1. Display all the first names in lower case and the last names in upper case as the 
single column separated with ' - '. Provide the meaningful name to the column. */
SELECT CONCAT (LOWER(FIRST_NAME),' - ',UPPER(LAST_NAME))
AS 'FULL NAME' FROM employees;
+---------------------+
| FULL NAME           |
+---------------------+
| ellen - ABEL        |
| sundar - ANDE       |
| mozhe - ATKINSON    |
| shelli - BAIDA      |
| amit - BANDA        |
| elizabeth - BATES   |
| sarah - BELL        |
| david - BERNSTEIN   |
| laura - BISSOT      |
| harrison - BLOOM    |
| hermann - BROWN     |
| alexis - BULL       |
| anthony - CABRIO    |
| gerald - CAMBRAULT  |
| nanette - CAMBRAULT |
| john - CHEN         |
| kelly - CHUNG       |
| karen - COLMENARES  |
| curtis - DAVIES     |
| pat - DAVIS         |
| julia - DELLINGER   |
| jennifer - DILLY    |
| louise - DORAN      |
| alberto - ERRAZURIZ |
| britney - EVERETT   |
| daniel - FAVIET     |
| kevin - FEENEY      |
| jean - FLEAUR       |
| tayler - FOX        |
| adam - FRIPP        |
| lex - GARCIA        |
| ki - GEE            |
| girard - GEONI      |
| william - GIETZ     |
| douglas - GRANT     |
| kimberely - GRANT   |
| danielle - GREENE   |
| nancy - GRUENBERG   |
| peter - HALL        |
| shelley - HIGGINS   |
| guy - HIMURO        |
| alyssa - HUTTON     |
| valli - JACKSON     |
| susan - JACOBS      |
| alexander - JAMES   |
| charles - JOHNSON   |
| vance - JONES       |
| payam - KAUFLING    |
| alexander - KHOO    |
| janette - KING      |
| steven - KING       |
| sundita - KUMAR     |
| renske - LADWIG     |
| james - LANDRY      |
| david - LEE         |
| den - LI            |
| jack - LIVINGSTON   |
| jason - MALLIN      |
| steven - MARKLE     |
| james - MARLOW      |
| michael - MARTINEZ  |
| mattea - MARVINS    |
| randall - MATOS     |
| allan - MCEWEN      |
| samuel - MCLEOD     |
| irene - MIKKILINENI |
| bruce - MILLER      |
| kevin - MOURGOS     |
| julia - NAYER       |
| diana - NGUYEN      |
| donald - OCONNELL   |
| christopher - OLSEN |
| tj - OLSON          |
| lisa - OZER         |
| karen - PARTNERS    |
| joshua - PATEL      |
| randall - PERKINS   |
| hazel - PHILTANKER  |
| luis - POPP         |
| trenna - RAJS       |
| michael - ROGERS    |
| nandita - SARCHAND  |
| ismael - SCIARRA    |
| john - SEO          |
| sarath - SEWALL     |
| john - SINGH        |
| lindsey - SMITH     |
| william - SMITH     |
| stephen - STILES    |
| martha - SULLIVAN   |
| patrick - SULLY     |
| jonathon - TAYLOR   |
| winston - TAYLOR    |
| sigal - TOBIAS      |
| sean - TUCKER       |
| oliver - TUVAULT    |
| jose manuel - URMAN |
| peter - VARGAS      |
| timothy - VENZL     |
| clara - VISHNEY     |
| shanta - VOLLMAN    |
| alana - WALSH       |
| matthew - WEISS     |
| jennifer - WHALEN   |
| david - WILLIAMS    |
| neena - YANG        |
| eleni - ZLOTKEY     |
+---------------------+

/* 2. Display the first word of the job title. (Hint : Use substring_index). */
SELECT SUBSTRING_INDEX(JOB_TITLE,' ',1) AS job title
from jobs;
+----------------+
| job title      |
+----------------+
| Public         |
| Accounting     |
| Administration |
| President      |
| Administration |
| Accountant     |
| Finance        |
| Human          |
| Programmer     |
| Marketing      |
| Marketing      |
| Public         |
| Purchasing     |
| Purchasing     |
| Sales          |
| Sales          |
| Shipping       |
| Stock          |
| Stock          |
+----------------+

/* 3. Display the First name, last name and length of first name for the employees whose 
last name contains character ‘b’ anywhere after 3rd position.*/
SELECT FIRST_NAME,LAST_NAME ,LENGTH(FIRST_NAME) FROM employees
where LIKE "___b%";
+------------+-----------+--------------------+
| FIRST_NAME | LAST_NAME | LENGTH(FIRST_NAME) |
+------------+-----------+--------------------+
| Anthony    | Cabrio    |                  7 |
| Gerald     | Cambrault |                  6 |
| Nanette    | Cambrault |                  7 |
| Nancy      | Gruenberg |                  5 |
| Susan      | Jacobs    |                  5 |
| Sigal      | Tobias    |                  5 |
+------------+-----------+--------------------+

/* 4. Display the employee id, first name and last name of the employees whose first or 
last name includes a space in between.*/
SELECT EMPLOYEE_ID ,FIRST_NAME ,LAST_NAME
from employees
where LAST_NAME LIKE "% %" 
OR FIRST_NAME LIKE "% %";
+-------------+-------------+-----------+
| EMPLOYEE_ID | FIRST_NAME  | LAST_NAME |
+-------------+-------------+-----------+
|         112 | Jose Manuel | Urman     |
+-------------+-------------+-----------+

/* 5. Display first name, salary, and round the salary to thousands.*/
SELECT FIRST_NAME,SALARY ,ROUND(SALARY,-3) AS 'r_salary_-3' FROM employees;
+-------------+----------+-------------+
| FIRST_NAME  | SALARY   | r_salary_-3 |
+-------------+----------+-------------+
| Steven      | 24000.00 |       24000 |
| Neena       | 17000.00 |       17000 |
| Lex         | 17000.00 |       17000 |
| Alexander   |  9000.00 |        9000 |
| Bruce       |  6000.00 |        6000 |
| David       |  4800.00 |        5000 |
| Valli       |  4800.00 |        5000 |
| Diana       |  4200.00 |        4000 |
| Nancy       | 12008.00 |       12000 |
| Daniel      |  9000.00 |        9000 |
| John        |  8200.00 |        8000 |
| Ismael      |  7700.00 |        8000 |
| Jose Manuel |  7800.00 |        8000 |
| Luis        |  6900.00 |        7000 |
| Den         | 11000.00 |       11000 |
| Alexander   |  3100.00 |        3000 |
| Shelli      |  2900.00 |        3000 |
| Sigal       |  2800.00 |        3000 |
| Guy         |  2600.00 |        3000 |
| Karen       |  2500.00 |        3000 |
| Matthew     |  8000.00 |        8000 |
| Adam        |  8200.00 |        8000 |
| Payam       |  7900.00 |        8000 |
| Shanta      |  6500.00 |        7000 |
| Kevin       |  5800.00 |        6000 |
| Julia       |  3200.00 |        3000 |
| Irene       |  2700.00 |        3000 |
| James       |  2400.00 |        2000 |
| Steven      |  2200.00 |        2000 |
| Laura       |  3300.00 |        3000 |
| Mozhe       |  2800.00 |        3000 |
| James       |  2500.00 |        3000 |
| TJ          |  2100.00 |        2000 |
| Jason       |  3300.00 |        3000 |
| Michael     |  2900.00 |        3000 |
| Ki          |  2400.00 |        2000 |
| Hazel       |  2200.00 |        2000 |
| Renske      |  3600.00 |        4000 |
| Stephen     |  3200.00 |        3000 |
| John        |  2700.00 |        3000 |
| Joshua      |  2500.00 |        3000 |
| Trenna      |  3500.00 |        4000 |
| Curtis      |  3100.00 |        3000 |
| Randall     |  2600.00 |        3000 |
| Peter       |  2500.00 |        3000 |
| John        | 14000.00 |       14000 |
| Karen       | 13500.00 |       14000 |
| Alberto     | 12000.00 |       12000 |
| Gerald      | 11000.00 |       11000 |
| Eleni       | 10500.00 |       11000 |
| Sean        | 10000.00 |       10000 |
| David       |  9500.00 |       10000 |
| Peter       |  9000.00 |        9000 |
| Christopher |  8000.00 |        8000 |
| Nanette     |  7500.00 |        8000 |
| Oliver      |  7000.00 |        7000 |
| Janette     | 10000.00 |       10000 |
| Patrick     |  9500.00 |       10000 |
| Allan       |  9000.00 |        9000 |
| Lindsey     |  8000.00 |        8000 |
| Louise      |  7500.00 |        8000 |
| Sarath      |  7000.00 |        7000 |
| Clara       | 10500.00 |       11000 |
| Danielle    |  9500.00 |       10000 |
| Mattea      |  7200.00 |        7000 |
| David       |  6800.00 |        7000 |
| Sundar      |  6400.00 |        6000 |
| Amit        |  6200.00 |        6000 |
| Lisa        | 11500.00 |       12000 |
| Harrison    | 10000.00 |       10000 |
| Tayler      |  9600.00 |       10000 |
| William     |  7400.00 |        7000 |
| Elizabeth   |  7300.00 |        7000 |
| Sundita     |  6100.00 |        6000 |
| Ellen       | 11000.00 |       11000 |
| Alyssa      |  8800.00 |        9000 |
| Jonathon    |  8600.00 |        9000 |
| Jack        |  8400.00 |        8000 |
| Kimberely   |  7000.00 |        7000 |
| Charles     |  6200.00 |        6000 |
| Winston     |  3200.00 |        3000 |
| Jean        |  3100.00 |        3000 |
| Martha      |  2500.00 |        3000 |
| Girard      |  2800.00 |        3000 |
| Nandita     |  4200.00 |        4000 |
| Alexis      |  4100.00 |        4000 |
| Julia       |  3400.00 |        3000 |
| Anthony     |  3000.00 |        3000 |
| Kelly       |  3800.00 |        4000 |
| Jennifer    |  3600.00 |        4000 |
| Timothy     |  2900.00 |        3000 |
| Randall     |  2500.00 |        3000 |
| Sarah       |  4000.00 |        4000 |
| Britney     |  3900.00 |        4000 |
| Samuel      |  3200.00 |        3000 |
| Vance       |  2800.00 |        3000 |
| Alana       |  3100.00 |        3000 |
| Kevin       |  3000.00 |        3000 |
| Donald      |  2600.00 |        3000 |
| Douglas     |  2600.00 |        3000 |
| Jennifer    |  4400.00 |        4000 |
| Michael     | 13000.00 |       13000 |
| Pat         |  6000.00 |        6000 |
| Susan       |  6500.00 |        7000 |
| Hermann     | 10000.00 |       10000 |
| Shelley     | 12008.00 |       12000 |
| William     |  8300.00 |        8000 |
+-------------+----------+-------------+

/* 6. Display employee ID and the date on which he ended his previous job in the format as 
mentioned. (Format: Thursday, October 27th 2011) */
SELECT employee_id,DATE_FORMAT(end_date,'%w, %m %d %y') FROM employees;
+-------------+--------------------------------------+
| employee_id | DATE_FORMAT(END_DATE,'%w, %m %d %y') |
+-------------+--------------------------------------+
|         101 | 4, 10 27 11                          |
|         101 | 0, 03 15 15                          |
|         102 | 0, 07 24 16                          |
|         114 | 0, 12 31 17                          |
|         122 | 0, 12 31 17                          |
|         176 | 6, 12 31 16                          |
|         176 | 0, 12 31 17                          |
|         200 | 5, 06 17 11                          |
|         200 | 6, 12 31 16                          |
|         201 | 2, 12 19 17                          |
+-------------+--------------------------------------+

/*7. Display first name and date of first salary of the employees. 
(Consider 1st day of month as salary day. HINT: LAST_DAY). */
SELECT employee_id,FIRST_NAME,date_add(last_day(hire_date),interval 1 day)as first_salary from employees;
+-------------+-------------+--------------+
| employee_id | FIRST_NAME  | first_salary |
+-------------+-------------+--------------+
|         100 | Steven      | 2013-07-01   |
|         101 | Neena       | 2015-10-01   |
|         102 | Lex         | 2011-02-01   |
|         103 | Alexander   | 2016-02-01   |
|         104 | Bruce       | 2017-06-01   |
|         105 | David       | 2015-07-01   |
|         106 | Valli       | 2016-03-01   |
|         107 | Diana       | 2017-03-01   |
|         108 | Nancy       | 2012-09-01   |
|         109 | Daniel      | 2012-09-01   |
|         110 | John        | 2015-10-01   |
|         111 | Ismael      | 2015-10-01   |
|         112 | Jose Manuel | 2016-04-01   |
|         113 | Luis        | 2018-01-01   |
|         114 | Den         | 2013-01-01   |
|         115 | Alexander   | 2013-06-01   |
|         116 | Shelli      | 2016-01-01   |
|         117 | Sigal       | 2015-08-01   |
|         118 | Guy         | 2016-12-01   |
|         119 | Karen       | 2017-09-01   |
|         120 | Matthew     | 2014-08-01   |
|         121 | Adam        | 2015-05-01   |
|         122 | Payam       | 2013-06-01   |
|         123 | Shanta      | 2015-11-01   |
|         124 | Kevin       | 2017-12-01   |
|         125 | Julia       | 2015-08-01   |
|         126 | Irene       | 2016-10-01   |
|         127 | James       | 2017-02-01   |
|         128 | Steven      | 2018-04-01   |
|         129 | Laura       | 2015-09-01   |
|         130 | Mozhe       | 2015-11-01   |
|         131 | James       | 2015-03-01   |
|         132 | TJ          | 2017-05-01   |
|         133 | Jason       | 2014-07-01   |
|         134 | Michael     | 2016-09-01   |
|         135 | Ki          | 2018-01-01   |
|         136 | Hazel       | 2018-03-01   |
|         137 | Renske      | 2013-08-01   |
|         138 | Stephen     | 2015-11-01   |
|         139 | John        | 2016-03-01   |
|         140 | Joshua      | 2016-05-01   |
|         141 | Trenna      | 2013-11-01   |
|         142 | Curtis      | 2015-02-01   |
|         143 | Randall     | 2016-04-01   |
|         144 | Peter       | 2016-08-01   |
|         145 | John        | 2014-11-01   |
|         146 | Karen       | 2015-02-01   |
|         147 | Alberto     | 2015-04-01   |
|         148 | Gerald      | 2017-11-01   |
|         149 | Eleni       | 2018-02-01   |
|         150 | Sean        | 2015-02-01   |
|         151 | David       | 2015-04-01   |
|         152 | Peter       | 2015-09-01   |
|         153 | Christopher | 2016-04-01   |
|         154 | Nanette     | 2017-01-01   |
|         155 | Oliver      | 2017-12-01   |
|         156 | Janette     | 2014-02-01   |
|         157 | Patrick     | 2014-04-01   |
|         158 | Allan       | 2014-09-01   |
|         159 | Lindsey     | 2015-04-01   |
|         160 | Louise      | 2016-01-01   |
|         161 | Sarath      | 2016-12-01   |
|         162 | Clara       | 2015-12-01   |
|         163 | Danielle    | 2017-04-01   |
|         164 | Mattea      | 2018-02-01   |
|         165 | David       | 2018-03-01   |
|         166 | Sundar      | 2018-04-01   |
|         167 | Amit        | 2018-05-01   |
|         168 | Lisa        | 2015-04-01   |
|         169 | Harrison    | 2016-04-01   |
|         170 | Tayler      | 2016-02-01   |
|         171 | William     | 2017-03-01   |
|         172 | Elizabeth   | 2017-04-01   |
|         173 | Sundita     | 2018-05-01   |
|         174 | Ellen       | 2014-06-01   |
|         175 | Alyssa      | 2015-04-01   |
|         176 | Jonathon    | 2016-04-01   |
|         177 | Jack        | 2016-05-01   |
|         178 | Kimberely   | 2017-06-01   |
|         179 | Charles     | 2018-02-01   |
|         180 | Winston     | 2016-02-01   |
|         181 | Jean        | 2016-03-01   |
|         182 | Martha      | 2017-07-01   |
|         183 | Girard      | 2018-03-01   |
|         184 | Nandita     | 2014-02-01   |
|         185 | Alexis      | 2015-03-01   |
|         186 | Julia       | 2016-07-01   |
|         187 | Anthony     | 2017-03-01   |
|         188 | Kelly       | 2015-07-01   |
|         189 | Jennifer    | 2015-09-01   |
|         190 | Timothy     | 2016-08-01   |
|         191 | Randall     | 2018-01-01   |
|         192 | Sarah       | 2014-03-01   |
|         193 | Britney     | 2015-04-01   |
|         194 | Samuel      | 2016-08-01   |
|         195 | Vance       | 2017-04-01   |
|         196 | Alana       | 2016-05-01   |
|         197 | Kevin       | 2016-06-01   |
|         198 | Donald      | 2017-07-01   |
|         199 | Douglas     | 2018-02-01   |
|         200 | Jennifer    | 2013-10-01   |
|         201 | Michael     | 2014-03-01   |
|         202 | Pat         | 2015-09-01   |
|         203 | Susan       | 2012-07-01   |
|         204 | Hermann     | 2012-07-01   |
|         205 | Shelley     | 2012-07-01   |
|         206 | William     | 2012-07-01   |
+-------------+-------------+--------------+

/* 8. Display first name and experience of the employees in the format of number of years, 
months and days completed.*/
SELECT first_name,CONCAT(TIMESTAMPDIFF(YEAR,hire_date,NOW()),' years ',TIMESTAMPDIFF(MONTH,hire_date,NOW())%12,' month ',TIMESTAMPDIFF(DAY,hire_date,now())%30,' days ') AS 'EXPRENCE' FROM employees;
+-------------+----------------------------+
| first_name  | EXPRENCE                   |
+-------------+----------------------------+
| Steven      | 13 years 2 month 18 days   |
| Neena       | 10 years 11 month 2 days   |
| Lex         | 15 years 7 month 4 days    |
| Alexander   | 10 years 7 month 18 days   |
| Bruce       | 9 years 3 month 24 days    |
| David       | 11 years 2 month 0 days    |
| Valli       | 10 years 6 month 15 days   |
| Diana       | 9 years 6 month 7 days     |
| Nancy       | 14 years 0 month 22 days   |
| Daniel      | 14 years 0 month 23 days   |
| John        | 10 years 10 month 25 days  |
| Ismael      | 10 years 10 month 23 days  |
| Jose Manuel | 10 years 5 month 14 days   |
| Luis        | 8 years 8 month 4 days     |
| Den         | 13 years 8 month 0 days    |
| Alexander   | 13 years 3 month 18 days   |
| Shelli      | 10 years 8 month 28 days   |
| Sigal       | 11 years 1 month 1 days    |

/* 9. Display the employee id, first name and joining date of the employees who joined in 
the month of august of any year.*/
SELECT EMPLOYEE_ID ,FIRST_NAME, HIRE_DATE
from employees
WHERE MONTH(HIRE_DATE)=8;
+-------------+------------+------------+
| EMPLOYEE_ID | FIRST_NAME | HIRE_DATE  |
+-------------+------------+------------+
|         108 | Nancy      | 2012-08-17 |
|         109 | Daniel     | 2012-08-16 |
|         119 | Karen      | 2017-08-10 |
|         129 | Laura      | 2015-08-20 |
|         134 | Michael    | 2016-08-26 |
|         152 | Peter      | 2015-08-20 |
|         158 | Allan      | 2014-08-01 |
|         189 | Jennifer   | 2015-08-13 |
|         202 | Pat        | 2015-08-17 |
+-------------+------------+------------+

/* 10. Display the details of employees who joined before the year 2015. */
SELECT * FROM employees
where year(HIRE_DATE)  < 2015;
+-------------+------------+-----------+----------+----------------+------------+------------+----------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME | LAST_NAME | EMAIL    | PHONE_NUMBER   | HIRE_DATE  | JOB_ID     | SALARY   | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+------------+-----------+----------+----------------+------------+------------+----------+----------------+------------+---------------+
|         100 | Steven     | King      | SKING    | 1.515.555.0100 | 2013-06-17 | AD_PRES    | 24000.00 |           NULL |       NULL |            90 |
|         102 | Lex        | Garcia    | LGARCIA  | 1.515.555.0102 | 2011-01-13 | AD_VP      | 17000.00 |           NULL |        100 |            90 |
|         108 | Nancy      | Gruenberg | NGRUENBE | 1.515.555.0108 | 2012-08-17 | FI_MGR     | 12008.00 |           NULL |        101 |           100 |
|         109 | Daniel     | Faviet    | DFAVIET  | 1.515.555.0109 | 2012-08-16 | FI_ACCOUNT |  9000.00 |           NULL |        108 |           100 |
|         114 | Den        | Li        | DLI      | 1.515.555.0114 | 2012-12-07 | PU_MAN     | 11000.00 |           NULL |        100 |            30 |
|         115 | Alexander  | Khoo      | AKHOO    | 1.515.555.0115 | 2013-05-18 | PU_CLERK   |  3100.00 |           NULL |        114 |            30 |
|         120 | Matthew    | Weiss     | MWEISS   | 1.650.555.0120 | 2014-07-18 | ST_MAN     |  8000.00 |           NULL |        100 |            50 |
|         122 | Payam      | Kaufling  | PKAUFLIN | 1.650.555.0122 | 2013-05-01 | ST_MAN     |  7900.00 |           NULL |        100 |            50 |
|         133 | Jason      | Mallin    | JMALLIN  | 1.650.555.0133 | 2014-06-14 | ST_CLERK   |  3300.00 |           NULL |        122 |            50 |
|         137 | Renske     | Ladwig    | RLADWIG  | 1.650.555.0137 | 2013-07-14 | ST_CLERK   |  3600.00 |           NULL |        123 |            50 |
|         141 | Trenna     | Rajs      | TRAJS    | 1.650.555.0141 | 2013-10-17 | ST_CLERK   |  3500.00 |           NULL |        124 |            50 |
|         145 | John       | Singh     | JSINGH   | 44.1632.960000 | 2014-10-01 | SA_MAN     | 14000.00 |           0.40 |        100 |            80 |
|         156 | Janette    | King      | JKING    | 44.1632.960011 | 2014-01-30 | SA_REP     | 10000.00 |           0.35 |        146 |            80 |
|         157 | Patrick    | Sully     | PSULLY   | 44.1632.960012 | 2014-03-04 | SA_REP     |  9500.00 |           0.35 |        146 |            80 |
|         158 | Allan      | McEwen    | AMCEWEN  | 44.1632.960013 | 2014-08-01 | SA_REP     |  9000.00 |           0.35 |        146 |            80 |
|         174 | Ellen      | Abel      | EABEL    | 44.1632.960029 | 2014-05-11 | SA_REP     | 11000.00 |           0.30 |        149 |            80 |

/* 11. Display the number of days between system date and 1st January 2011.*/
 SELECT TIMESTAMPDIFF(day,'2011-01-01',NOW()) AS days FROM DUAL;
+------+
| days |
+------+
| 5716 |
+------+

/*12. Display number of employees joined after 15th of any month. */
SELECT COUNT(employee_id)AS count from employees WHERE DAY(HIRE_DATE)<15;
+-------+
| count |
+-------+
|    57 |
+-------+
/* 13. Display third highest salary of employees.*/
SELECT SALARY from employees
ORDER BY SALARY DESC
LIMIT 2,1;
+----------+
| SALARY   |
+----------+
| 17000.00 |
+----------+

/* 1. Display all the Suppliers, belonging to cities starting with the letter ‘L’. */
+----+-------+--------+--------+
| S# | Sname | status | city   |
+----+-------+--------+--------+
| S1 | Smith |     20 | London |
| S4 | Clark |     20 | London |
+----+-------+--------+--------+

/*2. Display all the Jobs, with the third letter in JNAME as ‘n’.*/
select jname from j
where jname LIKE '__n%';
+---------+
| jname   |
+---------+
| Punch   |
| Console |
+---------+

/* 3. Display all the Supplier names with the initial letter capital.*/
select concat(UPPER(LEFT(sname,1)),substring(sname,2))
as supplier_name from s;
+---------------+
| supplier_name |
+---------------+
| Smith         |
| Jones         |
| Blake         |
| Clark         |
| Adams         |
+---------------+

/* 4. Display all the Supplier names in upper case.*/
select upper(sname) from s;
+--------------+
| upper(sname) |
+--------------+
| SMITH        |
| JONES        |
| BLAKE        |
| CLARK        |
| ADAMS        |
+--------------+

/* 5. Display all the Supplier names in lower case. */
select lower(sname) from s;
+--------------+
| lower(sname) |
+--------------+
| smith        |
| jones        |
| blake        |
| clark        |
| adams        |
+--------------+

/* 6. Display the Supplier names and the lengths of the names. */
select length(sname) from s;
+---------------+
| length(sname) |
+---------------+
|             5 |
|             5 |
|             5 |
|             5 |
|             5 |
+---------------+

/* 7. Display the current day (e.g. Thursday).*/
select DAYNAME(NOW()) from dual;
+----------------+
| dayname(now()) |
+----------------+
| Friday         |
+----------------+

/* 8. Display the minimum Status in the Supplier table.*/
select min(status) from s;
D6_99024_tejas>select min(status) from s;
+-------------+
| min(status) |
+-------------+
|          10 |
+-------------+

/* 9. Display the maximum Weight in the Parts table. 
*/
select max(weight) from p;
+-------------+
| max(weight) |
+-------------+
|          19 |
+-------------+

/* 10. Display the average Weight of the Parts. 
*/
select avg(weight) from p;
+-------------+
| avg(weight) |
+-------------+
|     15.1667 |
+-------------+

/* 11. Display the total Quantity sold for part ‘P1’. */
select sum(QTY) from sp
where `p#`='p1';
+----------+
| sum(QTY) |
+----------+
|     1000 |
+----------+
/* 12. Display all the Supplier names (with ‘la’ replaced by ‘ro’). HINT: REPLACE.*/
select replace (sname,'la','ra') from s;
| replace (sname,'la','ra') |
+---------------------------+
| Smith                     |
| Jones                     |
| Brake                     |
| Crark                     |
| Adams                     |
+---------------------------+
