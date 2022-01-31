SELECT
	--CAST(t.tpep_pickup_datetime AS DATE) AS pickup_date,
	--t."PULocationID",
	--zpu."Zone",
	--zpu."LocationID",
	--t."DOLocationID",
	zdo."Zone",
	--zdo."LocationID",
	COUNT(*) as cnt
FROM yellow_taxi_trips AS t
INNER JOIN zones AS zpu
	ON t."PULocationID" = zpu."LocationID"
INNER JOIN zones AS zdo
	ON t."DOLocationID" = zdo."LocationID"
WHERE
	zpu."Zone" = 'Central Park' AND
	CAST(t.tpep_pickup_datetime AS DATE) = '2021-01-14'
GROUP BY
	--t."DOLocationID"
	zdo."Zone"
ORDER BY
	COUNT(*) DESC