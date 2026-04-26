-- Query 4: Boston Qualifying Analysis
-- Joins results against BQ Standards table to calculate what percentage
-- of runners in each age/gender bracket achieve a Boston Qualifying time

SELECT
    CASE
        WHEN b.Age < 35 THEN 'Under 35'
        WHEN b.Age BETWEEN 35 AND 39 THEN '35-39'
        WHEN b.Age BETWEEN 40 AND 44 THEN '40-44'
        WHEN b.Age BETWEEN 45 AND 49 THEN '45-49'
        WHEN b.Age BETWEEN 50 AND 54 THEN '50-54'
        WHEN b.Age BETWEEN 55 AND 59 THEN '55-59'
        WHEN b.Age BETWEEN 60 AND 64 THEN '60-64'
        WHEN b.Age BETWEEN 65 AND 69 THEN '65-69'
        WHEN b.Age BETWEEN 70 AND 74 THEN '70-74'
        WHEN b.Age BETWEEN 75 AND 79 THEN '75-79'
        ELSE '80+'
    END AS Age_Bracket,
    b.Gender,
    COUNT(*) AS total_runners,
    SUM(CASE WHEN b.Finish <= s.Standard THEN 1 ELSE 0 END) AS bq_qualifiers,
    ROUND(100.0 * SUM(CASE WHEN b.Finish <= s.Standard THEN 1 ELSE 0 END) / COUNT(*), 2) AS bq_qualify_pct
FROM boston_results_clean b
JOIN bq_standards s
    ON b.Gender = s.Gender
    AND CASE
        WHEN b.Age < 35 THEN 'Under 35'
        WHEN b.Age BETWEEN 35 AND 39 THEN '35-39'
        WHEN b.Age BETWEEN 40 AND 44 THEN '40-44'
        WHEN b.Age BETWEEN 45 AND 49 THEN '45-49'
        WHEN b.Age BETWEEN 50 AND 54 THEN '50-54'
        WHEN b.Age BETWEEN 55 AND 59 THEN '55-59'
        WHEN b.Age BETWEEN 60 AND 64 THEN '60-64'
        WHEN b.Age BETWEEN 65 AND 69 THEN '65-69'
        WHEN b.Age BETWEEN 70 AND 74 THEN '70-74'
        WHEN b.Age BETWEEN 75 AND 79 THEN '75-79'
        ELSE '80+'
    END = s."Age Bracket"
WHERE b.Gender IN ('M', 'F')
GROUP BY Age_Bracket, b.Gender
ORDER BY b.Gender, Age_Bracket;
