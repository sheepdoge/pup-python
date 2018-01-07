#!/bin/bash

set -e

test::check_syntax() {
  ansible-playbook playbook.yml -i 'localhost' -e '{"install_python3": "true", "install_python2": "true", "pip3_to_install": ["awscli", "mypy"], "pip2_to_install": ["pipenv"], "pip3_to_uninstall": [], "pip2_to_uninstall": [], "dotfile": "~/.bashrc"}' --syntax-check
}

test::run_ansible() {
  ansible-playbook playbook.yml -i 'localhost' -e '{"install_python3": "true", "install_python2": "true", "pip3_to_install": ["awscli", "pylint", "mypy"], "pip2_to_install": ["pipenv"], "pip3_to_uninstall": ["pylint"], "pip2_to_uninstall": [], "dotfile": "~/.bashrc"}'
}

test::assert_output() {
  # append ~/.local/bin to the path

  export PATH=$PATH:~/.local/bin

  for program_file in python python3 pipenv mypy; do
    if ! which $program_file >/dev/null; then
      echo "$program_file is not installed"
      exit 1
    fi
  done

  for program_file in pylint; do
    if which $program_file >/dev/null; then
      echo "$program_file not installed"
      exit 1
    fi
  done
}

test::check_syntax
test::run_ansible
test::assert_output
