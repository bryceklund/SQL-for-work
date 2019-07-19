SELECT DISTINCT
	computers.name AS `Computer Name`,
	clients.name AS `Client Name`,
	locations.name AS `Site`,
	computers.computerid AS `Computer ID`,
	MAX(CASE WHEN software.name LIKE "%datto%" THEN "Yes" ELSE "No" END) AS "Datto Agent Installed"
	#CASE WHEN MAX(CASE WHEN software.name LIKE "%datto%" = 1 THEN 1 ELSE 0 END) = 1 THEN "Yes" ELSE "No" END AS "Datto Agent Installed"
FROM computers
LEFT JOIN clients ON computers.clientid = clients.clientid
LEFT JOIN locations ON computers.locationid = locations.locationid
LEFT JOIN software ON computers.computerid = software.computerid
WHERE computers.os LIKE "%server%" 
GROUP BY computers.computerid
