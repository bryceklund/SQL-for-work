#gets a nice list of machines/clients/locations for you to work with. append as needed.

SELECT 
	computers.computerid AS `Computer ID`,
	computers.name AS `Computer Name`,
	clients.name AS `Client Name`,
	locations.name AS `Site`,	
	computers.domain AS `Computer Domain`,
	computers.username AS `Computer User`
FROM computers
LEFT JOIN clients ON computers.clientid = clients.clientid
LEFT JOIN locations ON computers.locationid = locations.locationid
