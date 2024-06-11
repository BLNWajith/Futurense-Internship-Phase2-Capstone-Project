CREATE DATABASE IF NOT EXISTS football_dw;

USE football_dw;

-- Dimension Tables
CREATE TABLE DimPlayer (
    PlayerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Age INT,
    Height FLOAT,
    Weight FLOAT,
    Position VARCHAR(255)
);

CREATE TABLE DimTeam (
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(255)
);

CREATE TABLE DimSeason (
    SeasonID INT PRIMARY KEY,
    Year INT
);

-- Fact Tables
CREATE TABLE FactPerformance (
    PerformanceID INT PRIMARY KEY AUTO_INCREMENT,
    PlayerID INT,
    TeamID INT,
    SeasonID INT,
    Goals INT,
    Assists INT,
    YellowCards INT,
    RedCards INT,
    PassCompletionRate FLOAT,
    DistanceCovered FLOAT,
    Sprints INT,
    ShotsOnTarget INT,
    TacklesWon INT,
    CleanSheets INT,
    FOREIGN KEY (PlayerID) REFERENCES DimPlayer(PlayerID),
    FOREIGN KEY (TeamID) REFERENCES DimTeam(TeamID),
    FOREIGN KEY (SeasonID) REFERENCES DimSeason(SeasonID)
);

CREATE TABLE FactHealth (
    HealthID INT PRIMARY KEY AUTO_INCREMENT,
    PlayerID INT,
    SeasonID INT,
    PlayerFatigue FLOAT,
    MatchPressure FLOAT,
    InjuryHistory FLOAT,
    FOREIGN KEY (PlayerID) REFERENCES DimPlayer(PlayerID),
    FOREIGN KEY (SeasonID) REFERENCES DimSeason(SeasonID)
);

CREATE TABLE FactTraining (
    TrainingID INT PRIMARY KEY AUTO_INCREMENT,
    PlayerID INT,
    SeasonID INT,
    TrainingHours FLOAT,
    FatigueInjuryCorrelation FLOAT,
    PressurePerformanceImpact FLOAT,
    EffectiveTraining FLOAT,
    FOREIGN KEY (PlayerID) REFERENCES DimPlayer(PlayerID),
    FOREIGN KEY (SeasonID) REFERENCES DimSeason(SeasonID)
);



-- Example CTE to get total goals and assists per player per season
WITH PlayerStats AS (
    SELECT
        PlayerID,
        SeasonID,
        SUM(Goals) AS TotalGoals,
        SUM(Assists) AS TotalAssists
    FROM
        FactPerformance
    GROUP BY
        PlayerID, SeasonID
)
SELECT
    p.Name,
    s.Year,
    ps.TotalGoals,
    ps.TotalAssists
FROM
    PlayerStats ps
    JOIN DimPlayer p ON ps.PlayerID = p.PlayerID
    JOIN DimSeason s ON ps.SeasonID = s.SeasonID;

-- Example Window Function to rank players by goals per season
SELECT
    p.Name,
    s.Year,
    fp.Goals,
RANK() OVER (PARTITION BY s.Year ORDER BY fp.Goals DESC)

FROM
    FactPerformance fp
    JOIN DimPlayer p ON fp.PlayerID = p.PlayerID
    JOIN DimSeason s ON fp.SeasonID = s.SeasonID;

-- Add indexes to improve query performance.
CREATE INDEX idx_factperformance_player ON FactPerformance(PlayerID);
CREATE INDEX idx_factperformance_team ON FactPerformance(TeamID);
CREATE INDEX idx_factperformance_season ON FactPerformance(SeasonID);
CREATE INDEX idx_facthealth_player ON FactHealth(PlayerID);
CREATE INDEX idx_facthealth_season ON FactHealth(SeasonID);
CREATE INDEX idx_facttraining_player ON FactTraining(PlayerID);
CREATE INDEX idx_facttraining_season ON FactTraining(SeasonID);


-- Partition large fact tables by season for better performance.
ALTER TABLE FactPerformance PARTITION BY RANGE (SeasonID) (
    PARTITION p2019 VALUES LESS THAN (2020),
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023)
);

ALTER TABLE FactHealth PARTITION BY RANGE (SeasonID) (
    PARTITION p2019 VALUES LESS THAN (2020),
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023)
);

ALTER TABLE FactTraining PARTITION BY RANGE (SeasonID) (
    PARTITION p2019 VALUES LESS THAN (2020),
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023)
);


-- Materialized views can be used to store precomputed query results.
CREATE material VIEW mv_player_season_stats AS
SELECT
    fp.PlayerID,
    fp.SeasonID,
    SUM(fp.Goals) AS TotalGoals,
    SUM(fp.Assists) AS TotalAssists,
    AVG(fp.PassCompletionRate) AS AvgPassCompletionRate,
    AVG(fp.DistanceCovered) AS AvgDistanceCovered
FROM
    FactPerformance fp
GROUP BY
    fp.PlayerID, fp.SeasonID;
