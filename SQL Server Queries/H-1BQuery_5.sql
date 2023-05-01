
--5 compare the average prevailing wage for each job title with the average current wage 
-- and select the top 10 records having a significant difference where Visa class is H-1B:
SELECT TOP 10
    ed.Job_Title,
    AVG(ewd.PREVAILING_WAGE) AS Average_Prevailing_Wage,
    ABS(AVG(ewd.PREVAILING_WAGE) - AVG(ewd.WAGE_RATE_OF_PAY_FROM)) AS Wage_Difference
FROM 
    Employee_Details ed
    INNER JOIN Employee_Wage_Details ewd ON ed.Employee_Id = ewd.Employee_Id
    INNER JOIN Case_Details Cd ON Cd.Employee_Id = ed.Employee_Id
WHERE 
    Cd.Visa_Class = 'H-1B'
GROUP BY 
    ed.Job_Title
HAVING 
    ABS(AVG(ewd.PREVAILING_WAGE) - AVG(ewd.WAGE_RATE_OF_PAY_FROM)) > 10000
ORDER BY 
    Wage_Difference DESC