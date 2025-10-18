select * from Teleco_churn

--Q1 KPI for given data 
-- gender wise count
select  gender,count(*) as total_count
from teleco_churn
group by gender

-- Senior citizen wise count
select seniorcitizen,COUNT(*) as  total_count
from teleco_churn
group by seniorcitizen

--contract wise
select contract,
COUNT(*) as total_count
from teleco_churn
group by contract
--no internet service

select count(*) as No_internet_service
from teleco_churn
where internetservice = 'no'

--No phone service
select count(*)  as No_phone_service
from teleco_churn
where phoneservice = 'no'

-- internetservice count

select internetservice,COUNT(*) AS total_count
from teleco_churn
where internetservice NOT IN  ('no')
group by internetservice

--count of payment method

select paymentmethod as Payment_Method,count(*)  as total_count 
from teleco_churn
group by paymentmethod

--count of multiple lines

select count(*) as Multiple_line
from Teleco_churn
where multiplelines = 'yes'

--Customer count over time
select tenure,COUNT(*) as total_cust
from Teleco_churn
group by tenure
order by tenure

--Churn rate per tenure

with churn_cust as(
	select tenure,sum(case when churn = 'yes' then 1 else 0  end) as total_churn ,
	count(*) as total_cust
	from teleco_churn
	group by tenure)

	select tenure,round(cast(total_churn as float)/total_cust,2)*100 as churn_rate 
	from churn_cust
	order by tenure;

--overall churn rate 

select round(cast(total_churn as float)/total_cust,2)*100 as churn_rate 
from (
select sum(case when churn = 'yes' then 1 else 0  end) as total_churn ,
	count(*) as total_cust
	from teleco_churn) x

	SELECT 
    tenure, 
    paymentmethod, 
    COUNT(*) AS total_count
FROM teleco_churn
GROUP BY tenure, paymentmethod
ORDER BY tenure;

	


	LAPTOP-3V2Q0NDI\SQLEXPRESS







