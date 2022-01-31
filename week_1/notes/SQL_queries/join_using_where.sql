SELECT 
	tpep_pickup_datetime,
	tpep_dropoff_datetime,
	total_amount,
	CONCAT(zpu."Borough", ' / ', zpu."Zone") as "pickup_loc",
	CONCAT(zdo."Borough", ' / ', zdo."Zone") as "dropoff_loc"
FROM
	yellow_taxi_trips AS t,
	zones AS zpu,
	zones AS zdo
WHERE
	t."PULocationID" = zpu."LocationID" AND
	t."DOLocationID" = zdo."LocationID"
LIMIT 100;