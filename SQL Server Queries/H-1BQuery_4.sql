-- Retrieve the top 5 job titles with the highest number of approved H-1B visas in California.

SELECT TOP 5 ed.Employer_Name, empd.Job_Title, COUNT(*) AS Num_Approved_H1Bs
FROM Case_Details cd
JOIN Employee_Details empd ON cd.Employee_Id = empd.Employee_Id
JOIN Employer_Details ed ON empd.Employer_Id = ed.Employer_Id
JOIN Employee_Office_Details eod ON empd.Employee_Id = eod.Employee_Id
WHERE cd.Visa_Class = 'H-1B' AND eod.Worksite_State = 'CA' 
GROUP BY ed.Employer_Name, empd.Job_Title
ORDER BY Num_Approved_H1Bs DESC;