-- Q1: What is the count for fhv vehicles for year 2019?

-- Using a Non-Partitioned Table
SELECT 
    DATE_TRUNC(fhv.pickup_datetime, YEAR) AS year,
    COUNT(*) AS cnt
FROM `de-zoomcamp-944.nytaxi.external_fhv_tripdata` AS fhv
WHERE EXTRACT(YEAR FROM fhv.pickup_datetime) = 2019
GROUP BY year;

-- Using a Partitioned Table
SELECT 
    DATE_TRUNC(fhv.pickup_datetime, YEAR) AS year,
    COUNT(*) AS cnt
FROM `de-zoomcamp-944.nytaxi.fhv_trip_data_partitioned` AS fhv
WHERE EXTRACT(YEAR FROM fhv.pickup_datetime) = 2019
GROUP BY year;

--Answer 42084899


-- Q2: How many distinct dispatching_base_num we have in fhv for 2019

SELECT COUNT(DISTINCT dispatching_base_num) AS cnt_distinct_dispatch_base_num 
FROM `de-zoomcamp-944.nytaxi.fhv_trip_data_partitioned`
WHERE EXTRACT(YEAR FROM pickup_datetime) = 2019;

--Answer 792

-- Q3: Best strategy to optimise if query always filter by dropoff_datetime 
-- and order by dispatching_base_num

-- Answer: Partition by dropoff_datetime and cluster by dispatching_base_num

CREATE OR REPLACE TABLE `de-zoomcamp-944.nytaxi.fhv_tripdata_partitioned_and_clustered` 
PARTITION BY (
    DATE(pickup_datetime)
    )
CLUSTER BY (dispatching_base_num) AS
SELECT * FROM `de-zoomcamp-944.nytaxi.external_fhv_tripdata`;

-- Q4: Question 4: What is the count, estimated and actual data processed for 
-- query which counts trip between 2019/01/01 and 2019/03/31 for 
-- dispatching_base_num B00987, B02060, B02279 

SELECT COUNT(*)
FROM `de-zoomcamp-944.nytaxi.fhv_tripdata_partitioned_and_clustered`
WHERE 
    pickup_datetime >= '2019-01-01' AND pickup_datetime <= '2019-03-31'
AND 
    dispatching_base_num IN ('B00987', 'B02060', 'B02279');

--Answer Count: 26558, Estimated data processed: 400mb, actual data processed: 155mb

-- Q5: What will be the best partitioning or clustering strategy when filtering 
-- on dispatching_base_num and SR_Flag 

-- Answer: Partition by SR_Flag and cluster by dispatching_base_num

-- Q6: What improvements can be seen by partitioning and clustering for data 
-- size less than 1 GB

-- Answer: 'No Improvements' and 'Can be worse due to metadata'

--Q7: In which format does BigQuery save data?

-- Answer: Columnar
