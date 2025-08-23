select *
from read_csv_auto('{{ project_root }}/dbt_red_sox/data/red_sox_players.csv', all_varchar=true)

