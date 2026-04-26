-- Query 6: Year-over-Year Trends
-- Shows participation and performance changes from 2022 to 2024

SELECT
    Year,
    Gender,
    COUNT(*) AS total_runners,
    ROUND(AVG(Finish)) AS avg_finish_secs,
    MIN(Finish) AS fastest_secs
FROM boston_results_clean
WHERE Gender IN ('M', 'F')
GROUP BY Year, Gender
ORDER BY Gender, Year;
