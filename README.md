<p align="center">
  <a href="https://github.com/guibranco/github-mysql-migration-action">
    <img src="https://github.com/guibranco/github-mysql-migration-action/actions/workflows/ci.yml/badge.svg" alt="CI status">
  </a>
  <a href="https://github.com/guibranco/github-mysql-migration-action">
    <img src="https://github.com/guibranco/github-mysql-migration-action/actions/workflows/linter.yml/badge.svg" alt="Linter status">
  </a>
  <a href="https://wakatime.com/badge/github/guibranco/github-mysql-migration-action">
    <img src="https://wakatime.com/badge/github/guibranco/github-mysql-migration-action.svg" alt="wakatime">
  </a>
</p>

# GitHub MySQL migration action

🧰🎲 A GitHub action to manage MariaDB/MySQL versioned migrations.

## Usage

* `MYSQL_HOST` (required)
The MariaDB/MySQL host address (domain or IPv4 address).
* `MYSQL_USER` (required)  
The username to connect in the MySQL/MariaDB host.
* `MYSQL_DATABASE` (required)
The database name.
* `OPERATION` (required)
The operation to be executed (one of: `dry-run`, `migrate`, `check`, `integrity`)
* `INTEGRITY_COMMANDS_FILE` (optional)
When the `OPERATION` is `integrity`, this parameter receives the file with a list (one per line) of commands to run and validate the presence of data in the database.

### Outputs

None.

## Example

```yml
name: "test"
on: # run on any PRs and main branch changes
  pull_request:
  push:
    branches:
      - main

  jobs:
    test:
      runs-on: ubuntu-latest
      steps:
      
      - uses: actions/checkout@v4
  
      - name: Run the action # You would run your tests before this using the output to set state/desc
        uses: guibranco/github-mysql-migration-action@latest
        env:
          MYSQL_PWD: test
        with:
          MYSQL_HOSTL: 127.0.0.1
          MYSQL_USER: test
          MYSQL_DATAABSE: test
          OPERATION: migrate
```
