SELECT
	CAST(tpep_pickup_datetime AS DATE) AS pickup_date,
	MAX(tip_amount) AS max_tip
FROM
	yellow_taxi_trips AS t
GROUP BY
	pickup_date
ORDER BY
	max_tip DESC;