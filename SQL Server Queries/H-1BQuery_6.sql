-- 6 Top 10 employers who applied through agent have visa status certified withdrawn
SELECT TOP 10 Ed.Employer_Name, COUNT(*) AS count 
FROM Employer_Details Ed
INNER JOIN Employee_Details Empd ON Ed.Employer_Id = Empd.Employer_Id
INNER JOIN Agent_Details Ad ON Empd.Employee_Id = Ad.Employee_Id
INNER JOIN Case_Details Cd ON Empd.Employee_Id = Cd.Employee_Id
WHERE Cd.Case_Status IN ('Certified - Withdrawn', 'CERTIFIED-WITHDRAWN') AND Cd.Visa_Class = 'H-1B'
GROUP BY Ed.Employer_Name
ORDER BY count DESC;