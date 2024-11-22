SELECT *
FROM dealerships AS d
	INNER JOIN inventory AS i ON d.DealershipID = i.DealershipID
		INNER JOIN vehicles AS v ON i.VIN = v.VIN
WHERE Make = 'Ford' AND Model = 'Mustang' AND Color = 'Black';