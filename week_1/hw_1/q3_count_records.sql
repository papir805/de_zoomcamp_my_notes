SELECT
	CAST(tpep_pickup_datetime AS DATE) AS "pickup_date",
	COUNT(*) AS cnt
FROM 
	yellow_taxi_trips AS t
WHERE
	CAST(tpep_pickup_datetime AS DATE) = '2021-01-15'
GROUP BY
	CAST(tpep_pickup_datetime AS DATE)
;