
-- 1. List all criminals ordered by prior_convictions in descending order.
select * from criminals order by prior_convictions desc;

-- 2. Show all states whose base name starts with "Tamil Nadu".
select * from states where state_name like "Tamil%" ;

-- 3. Find all cases filed in the year 2023.
select * from cases where date_filed between "2023-01-01" and "2023-12-31";

-- 4. List female officers ordered by rank.
select* from  officers where gender = "f" order by rank_ ;

-- 5. Show all stolen properties with estimated_value_inr above 1,00,000.
select * from stolen_property where estimated_value_inr > 100000;

-- 6. List criminals with status "Absconding", ordered by age ascending.
select * from criminals where current_status = "Absconding" order by age;

-- 7. Show only the records where verdict_type is "Guilty".
select * from verdicts where verdict_type = "Guilty";

-- 8. List arrests where bail was NOT granted.
select * from arrests where bail_granted="no";

-- 9. Find all victims younger than 18 years.
select * from victims where age<18;

-- 10. Show police stations with staff_strength greater than 50.
select * from police_stations where staff_strength>50;

-- 11. List all crime_types belonging to the "Cyber Crime" category.
select * from crime_types where category = "Cyber Crime";

-- 12. Count how many complaints have status "Rejected".
select * from  complaints where complaint_status = "Rejected";

-- 13. Show every case along with its victim name, station name, and crime name.
select b.crime_name,c.station_name,d.victim_name from cases as a 
inner join crime_types as b
on a.crime_type_id=b.crime_type_id
inner join police_stations as c 
on a.station_id=c.station_id
inner join  victims as d 
on a.victim_id=d.victim_id;

-- 14. Join officer name with the FIR number of the case they are investigating.
select a.fir_number,b.officer_name,a.investigating_officer_id from cases as a 
inner join officers as b 
on a.station_id=b.station_id;

-- 15. For every criminal, show the name of the officer who arrested them.
select b.criminal_name,c.officer_name from arrests as a 
inner join criminals as b 
on a.criminal_id=b.criminal_id
inner join officers as c 
on a.arresting_officer_id=c.officer_id;

-- 16. Show weapon type along with the FIR number of the case it was used in.
select a.weapon_type,b.fir_number from weapons as a
inner join cases as b 
on a.case_id=b.case_id;

-- 17. Join judge name with the name of the court they work at.
select a.judge_name,b.court_name from judges as a
inner join courts as b 
on a.court_id=b.court_id;

-- 18. Show hearing date along with the related case status.
select a.hearing_date,b.case_status from hearings as a 
inner join cases as b 
on a.case_id=b.case_id;

-- 19. Show each state name with the count of districts under it (JOIN).
select count(a.district_id),b.state_name from 
districts as a inner join 
states as b on a.state_id=b.state_id group by a.state_id;

-- 20. Show each department name with the count of officers working in it.
select count(b.officer_id) as count_officer,a.department_name from departments as a 
inner join officers as b 
on a.department_id=b.department_id group by b.department_id;

-- 21. Join victim name with their complaint status.
select a.victim_name,b.complaint_status from victims as a 
inner join complaints as b 
on a.victim_id=b.victim_id;

-- 22. Join vehicle registration number with the related case status.
select a.registration_number,case_status from vehicles as a 
inner join cases as b 
on a.case_id=b.case_id;

-- 23. Join court name with district name.
select b.court_name,a.district_name from districts as a 
inner join courts as b 
on a.district_id=b.district_id;

-- 24. Join evidence type with the FIR number.
select a.evidence_type, b.fir_number from evidence as a 
inner join cases as b
on a.case_id=b.case_id;

-- 25. Join witness name with case status.
select a.witness_name,b.case_status from witnesses as a 
inner join cases as b 
on a.case_id=b.case_id;

-- 26. Show verdict type, hearing date, and judge name together (3-table join).
select b.verdict_type,a.hearing_date,c.judge_name from hearings as a 
inner join verdicts as  b
on a.hearing_id=b.hearing_id
inner join judges as c 
on a.judge_id=c.judge_id;

