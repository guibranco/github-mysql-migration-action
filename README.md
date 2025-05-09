# GitHub database migration action

[![GitHub repo](https://img.shields.io/badge/GitHub-guibranco%2Fgithub--database--migration--action-green.svg?style=plastic&logo=github)](https://github.com/guibranco/github-database-migration-action "shields.io")
[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/guibranco/github-database-migration-action?color=green&label=Code%20size&style=plastic&logo=github)](https://github.com/guibranco/github-database-migration-action "shields.io")
[![GitHub last commit](https://img.shields.io/github/last-commit/guibranco/github-database-migration-action?color=green&logo=github&style=plastic&label=Last%20commit)](https://github.com/guibranco/github-database-migration-action "shields.io")
[![GitHub license](https://img.shields.io/github/license/guibranco/github-database-migration-action?color=green&logo=github&style=plastic&label=License)](https://github.com/guibranco/github-database-migration-action "shields.io")

![CI](https://github.com/guibranco/github-database-migration-action/actions/workflows/ci.yml/badge.svg)
[![wakatime](https://wakatime.com/badge/github/guibranco/github-database-migration-action.svg)](https://wakatime.com/badge/github/guibranco/github-database-migration-action)

🎲 :octocat: A GitHub Action to manage versioned database migrations across multiple database drivers.

## Usage

### Parameters

* `OPERATION` (required)
The operation to be executed (one of: `dry-run`, `migrate`, `check`, or `integrity`)
* `DRIVER` (required)
The driver to use (one of: `mysql`, `mariadb`, `postgresql`, `mssql` or `oracle11g`)
* `HOST` (required)
The database (MariaDB/MySQL) host address (domain or IPv4 address).
* `USER` (required)
The username to connect to the database host.
* `DATABASE` (required)
The database name.
* `INTEGRITY_COMMANDS_FILE` (optional)
When the `OPERATION` is `integrity`, this parameter receives the file with a list (one per line) of commands to run and validate the presence of data in the database.

### Environment variables

* `DATABASE_PWD` (optional)
The password to connect to the database (MySQL/MariaDB) host. This needs to be set as an environment variable to keep it safe.

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
        uses: guibranco/github-database-migration-action@latest
        env:
          DATABASE_PWD: ${{ secrets.DATABASE_PWD }} # Pass the password as an environment variable to keep it secret.
        with:
          OPERATION: migrate
          DRIVER: mysql
          HOST: 127.0.0.1
          USER: test
          DATAABSE: test          
```
