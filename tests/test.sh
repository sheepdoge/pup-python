#!/bin/bash

set -e

test::check_syntax() {
  ansible-playbook playbook.yml -i 'localhost' -e '{"global_pip_to_install": ["awscli", "mypy"], "virtualenv_pip_to_install": ["pipenv"], "global_pip_to_uninstall": [], "virtualenv_pip_to_uninstall": [], "virtualenv_path": "~/.venv", "dotfile": "~/.bashrc"}' --syntax-check
}

test::run_ansible() {
  ansible-playbook playbook.yml -i 'localhost' -e '{"global_pip_to_install": ["awscli", "mypy"], "virtualenv_pip_to_install": ["pipenv"], "global_pip_to_uninstall": [], "virtualenv_pip_to_uninstall": [], "virtualenv_path": "~/.venv", "dotfile": "~/.bashrc"}'
}

test::assert_output() {
  export PATH=$PATH:~/.local/bin
  source ~/.venv/bin/activate

  for program_file in python aws mypy; do
    if ! which $program_file >/dev/null; then
      echo "$program_file is not installed"
      exit 1
    fi
  done

  for program_file in pipenv; do
    if ! which $program_file >/dev/null; then
      echo "$program_file is not installed"
      exit 1
    fi
  done
}

test::check_syntax
test::run_ansible
test::assert_output
