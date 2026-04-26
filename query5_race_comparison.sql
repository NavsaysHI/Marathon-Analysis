-- Query 5: Race Comparison
-- Identifies fastest and slowest races by average finish time
-- Filtered to races with 100+ finishers to avoid small-sample skew

SELECT
    Race,
    Year,
    COUNT(*) AS total_finishers,
    ROUND(AVG(Finish)) AS avg_finish_secs,
    MIN(Finish) AS fastest_secs
FROM boston_results_clean
WHERE Gender IN ('M', 'F')
GROUP BY Race, Year
HAVING COUNT(*) >= 100
ORDER BY avg_finish_secs ASC
LIMIT 20;
