# dbt_red_sox

A dbt (data build tool) project for modeling and analyzing Boston Red Sox baseball data.

## Project Structure

- `models/`: dbt models for transforming raw data
- `seeds/`: CSV files with seed data
- `macros/`: Custom dbt macros
- `tests/`: Data quality and integrity tests

## Getting Started

1. **Install dbt**  
    ```bash
    pip install dbt-core dbt-postgres
    ```

2. **Clone the repository**  
    ```bash
    git clone https://github.com/yourusername/dbt_red_sox.git
    cd dbt_red_sox
    ```

3. **Configure your profile**  
    Edit `~/.dbt/profiles.yml` with your database credentials.

4. **Run dbt**  
    ```bash
    dbt deps
    dbt seed
    dbt run
    dbt test
    ```

## Contributing

Pull requests are welcome. For major changes, please open an issue first.

## License

[MIT](LICENSE)