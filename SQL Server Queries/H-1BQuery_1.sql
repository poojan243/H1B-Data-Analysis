
SELECT TOP 10 ed.Employer_City, COUNT(*) AS num_cases
FROM Case_Details cd
JOIN Employee_Details empd ON cd.Employee_Id = empd.Employee_Id
JOIN Employer_Details ed ON empd.Employer_Id = ed.Employer_Id
WHERE cd.Visa_Class = 'H-1B'
GROUP BY ed.Employer_City
ORDER BY num_cases DESC;
