SELECT sc.*
FROM sales_contracts AS sc
	INNER JOIN inventory AS i ON sc.VIN = i.VIN
		INNER JOIN dealerships AS d ON i.DealershipID = d.DealershipID
WHERE sc.ContractDate BETWEEN '2024-11-01' AND '2024-11-10';