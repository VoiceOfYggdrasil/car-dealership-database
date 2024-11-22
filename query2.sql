SELECT *
FROM vehicles AS v
		INNER JOIN inventory AS i ON v.VIN = i.VIN
					INNER JOIN dealerships AS d ON i.DealershipID = d.DealershipID
		WHERE d.DealershipID = 1;