SELECT computers.computerid AS `Computer ID`, computers.name AS `Computer Name`, software.name AS `Adobe` 
FROM computers 
LEFT JOIN clients ON computers.clientid = clients.clientid 
LEFT JOIN locations ON computers.locationid = locations.locationid 
LEFT JOIN software ON software.computerid = computers.computerid 
WHERE clients.clientid = 733 AND software.name LIKE "%acrobat%"
