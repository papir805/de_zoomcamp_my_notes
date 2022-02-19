--Q1
SELECT count(*) FROM `de-zoomcamp-944.production_cloud.fact_trips`
WHERE EXTRACT(YEAR FROM pickup_datetime) IN (2019, 2020);
--Answer:61602987


--Q2
SELECT service_type, count(*) * 100.0 / sum(count(*)) over()
from `de-zoomcamp-944.production_cloud.fact_trips`
WHERE EXTRACT(YEAR FROM pickup_datetime) IN (2019, 2020)
group by service_type;
--Answer: Yellow- 89.847%, Green- 10.153%


--Q3
SELECT COUNT(*)
FROM `de-zoomcamp-944.production_cloud.stg_fhv_tripsdata`;
-- Answer: 42084899


--Q4
SELECT COUNT(*)
FROM `de-zoomcamp-944.production_cloud.fact_fhv_trips`;
-- Answer 22676253


--Q5
SELECT EXTRACT(MONTH from pickup_datetime) AS month,
       COUNT(*) AS cnt
FROM `de-zoomcamp-944.production_cloud.fact_fhv_trips`
GROUP BY month
ORDER BY cnt DESC;
--Answer: January w/ count 19847263