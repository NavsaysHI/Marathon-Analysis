-- Query 3: Age vs Performance
-- Shows how finish times change across every age, split by gender
-- Used to identify peak performance age window

SELECT
    Age,
    Gender,
    COUNT(*) AS total_runners,
    ROUND(AVG(Finish)) AS avg_finish_secs,
    MIN(Finish) AS fastest_secs
FROM boston_results_clean
WHERE Gender IN ('M', 'F')
GROUP BY Age, Gender
ORDER BY Gender, Age;
