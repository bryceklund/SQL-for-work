SELECT b.Company, c.Name AS 'Site', a.`Name`, a.ComputerID AS 'Automate Computer ID', a.Username AS 'Last Logged in User', a.DateAdded, a.ClientID, b.ClientID, a.LocationID, c.LocationID FROM computers a 
LEFT JOIN clients b ON b.ClientID = a.ClientID
JOIN Locations c ON c.LocationID = a.LocationID
WHERE b.ClientID = 706
