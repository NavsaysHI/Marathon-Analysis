-- Query 8: Race Selector
-- Calculates BQ qualifying rate per race using multi-table joins
-- Enables race-by-race comparison for athletes targeting Boston qualification
-- Used to build the Race Selector heat-mapped matrix in Power BI

SELECT
    r.Race,
    r.Year,
    COUNT(*) AS total_finishers,
    ROUND(AVG(r.Finish)) AS avg_finish_secs,
    ROUND(AVG(r.Finish) / 3600.0, 2) AS avg_finish_hours,
    MIN(r.Finish) AS fastest_secs,
    ROUND(100.0 * SUM(CASE 
        WHEN r.Gender = 'M' AND r.Finish <= s_m.Standard THEN 1
        WHEN r.Gender = 'F' AND r.Finish <= s_f.Standard THEN 1
        ELSE 0 
    END) / COUNT(*), 2) AS bq_qualify_pct
FROM boston_results_clean r
LEFT JOIN bq_standards s_m 
    ON r.Gender = 'M' 
    AND s_m.Gender = 'M'
    AND CASE
        WHEN r.Age < 35 THEN 'Under 35'
        WHEN r.Age BETWEEN 35 AND 39 THEN '35-39'
        WHEN r.Age BETWEEN 40 AND 44 THEN '40-44'
        WHEN r.Age BETWEEN 45 AND 49 THEN '45-49'
        WHEN r.Age BETWEEN 50 AND 54 THEN '50-54'
        WHEN r.Age BETWEEN 55 AND 59 THEN '55-59'
        WHEN r.Age BETWEEN 60 AND 64 THEN '60-64'
        WHEN r.Age BETWEEN 65 AND 69 THEN '65-69'
        WHEN r.Age BETWEEN 70 AND 74 THEN '70-74'
        WHEN r.Age BETWEEN 75 AND 79 THEN '75-79'
        ELSE '80+'
    END = s_m."Age Bracket"
LEFT JOIN bq_standards s_f 
    ON r.Gender = 'F' 
    AND s_f.Gender = 'F'
    AND CASE
        WHEN r.Age < 35 THEN 'Under 35'
        WHEN r.Age BETWEEN 35 AND 39 THEN '35-39'
        WHEN r.Age BETWEEN 40 AND 44 THEN '40-44'
        WHEN r.Age BETWEEN 45 AND 49 THEN '45-49'
        WHEN r.Age BETWEEN 50 AND 54 THEN '50-54'
        WHEN r.Age BETWEEN 55 AND 59 THEN '55-59'
        WHEN r.Age BETWEEN 60 AND 64 THEN '60-64'
        WHEN r.Age BETWEEN 65 AND 69 THEN '65-69'
        WHEN r.Age BETWEEN 70 AND 74 THEN '70-74'
        WHEN r.Age BETWEEN 75 AND 79 THEN '75-79'
        ELSE '80+'
    END = s_f."Age Bracket"
WHERE r.Gender IN ('M', 'F')
GROUP BY r.Race, r.Year
HAVING COUNT(*) >= 100
ORDER BY bq_qualify_pct DESC;
