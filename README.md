# Blood Bank Management System (Database Project)

A comprehensive relational database design and optimization project for a Blood Bank Management System built using SQL Server. This project demonstrates the full lifecycle of database development, from structural modeling to advanced business logic implementation, serving as a solid framework for Backend and Database Testing scenarios.

##  Repository Structure
The project is strictly modularized into three core scripts to reflect the development phases:
1. **CreateTable.sql**: Defines the structural database schema and enforces relational integrity constraints, including Primary Keys, Foreign Keys, Unique constraints, and Nullability checks.
2. **Insert.sql**: Contains realistic mock data injection used to populate the tables for functional verification and testing.
3. **Backend_Logic.sql**: Implements core business requirements using advanced querying, views, and automated stored procedures.

##  Technical Milestones

### 1. Database Schema & Mapping
- Developed a structured Relational Schema based on logical mapping to represent core entities such as Donors, Blood Stock, Requests, and Hospitals.
- Enforced strict referential integrity constraints to eliminate data redundancy and ensure consistent relationships across linked tables.

### 2. Advanced Querying & Data Aggregation
- Leveraged multi-table INNER, LEFT, RIGHT, and FULL OUTER JOINs to retrieve consolidated logs.
- Implemented GROUP BY and HAVING clauses to generate critical metrics, such as evaluating minimum stock thresholds and identifying high-priority hospital requests.
- Utilized subqueries with ANY and ALL operators for advanced data filtering.

### 3. Database Views & Stored Procedures
- Built dynamic Views (e.g., Low_Stock_Alert and Hospital_Order_Summary) to abstract complex business logic and accelerate functional validation.
- Programmed custom Stored Procedures utilizing dynamic input parameters to automate multi-table transactions, such as filtering donors by blood type or executing safe updates on operational records.

##  Testing Perspective
From a Quality Assurance standpoint, this architecture was utilized to practice and validate:
- Boundary Value Testing on database constraints and fields.
- Verification of referential integrity during cascading delete and update operations.
- Execution of precise backend manual assertions against complex database states.
