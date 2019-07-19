SELECT DISTINCT
	computers.name AS `Computer Name`,
	clients.name AS `Client Name`,
	locations.name AS `Site`,
	computers.computerid AS `Computer ID`,
	MAX(CASE WHEN software.name REGEXP "%storagecraft%|%datto%" THEN "Yes" ELSE "No" END) AS "Datto",
	#MAX(CASE WHEN software.name LIKE "%storagecraft%" THEN "Yes" ELSE "No" END) AS "Storagecraft Agent Installed",
	MAX(CASE WHEN software.name LIKE "%poa cloud%" THEN "Yes" ELSE "No" END) AS "POA Cloud Agent Installed",
	MAX(CASE WHEN (software.name NOT "%datto%" AND software.name NOT "%storagecraft%" AND software.name NOT "%poa cloud%") THEN "Yes" ELSE "No" END) AS "Null"
	#CASE WHEN MAX(CASE WHEN software.name LIKE "%datto%" = 1 THEN 1 ELSE 0 END) = 1 THEN "Yes" ELSE "No" END AS "Datto Agent Installed"
FROM computers
LEFT JOIN clients ON computers.clientid = clients.clientid
LEFT JOIN locations ON computers.locationid = locations.locationid
LEFT JOIN software ON computers.computerid = software.computerid
WHERE computers.os LIKE "%server%" 
GROUP BY computers.computerid
