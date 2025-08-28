WITH raw_data AS (
    SELECT
        *
    FROM
        read_csv_auto('{{ var('data_path', 'data/red_sox_players.csv') }}', all_varchar = TRUE)
),
cleaned_data AS (
    SELECT
        ROW_NUMBER() over ( ORDER BY season, NAME ) AS player_id,
        CAST( season AS INTEGER ) AS season,
        UPPER(name) AS name,
        CAST(age AS INTEGER) AS age,
        flag AS flag,
        UPPER(batting) AS bats,
        UPPER(defense) AS throws,
        ht AS height,
        CAST(wt AS INTEGER) AS weight,
        CAST(dob AS DATE) AS dob_date,
        yrs AS career_stage,
        CAST(gp AS INTEGER) AS games_played,
        CAST(gs AS INTEGER) AS games_started,
        CASE 
            WHEN war = '-' then NULL 
            ELSE CAST(war AS FLOAT) 
        END AS war,
        CASE
            WHEN LOWER("all-star") = 'yes' THEN 'Yes'
            WHEN LOWER("all-star") = 'no' THEN 'No'
            ELSE ''
        END AS all_star,
        CASE
            WHEN LOWER(hof) = 'yes' THEN 'Yes'
            WHEN LOWER(hof) = 'no' THEN 'No'
            ELSE ''
        END AS hof_bool
    FROM
        raw_data
)
SELECT
    player_id,
    season,
    name,
    age,
    flag,
    bats,
    throws,
    height,
    weight,
    dob_date as dob,
    career_stage,
    games_played,
    games_started,
    war,
    all_star,
    hof_bool as hof
FROM
    cleaned_data