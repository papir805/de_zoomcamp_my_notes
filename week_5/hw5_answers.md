Question 1: Spark version?
Answer: spark.__version__ is 3.0.3

Question 2: Size of FHVHV February 2021?

Using: !ls -lR --block-size=M /home/rancher/data/fhvhv/2021/02
Answer: 210MB 
Using: Spark job information the choosing the partitioning stage with 24 tasks
Answer: 208.8MB 

Question 3: How many records on Feb 15th 2021?
Answer: 367170 on Feb 15th

Question 4: What day in February 2021 had the longest trip duration?
Answer: Trip on 2/11 was had the longest duration of 1259.0

Question 5: How many stages does Spark need for finding most frequent dispatching_base_num?

If using spark.sql query: 3 stages
most_freq_disp_base_num = spark.sql("""
SELECT dispatching_base_num,
       count(*) AS cnt
FROM fhv_feb
GROUP BY dispatching_base_num
ORDER BY cnt DESC;
""")


If using spark.groupBy(): three stages
most_freq_disp_base_num_2 = fhvhv_df_spark.groupBy('dispatching_base_num').count().show()


Question 6: What is the most common pickup/dropoff location pair?

spark.sql(
"""
SELECT    -- fhv.day,
          fhv.PULocationID,
          fhv.DOLocationID,
          -- zones_PU.LocationID AS PU_zones,
          -- zones_PU.Zone,
          -- zones_DO.LocationID AS DO_zones,
          -- zones_DO.Zone,
          COUNT(*) AS cnt -- OVER (PARTITION BY zones_PU.LocationID, zones_DO.LocationID) AS cnt
FROM      fhv_feb AS fhv
LEFT JOIN taxi_zones AS zones_PU
  ON      fhv.PULocationID=zones_PU.LocationID
LEFT JOIN taxi_zones AS zones_DO
  ON      fhv.DOLocationID=zones_DO.LocationID
WHERE fhv.PULocationID != fhv.DOLocationID
GROUP BY fhv.PULocationID, fhv.DOLocationID
ORDER BY cnt DESC
LIMIT 10""").show()

Answer: JFK Airport / NA
PULocationID: 132 (JFK Airport) DOLocationID: 265 (NA)