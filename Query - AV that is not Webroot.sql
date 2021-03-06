SELECT 
	computers.computerid AS `Computer ID`,
	computers.name AS `Computer Name`,
	virusscanners.name AS `Virus Scanner`,
	clients.name AS `Client Name`,
	locations.name AS `Site`,	
	computers.domain AS `Computer Domain`,
	computers.username AS `Computer User`
FROM computers
LEFT JOIN clients ON computers.clientid = clients.clientid
LEFT JOIN locations ON computers.locationid = locations.locationid
LEFT JOIN virusscanners ON virusscanners.vscanid = computers.virusscanner
WHERE virusscanners.vscanid NOT REGEXP '136|135|245|46'
