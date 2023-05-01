-- Count the number of H1B visa cases filed by each employee's work city in descending order:
SELECT Eod.Worksite_City, COUNT(*) AS Num_Cases
FROM Case_Details cd, Employee_Details Empd, Employee_Office_Details Eod
WHERE cd.Employee_Id = Empd.Employee_Id AND Empd.Employee_Id = Eod.Employee_Id AND cd.Visa_Class = 'H-1B'
GROUP BY Eod.Worksite_City
ORDER BY Num_Cases DESC;