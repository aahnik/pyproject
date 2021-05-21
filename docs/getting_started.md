# Getting started

## Requirements

Have the following installed in your system.
A basic knowledge of the following is expected.

- a bash or zsh shell
- git (scm)
- make (used to automate running long commands)
- python (python 3.9) (the programming language)
- docker (containerization tool)
- poetry (python dependancy management and packaging)
- gh (cli of GitHub , a popular source host)
- Vs code (code editor)

## Setup

1. Create a new repo from this template
2. Clone your repo and move into the project directory
3. For poetry use config `virtualenvs.in-project = true`
4. Run `poetry install`
5. Run `poetry shell` (activate virtual environment)
6. Run `pre-commit install` to install all pre-commit hooks
7. Run `code .` to open in vscode.
