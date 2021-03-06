SELECT edf.`Value` AS TestValue, edf.`ID` AS `IdentityField`, computers.computerid, acd.NoAlerts, acd.UpTimeStart, acd.UpTimeEnd, computers.Name AS ComputerName, CONVERT(CONCAT(clients.name,' ',locations.name) USING utf8) AS Location 
FROM (computers LEFT JOIN Locations ON Locations.LocationID=computers.Locationid) 
JOIN AgentComputerData AS acd ON Computers.ComputerID=acd.ComputerID 
LEFT JOIN Clients ON Clients.ClientID=Computers.clientid JOIN extrafielddata AS edf ON Computers.ComputerID=edf.ID 
WHERE (edf.ExtraFieldID = 530 AND edf.Value LIKE "%True%")
