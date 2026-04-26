-- Query 2: Overall summary by gender
-- Shows runner counts, average finish times, and fastest times per gender

SELECT
    Gender,
    COUNT(*) AS total_runners,
    ROUND(AVG(Finish)) AS avg_finish_secs,
    MIN(Finish) AS fastest_secs,
    ROUND(AVG(Finish) / 3600, 0) || ':' || 
        SUBSTR('0' || ((ROUND(AVG(Finish)) % 3600) / 60), -2) AS avg_finish_time
FROM boston_results_clean
GROUP BY Gender
ORDER BY total_runners DESC;
