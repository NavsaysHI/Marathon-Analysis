-- Query 7: Percentile Summary
-- Fastest, average, and slowest times by age bracket and gender
-- Foundation data for percentile analysis in Power BI

SELECT
    Gender,
    CASE
        WHEN Age < 35 THEN 'Under 35'
        WHEN Age BETWEEN 35 AND 39 THEN '35-39'
        WHEN Age BETWEEN 40 AND 44 THEN '40-44'
        WHEN Age BETWEEN 45 AND 49 THEN '45-49'
        WHEN Age BETWEEN 50 AND 54 THEN '50-54'
        WHEN Age BETWEEN 55 AND 59 THEN '55-59'
        WHEN Age BETWEEN 60 AND 64 THEN '60-64'
        WHEN Age BETWEEN 65 AND 69 THEN '65-69'
        ELSE '70+'
    END AS Age_Bracket,
    COUNT(*) AS total_runners,
    MIN(Finish) AS fastest,
    ROUND(AVG(Finish)) AS average,
    MAX(Finish) AS slowest
FROM boston_results_clean
WHERE Gender IN ('M', 'F')
GROUP BY Gender, Age_Bracket
ORDER BY Gender, Age_Bracket;
