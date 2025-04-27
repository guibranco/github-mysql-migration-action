# Contributing to This Repository

## Local Development with @github/local-action

This repository includes the `@github/local-action` utility to facilitate local development and debugging of GitHub Actions.

### Prerequisites

Ensure you have Node.js and npm installed on your machine.

### Installation

Run `npm install` to install all necessary dependencies.

### Usage

Run `npm run local` to execute the action locally using `@github/local-action`.

### Debugging Locally

If you encounter issues while running the action locally, ensure that your environment variables (such as MYSQL_PWD) are properly set. You can use a .env file or export variables in your shell before running `npm run local`. Additionally, verify that your local database is configured and accessible according to the parameters defined in the action configuration.

