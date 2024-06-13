<h1 align="center">Sports Data Analysis and Data Warehousing Project</h1>

###

<h2 align="left">Introduction</h2>

###

<p align="left">This repository contains a comprehensive project focused on the analysis, transformation, and warehousing of sports data. It includes various IPython notebook files (.ipynb), SQL scripts, and dataset files. The project addresses multiple problem statements, each targeting specific data processing and analytical tasks using Python, SQL, and various data visualization tools.</p>

###

<h2 align="left">Dataset Files</h2>

###

<p align="left">Sports dataset.csv, cleaned_sports_dataset.csv: The primary dataset used throughout the project, containing various features related to player performance, health, and training.<br>player_details.csv: Contains details about individual players such as their age, height, weight, and position.<br>player_performance.csv: Contains performance metrics of players like goals, assists, and cards received.<br>health.csv: Contains health-related metrics of players such as fatigue and injury history.<br>training.csv: Contains training-related metrics such as training hours and effective training.</p>

###

<h1 align="center">Problem Statements</h1>

###

<h2 align="center">Problem Statement 1: Data Cleaning and Imputation</h2>

###

<h3 align="left">Description:</h3>

###

<p align="left">dentify and handle missing values using advanced imputation techniques.<br>Correct anomalies by identifying outliers using statistical methods and domain knowledge.<br>Standardize data formats and ensure consistency across the dataset.</p>

###

<h3 align="left">Approach:</h3>

###

<p align="left">Used KNN Imputer for missing value imputation.<br>Applied z-score to identify and remove outliers.<br>Standardized and validated the dataset to ensure consistency.</p>

###

<h2 align="center">Problem Statement 2: Player Position Analysis</h2>

###

<h3 align="left">Description:</h3>

###

<p align="left">Analyze player positions to identify the highest and lowest number of players.<br>Perform statistical analysis to determine if the distribution of players across positions is significantly different from a uniform distribution.</p>

###

<h3 align="left">Approach:</h3>

###

<p align="left">Performed chi-square tests to validate the findings.<br>Created visualizations to display the distribution of players by position.</p>

###

<h2 align="center">Problem Statement 3: Data Ingestion Pipeline</h2>

###

<h3 align="left">Description:</h3>

###

<p align="left">Design and implement a data ingestion pipeline that supports incremental data loading.<br>Optimize storage using data partitioning and indexing strategies.<br>Implement logging and monitoring to track performance and reliability.</p>

###

<h3 align="left">Approach:</h3>

###

<p align="left">Incremental Loading: Implemented Python scripts to handle incremental data loading into a SQLite database. The pipeline ensures that only new or updated records are loaded, avoiding redundancy.<br>Optimization: Used partitioning and indexing to improve storage and query performance.<br>Logging and Monitoring: Added logging to track the data ingestion process, including error handling and performance metrics.</p>

###

<h2 align="center">Problem Statement 4: Pass Completion Rate and Assists Analysis</h2>

###

<h3 align="left">Description:</h3>

###

<p align="left">Analyze the relationship between pass completion rate and assists.<br>Identify outliers using advanced outlier detection methods.<br>Perform regression analysis and evaluate the model.</p>

###

<h3 align="left">Approach:</h3>

###

<p align="left">Used Isolation Forest for outlier detection.<br>Applied linear regression and cross-validation for model evaluation.</p>

###

<h2 align="center">Problem Statement 5: Feature Engineering and Optimization</h2>

###

<h3 align="left">Description:</h3>

###

<p align="left">Perform complex transformations on the dataset, including feature engineering.<br>Implement data normalization and dimensionality reduction.<br>Use machine learning techniques for feature selection.</p>

###

<h3 align="left">Approach:</h3>

###

<p align="left">Created new features such as GoalsPerGame, AssistsPerGame, and CardsPerGame.<br>Applied PCA for dimensionality reduction.<br>Normalized the data using MinMaxScaler.</p>

###

<h2 align="center">Problem Statement 6: Data Warehouse Schema Design</h2>

###

<h3 align="left">Description:</h3>

###

<p align="left">Design and implement a data warehouse schema using advanced SQL features like window functions and CTEs.<br>Store the transformed data efficiently and ensure it supports complex analytical queries.<br>Implement data security and access control mechanisms.</p>

###

<h3 align="left">Approach:</h3>

###

<p align="left">Schema Design: Created dimension and fact tables for storing detailed and aggregated data.<br>Advanced SQL Features: Used CTEs and window functions for complex queries.<br>Optimization: Implemented indexing, partitioning, and materialized views for performance optimization.</p>

###

<h2 align="center">Problem Statement 7: Team and Player Performance Analysis</h2>

###

<h3 align="left">Description:</h3>

###

<p align="left">Identify the team with the highest number of goals.<br>Perform a time series analysis to understand trends in goal scoring over the season.<br>Analyze the top goal scorer's performance metrics over time.</p>

###

<h3 align="left">Approach:</h3>

###

<p align="left">Created various visualizations including horizontal bar plots and stacked bar charts.<br>Conducted time series analysis to identify trends and patterns.</p>

###

<h2 align="center">Problem Statement 8: Interactive Dashboard Creation</h2>

###

<h3 align="left">Description:</h3>

###

<p align="left">Create an interactive dashboard using Pygwalker to explore and visualize the dataset dynamically.</p>

###

<h3 align="left">Approach:</h3>

###

<p align="left">Utilized Pygwalker to generate interactive visualizations and dashboards for comprehensive data exploration.</p>

###

<h1 align="left">Usage</h1>

###

<h3 align="left">1. Clone the repository</h3>

###

<p align="left">git clone https://github.com/yourusername/sports-data-analysis.git</p>

###

<h3 align="left">2. Navigate to the repository directory</h3>

###

<p align="left">cd sports-data-analysis</p>

###

<h3 align="left">3. Install the required Python packages</h3>

###

<p align="left">4. Run the Jupyter notebooks</p>

###

<h2 align="left">License</h2>

###

<p align="left">This project is licensed under the MIT License</p>

###

<h2 align="left">Acknowledgments</h2>

###

<p align="left">Thanks to the contributors and the open-source community for providing tools and resources to make this project possible.</p>

###
