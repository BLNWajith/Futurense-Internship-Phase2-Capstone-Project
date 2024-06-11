USE football;

CREATE TABLE IF NOT EXISTS player_details (
    PU_ID INT PRIMARY KEY,
    Age INT,
    Height FLOAT,
    Weight FLOAT
);

CREATE TABLE IF NOT EXISTS player_performance (
    PU_ID INT,
    Team VARCHAR(255),
    Season INT,
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
    PRIMARY KEY (PU_ID, Season),
    FOREIGN KEY (PU_ID) REFERENCES player_details(PU_ID)
);

CREATE TABLE IF NOT EXISTS health (
    PU_ID INT,
    Season INT,
    PlayerFatigue FLOAT,
    MatchPressure FLOAT,
    InjuryHistory FLOAT,
    PRIMARY KEY (PU_ID, Season),
    FOREIGN KEY (PU_ID) REFERENCES player_details(PU_ID)
);

CREATE TABLE IF NOT EXISTS training (
    PU_ID INT,
    Season INT,
    TrainingHours FLOAT,
    FatigueInjuryCorrelation FLOAT,
    PressurePerformanceImpact FLOAT,
    EffectiveTraining FLOAT,
    PRIMARY KEY (PU_ID, Season),
    FOREIGN KEY (PU_ID) REFERENCES player_details(PU_ID)
);



-- Modify the SQL schemas to include a last_updated column  
ALTER TABLE player_details ADD COLUMN last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE playe_performance ADD COLUMN last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE health ADD COLUMN last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE training ADD COLUMN last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;



-- Add indexes to frequently queried columns to improve performance.
CREATE INDEX idx_playerdetail_age ON player_details(Age);
CREATE INDEX idx_playerperformance_team ON player_performance(Team);
CREATE INDEX idx_health_puid ON health(PU_ID);
CREATE INDEX idx_training_puid ON training(PU_ID);
 


-- partition the player_performance, Health, and Training tables by the Season column for the years 2019, 2020, 2021, and 2022.
ALTER TABLE player_performance PARTITION BY RANGE (Season) (
    PARTITION p2019 VALUES LESS THAN (2020),
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023)
);

ALTER TABLE health PARTITION BY RANGE (Season) (
    PARTITION p2019 VALUES LESS THAN (2020),
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023)
);

ALTER TABLE training PARTITION BY RANGE (Season) (
    PARTITION p2019 VALUES LESS THAN (2020),
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023)
);
