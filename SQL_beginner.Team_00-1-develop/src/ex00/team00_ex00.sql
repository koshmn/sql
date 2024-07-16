CREATE TABLE nodes
(point1 VARCHAR,
point2 VARCHAR,
cost NUMERIC);

INSERT INTO nodes VALUES('a', 'b', 10);
INSERT INTO nodes VALUES('b', 'a', 10);

INSERT INTO nodes VALUES('b', 'c', 35);
INSERT INTO nodes VALUES('c', 'b', 35);

INSERT INTO nodes VALUES('c', 'a', 15);
INSERT INTO nodes VALUES('a', 'c', 15);

INSERT INTO nodes VALUES('c', 'd', 30);
INSERT INTO nodes VALUES('d', 'c', 30);


INSERT INTO nodes VALUES('a', 'd', 20);
INSERT INTO nodes VALUES('d', 'a', 20);

INSERT INTO nodes VALUES('b', 'd', 25);
INSERT INTO nodes VALUES('d', 'b', 25);

CREATE VIEW paths AS (
WITH RECURSIVE 
	tmp AS (
		SELECT point1::VARCHAR AS path, point1 AS prev_node , point2 AS next_node, cost, 1 as count
		FROM nodes
		WHERE point1 = 'a'
		UNION 
		SELECT CONCAT(tmp.path, ',', tmp.next_node) AS path,
			nodes.point1, nodes.point2, nodes.cost + tmp.cost, count+1
			FROM tmp JOIN nodes
			ON POSITION(tmp.next_node IN path) = 0 AND tmp.next_node = nodes.point1
		   ),
	result AS (
		SELECT cost AS total_cost, CONCAT('{', path, ',', next_node, '}') AS tour
		FROM tmp
		WHERE tmp.count = 4 AND next_node = 'a'
			  )
    SELECT * FROM result
);
SELECT * FROM paths
WHERE total_cost = (
	SELECT MIN(total_cost)
	FROM paths
                   ) 
ORDER BY total_cost, tour;