-- 27. Join stolen property type, estimated value, and FIR number.
select a.property_type,a.estimated_value_inr,b.fir_number from stolen_property as a 
inner join cases as b 
on a.case_id=b.case_id;

-- 28. Count total cases for each crime category.
select count(crime_type_id),category from
crime_types group by(category);

-- 29. Count total complaints for each police station.
select count(complaint_id),b.station_name from complaints as a 
inner join police_stations as b
on a.station_id = b.station_id group by (b.station_name);

-- 30. Count how many officers exist for each rank.
select count(officer_id),rank_ from 
officers group by (rank_);

-- 31. Find the average population for each district.
select avg(population) as average_population,district_name from districts
group by(district_name);

-- 32. Count how many verdicts exist for each verdict_type.
select count(verdict_id),verdict_type from verdicts
group by(verdict_type);

-- 33. Count weapon_type grouped by recovery_status.
select count(weapon_type),recovery_status from 
weapons group by(recovery_status);

-- 34. Count total stolen items for each vehicle_type.
select count(vehicle_id) , vehicle_type from vehicles 
where vehicle_status="stolen" group by (vehicle_type);

-- 35. Sum total estimated stolen value for each crime category.
SELECT ct.category, SUM(sp.estimated_value_inr) AS total_stolen_value
FROM stolen_property sp
JOIN cases c ON sp.case_id = c.case_id
JOIN crime_types ct ON c.crime_type_id = ct.crime_type_id
GROUP BY ct.category
ORDER BY total_stolen_value DESC;

-- 36. Calculate average years of experience per officer rank (based on joining_date).
SELECT rank_, ROUND(AVG(TIMESTAMPDIFF(YEAR, joining_date, CURDATE())), 1) AS avg_experience_years
FROM officers
GROUP BY rank_
ORDER BY avg_experience_years DESC;

 -- 37. Show only stations that have handled more than 100 cases (HAVING).
select count(b.case_id) as case_count,station_name from police_stations as a
join cases as b 
on a.station_id=b.station_id
group by station_name 
having count(b.case_id)>4;

-- 38. Show states where total district population is above 10 lakh (HAVING).
select sum(population),state_name from districts as a
join states as b
on a.state_id=b.state_id
group by b.state_name 
having sum(population)>1000000
order by sum(population) desc;

-- 39. Find criminals whose prior_convictions is above the average.
select * from criminals where prior_convictions >
(
select avg(prior_convictions) from criminals);

-- 40. Find cases that have no witnesses recorded.

SELECT case_id, fir_number, case_status
FROM cases
WHERE case_id NOT IN (SELECT DISTINCT case_id FROM witnesses WHERE case_id IS NOT NULL);

-- 41. Find the stolen property with the maximum estimated_value_inr.
SELECT property_id, case_id, property_type, estimated_value_inr
FROM stolen_property
WHERE estimated_value_inr = (SELECT MAX(estimated_value_inr) FROM stolen_property);


-- 42. List cases that have no evidence collected.
select evidence_id,case_id,evidence_type,analysis_status from evidence where case_id
not in (select distinct case_id from evidence where analysis_status="collected");

-- 43. Find police stations with staff_strength above the average.
select station_id,station_name,staff_strength from police_stations 
where staff_strength>(select avg(staff_strength) from police_stations)
order by staff_strength desc;


-- 44. Find cases that have no hearings scheduled.
select case_id,hearing_date,hearing_status from hearings
where case_id not in (select distinct case_id from hearings where case_id is not null);


-- 45. Rank officers within each station using RANK(), ordered by joining_date.
SELECT officer_id,officer_name,station_id,joining_date,
RANK() OVER (PARTITION BY station_id ORDER BY joining_date ASC) AS seniority_rank
FROM officers
ORDER BY station_id, seniority_rank;


-- 46. Rank each crime category by case count using DENSE_RANK().
SELECT category, total_cases,
       DENSE_RANK() OVER (ORDER BY total_cases DESC) AS category_rank
FROM (
    SELECT ct.category, COUNT(c.case_id) AS total_cases
    FROM cases c
    JOIN crime_types ct ON c.crime_type_id = ct.crime_type_id
    GROUP BY ct.category
) AS category_counts
ORDER BY category_rank;