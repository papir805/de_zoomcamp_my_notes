SELECT
	CAST(tpep_dropoff_datetime AS DATE) AS dropoff_date,
	"DOLocationID",
	COUNT(*) AS cnt,
	MAX(total_amount) AS max_amount,
	MAX(passenger_count) AS max_passengers
FROM 
	yellow_taxi_trips AS t
GROUP BY 
	CAST(tpep_dropoff_datetime AS DATE),
	"DOLocationID"
ORDER BY
	dropoff_date ASC,
	"DOLocationID" ASC;