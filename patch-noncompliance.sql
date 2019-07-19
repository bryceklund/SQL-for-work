#SELECT DATE_ADD(curdate(), interval -2 week)

SELECT * FROM 
	(SELECT DISTINCT 
		patchhistory.computerid AS `Computer ID`, 
		computers.name AS `Computer Name`,
		MAX(actiondate) AS `Patch Date`,
		computers.os AS `Operating System`,
		locations.name AS `Site`,
		clients.name AS `Client`,
		`patchingdevicecompliancedata`.`MicrosoftCompliance` AS `Patch Compliance`
	FROM `patchhistory` 
	JOIN computers ON patchhistory.computerid = computers.computerid
	JOIN clients ON computers.clientid = clients.clientid
	JOIN locations ON computers.locationid = locations.locationid
	JOIN `patchingdevicecompliancedata` ON computers.computerid = `patchingdevicecompliancedata`.computerid
	GROUP BY patchhistory.computerid) AS `patches`
WHERE `Patch Date` < DATE_ADD(CURDATE(), INTERVAL -2 WEEK) AND (`Patch Compliance` < 85) AND `Operating System` NOT LIKE '%server%'
