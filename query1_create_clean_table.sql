-- Query 1: Create cleaned table
-- Removes invalid finish times (0 = DNF), filters age to realistic range (14-90),
-- and drops unnecessary columns (Zip, City, State were 65-97% blank)

CREATE TABLE boston_results_clean AS
SELECT
    Year,
    Race,
    Name,
    Country,
    Gender,
    Age,
    Finish,
    "Overall Place",
    "Gender Place"
FROM boston_results_raw
WHERE Finish > 0
  AND Age >= 14
  AND Age <= 90;
