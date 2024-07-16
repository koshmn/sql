SELECT * FROM paths
WHERE total_cost = (
	SELECT MIN(total_cost)
	FROM paths) 
OR total_cost = (
	SELECT MAX(total_cost)
	FROM paths)
ORDER BY total_cost, tour;
