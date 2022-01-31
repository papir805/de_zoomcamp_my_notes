SELECT 
	tpep_pickup_datetime,
	tpep_dropoff_datetime,
	total_amount,
	"PULocationID",
	"DOLocationID"
FROM yellow_taxi_trips AS t
WHERE t."DOLocationID" NOT IN (SELECT z."LocationID" FROM zones AS z)
LIMIT 100;