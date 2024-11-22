SELECT *
FROM dealerships AS d
	INNER JOIN inventory AS i ON d.DealershipID = i.DealershipID
		INNER JOIN vehicles AS v ON i.VIN = v.VIN
WHERE v.VIN = '1G1ZC5ST2GF101978';