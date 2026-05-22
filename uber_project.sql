DROP TABLE IF EXISTS uber_taxi_earnings;

CREATE TABLE uber (
    earning_id INT PRIMARY KEY,
    work_date DATE,
    platform VARCHAR(50),
    city VARCHAR(50),
    shift VARCHAR(50),
    hours_worked NUMERIC(5,2),
    trips INT,
    km_driven NUMERIC(8,2),
    gross_earning NUMERIC(10,2),
    tips NUMERIC(10,2),
    fuel_cost NUMERIC(10,2),
    parking_tolls NUMERIC(10,2),
    commission_fee NUMERIC(10,2)
);

-- Import data from CSV file
-- In psql, run this command from the same folder as the CSV file:
-- \copy uber FROM 'uber_taxi_earnings.csv' CSV HEADER;
select * from uber;


-- 1) Calculate total gross earnings.

select sum(gross_earning) as Total_gross_earnings
from uber;

-- 2) Calculate total net earnings.
select sum(gross_earning) as Total_gross_earnings,
sum(tips) as total_tips,
sum(fuel_cost) as fuel_cost,
sum(parking_tolls) as parking_fee, 
sum(commission_fee) as total_commission,
sum(gross_earning+tips-fuel_cost-parking_tolls-commission_fee) as net_earnings
from uber;

-- 3) Calculate total fuel cost
select sum(fuel_cost) as total_fuel_cost
from uber;

-- 4) Count total trips completed.
select sum(trips) as Total_trips
from uber;

-- 5) Calculate average net earnings per hour.
SELECT 
    SUM(gross_earning + tips - fuel_cost - parking_tolls - commission_fee) 
    / SUM(hours_worked) AS avg_net_earning_per_hour
FROM uber;

-- 6) Calculate average net earnings per km.

SELECT 
    SUM(gross_earning + tips - fuel_cost - parking_tolls - commission_fee) 
    / SUM(km_driven) AS avg_net_earning_per_KM
FROM uber;


-- 7) Find the best earning day by net earnings.
select work_date, SUM(gross_earning + tips - fuel_cost - parking_tolls - commission_fee) as net_earnings
from uber
group by work_date
order by SUM(gross_earning + tips - fuel_cost - parking_tolls - commission_fee) desc
limit 1;

-- 8) Find the worst earning day by net earnings.
select work_date, SUM(gross_earning + tips - fuel_cost - parking_tolls - commission_fee) as net_earnings
from uber
group by work_date
order by SUM(gross_earning + tips - fuel_cost - parking_tolls - commission_fee) asc
limit 1;


-- 9) Retrieve total net earnings by platform.
select platform, SUM(gross_earning + tips - fuel_cost - parking_tolls - commission_fee) as net_earnings
from uber
group by platform
order by SUM(gross_earning + tips - fuel_cost - parking_tolls - commission_fee) desc;

-- 10) Retrieve total net earnings by shift.
select shift, SUM(gross_earning + tips - fuel_cost - parking_tolls - commission_fee) as Met_earmings
from uber
group by shift
order by SUM(gross_earning + tips - fuel_cost - parking_tolls - commission_fee)desc;

-- 11) Count total trips by day of week.
select  To_char(work_date, 'day') as day,
		sum(trips) as total_trips
from uber
group by To_char(work_date, 'day');

-- 12) Calculate fuel cost percentage of gross earnings.

select round(sum(fuel_cost) / sum(gross_earning ) * 100,2) as percentage
from uber;

-- 13) Show the top 5 most profitable days.
select work_date,
	sum(gross_earning + tips - fuel_cost - parking_tolls - commission_fee) as net_profit
from uber
group by work_date
order by sum(gross_earning + tips - fuel_cost - parking_tolls - commission_fee) desc
 limit 5 ;

-- 14) Calculate average trip value by platform.


select platform,round(SUM(gross_earning) / SUM(trips),2) as avg_trip_value
from uber
group by platform;

-- 15) Show monthly net profit trend.

select extract(month from work_date) as Month_nmuber,
	SUM(gross_earning + tips - fuel_cost - parking_tolls - commission_fee) as Net_profit
from uber
group by extract (month from work_date);




