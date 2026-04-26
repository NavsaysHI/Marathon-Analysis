# Marathon Running Performance Analysis

## Project Overview

Analysis of **972,586 marathon race results** across 63 races from the Boston Marathon Qualifiers dataset (2022–2024), exploring runner performance patterns by age, gender, and Boston Qualifying rates. Built as a 4-page interactive Power BI dashboard to demonstrate data cleaning, SQL analysis, and data-driven decision-making in a sport performance context.

## Key Findings

- **Peak performance age is 25–35**, with the 35–39 age bracket recording the fastest average finish times across both genders
- The **gender performance gap is approximately 29 minutes** on average, remaining consistent across all age groups
- **Only 12.19% of marathon runners achieve a Boston Qualifying time**, with the 65–69 age bracket having the highest qualifying rate (~20%) due to more relaxed standards and a self-selected competitive field
- The **Under 35 bracket has the largest participation** but one of the lowest BQ qualifying rates (~9–10%), reflecting the high volume of first-time and casual runners
- **Boston Marathon has the highest BQ qualifying rate (48.92%)** among all races — expected since runners must qualify to enter — while fast flat courses like Rotterdam, Carmel, and Jack and Jill Downhill Marathon also produce high qualifying rates
- The **40–44 age group is the most popular** among experienced runners, combining high participation with competitive finish times

## Dataset

| Source | Records | Description |
|--------|---------|-------------|
| Boston Marathon Qualifiers Results | 1,760,979 (raw) → 972,586 (clean) | Individual race results from 762 qualifying marathons (2022–2024) |
| Boston Marathon BQ Standards | 22 | Qualifying time standards by gender and age bracket |
| Boston Marathon Races | 762 | Race metadata including date, city, state, and finisher count |

**Data source:** [Kaggle – Boston Marathon Qualifiers Dataset](https://www.kaggle.com/datasets/runningwithrock/boston-marathon-qualifiers-dataset)

## Data Cleaning

The raw dataset of 1,760,979 records was cleaned in SQL with the following rules:

- Removed rows where Finish = 0 (DNF / no recorded time)
- Removed rows where Age = 0 (missing data — 58,247 records)
- Filtered to Age 14–90 (removed unreliable data including Age = 123)
- Dropped Zip, City, and State columns (65–97% blank, not required for analysis)
- Filtered to M and F genders for primary analysis (NB, U, X categories totalled 778 records combined)

**Note:** The raw dataset exceeded Excel's 1,048,576 row limit, reinforcing the need for SQL-based data processing.

## Tools Used

| Tool | Purpose |
|------|---------|
| **Excel** | Initial data exploration, identifying blanks, outliers, and data quality issues |
| **SQL (SQLite)** | Data cleaning, aggregation, multi-table joins against BQ Standards, and analysis queries |
| **Power BI** | Interactive 4-page dashboard with slicers, DAX calculated columns, conditional formatting, and matrix visuals |

## SQL Queries

1. **Data Cleaning** — Created cleaned table filtering invalid ages and zero finish times
2. **Gender Summary** — Runner counts and average finish times by gender
3. **Age vs Performance** — Average finish time by individual age and gender
4. **Boston Qualifying Analysis** — Joined results against BQ Standards to calculate qualifying rates by age bracket and gender
5. **Race Comparison** — Identified fastest and slowest races by average finish time (minimum 100 finishers)
6. **Year-over-Year Trends** — Participation and performance trends from 2022 to 2024
7. **Percentile Summary** — Fastest, average, and slowest times by age bracket and gender
8. **Race Selector** — Calculated BQ qualifying rate per race using multi-table joins, enabling race-by-race comparison for athletes targeting Boston qualification

## Power BI Dashboard

### Page 1: Race Overview
Summary cards (total runners, total races, average finish time, fastest time), gender distribution, average finish time by age group, and year-over-year participation trends. Interactive gender slicer filters all visuals.

### Page 2: Age & Performance Deep Dive
Line chart showing average finish time across every age (14–90) by gender, with supporting bar charts breaking down runner counts and average times by age bracket. Demonstrates the peak performance window and age-related performance decline.

### Page 3: Boston Qualifying Analysis
BQ qualifying rate by age group and gender, total runners vs qualifiers comparison, and headline statistics (12.19% overall qualifying rate, 118K total qualifiers). Highlights which demographics are most competitive relative to their qualifying standards.

### Page 4: Race Selector — Find Your Fastest Marathon
Heat-mapped matrix visual ranking all races by average finish time and BQ qualifying rate, with conditional formatting (green = fast course / high qualifying rate, red = slow / low rate). Year slicer enables filtering by race year. Designed as a practical decision-making tool for runners choosing which marathon to enter for the best chance of qualifying for Boston.

## Project Structure

```
Marathon-Analysis/
├── README.md
├── data/
│   ├── Boston_Marathon_Results.csv          # Raw results (1.76M rows)
│   ├── Boston_Marathon_Races.csv            # Race metadata
│   └── Boston_Marathon_-_BQStandards.csv    # Qualifying standards
├── sql/
│   ├── query1_create_clean_table.sql
│   ├── query2_gender_summary.sql
│   ├── query3_age_performance.sql
│   ├── query4_bq_qualifying.sql
│   ├── query5_race_comparison.sql
│   ├── query6_year_trends.sql
│   ├── query7_percentile_summary.sql
│   └── query8_race_selector.sql
├── query_results/
│   ├── query2_gender_summary.csv
│   ├── query3_age_performance.csv
│   ├── query4_bq_qualifying.csv
│   ├── query5_race_comparison.csv
│   ├── query6_year_trends.csv
│   ├── query7_percentile_summary.csv
│   └── query8_race_selector.csv
├── marathon.db                              # SQLite database
└── Marathon_Analysis.pbix                   # Power BI dashboard
```

## Personal Context

As an active runner and HYROX competitor, this project combines my interest in endurance sport with data analytics. The Race Selector page in particular mirrors the kind of athlete performance work done by high-performance sport organisations — identifying performance patterns, benchmarking against qualifying standards, and using data to inform training and race strategy decisions. The heat-mapped matrix transforms raw data into an actionable tool that helps a runner choose their next race based on evidence rather than guesswork.

## Author

**Navdeep Rao**
- LinkedIn: [linkedin.com/in/navdeep-rao-58504311a](https://linkedin.com/in/navdeep-rao-58504311a)
- GitHub: [github.com/NavsaysHI](https://github.com/NavsaysHI)
