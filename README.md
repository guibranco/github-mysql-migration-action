[![GitHub repo](https://img.shields.io/badge/GitHub-guibranco%2Fgithub--mysql--migration--action-green.svg?style=plastic&logo=github)](https://github.com/guibranco/github-mysql-migration-action "shields.io")
[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/guibranco/github-mysql-migration-action?color=green&label=Code%20size&style=plastic&logo=github)](https://github.com/guibranco/github-mysql-migration-action "shields.io")
[![GitHub last commit](https://img.shields.io/github/last-commit/guibranco/github-mysql-migration-action?color=green&logo=github&style=plastic&label=Last%20commit)](https://github.com/guibranco/github-mysql-migration-action "shields.io")
[![GitHub license](https://img.shields.io/github/license/guibranco/github-mysql-migration-action?color=green&logo=github&style=plastic&label=License)](https://github.com/guibranco/github-mysql-migration-action "shields.io")

# GitHub MySQL migration action

🧰🎲 A GitHub action to manage MariaDB/MySQL versioned migrations.

## Usage

* `OPERATION` (required)
The operation to be executed (one of: `dry-run`, `migrate`, `check`, `integrity`)
* `MYSQL_HOST` (required)
The MariaDB/MySQL host address (domain or IPv4 address).
* `MYSQL_USER` (required)  
The username to connect in the MySQL/MariaDB host.
* `MYSQL_DATABASE` (required)
The database name.
* `INTEGRITY_COMMANDS_FILE` (optional)
When the `OPERATION` is `integrity`, this parameter receives the file with a list (one per line) of commands to run and validate the presence of data in the database.

### Outputs

None.

## Example

```yml

name: "test"
on:
  pull_request:
  push:
    branches:
      - main

  jobs:
    test:
      runs-on: ubuntu-latest
      steps:
      
      - uses: actions/checkout@v4
  
      - name: Run the action
        uses: guibranco/github-mysql-migration-action@latest
        env:
          MYSQL_PWD: ${{ secrets.MYSQL_PWD }} # Pass the password as an environment variable to keep it secret.
        with:
          OPERATION: migrate
          MYSQL_HOST: 127.0.0.1
          MYSQL_USER: test
          MYSQL_DATAABSE: test          
```
