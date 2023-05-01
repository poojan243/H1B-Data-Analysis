-- Top 10 companies who has maximum number of full time employee who got visa approved
SELECT TOP 10 ed.Employer_Name, COUNT(*) AS Num_Cases
FROM Case_Details cd
INNER JOIN Employee_Details empd ON cd.Employee_Id = empd.Employee_Id
INNER JOIN Employer_Details ed ON empd.Employer_Id = ed.Employer_Id
WHERE cd.Visa_Class = 'H-1B' AND empd.Full_Time_Position = 'Y' AND (cd.Case_Status = 'CERTIFIED' OR cd.Case_Status = 'Certified')
GROUP BY ed.Employer_Name
ORDER BY num_cases DESC;