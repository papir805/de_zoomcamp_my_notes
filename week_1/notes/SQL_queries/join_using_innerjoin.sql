SELECT 
	tpep_pickup_datetime,
	tpep_dropoff_datetime,
	total_amount,
	CONCAT(zpu."Borough", ' / ', zpu."Zone") as "pickup_loc",
	CONCAT(zdo."Borough", ' / ', zdo."Zone") as "dropoff_loc"
FROM
	yellow_taxi_trips AS t 
	INNER JOIN zones AS zpu
	  ON t."PULocationID" = zpu."LocationID"
	INNER JOIN zones AS zdo
	  ON t."DOLocationID" = zdo."LocationID"
LIMIT 100;