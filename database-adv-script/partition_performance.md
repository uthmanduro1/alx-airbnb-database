# Booking Table Partitioning Report

## Objective

To improve query performance on a large `Booking` table by implementing partitioning based on the `start_date` column.

## Approach

We used **RANGE partitioning** on the `YEAR(start_date)` to divide the table into yearly segments, allowing MySQL to optimize queries targeting specific date ranges.

### SQL Implementation

See the `partitioning.sql` file for the SQL used to define the partitioned table.
