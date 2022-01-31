SELECT
	zpu."Zone" AS pickup_zone,
	zdo."Zone" AS dropoff_zone,
	AVG(total_amount) AS average
FROM
	yellow_taxi_trips AS t
	  INNER JOIN zones AS zpu
	    ON t."PULocationID" = zpu."LocationID"
	  INNER JOIN zones AS zdo
	    ON t."DOLocationID" = zdo."LocationID"
GROUP BY
	zpu."Zone",
	zdo."Zone"
ORDER BY
	AVG(total_amount) DESC;