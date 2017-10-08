#!/bin/bash

set -e

test::check_syntax() {
  ansible-playbook playbook.yml -i 'localhost' -e '{"install_python3": "true", "install_python2": "true", "pip3_to_install": ["awscli", "mypy"], "pip2_to_install": ["pipenv"], "pip3_to_uninstall": [], "pip2_to_uninstall": []}' --syntax-check
}

test::run_ansible() {
  ansible-playbook playbook.yml -i 'localhost' -e '{"install_python3": "true", "install_python2": "true", "pip3_to_install": ["awscli", "mypy"], "pip2_to_install": ["pipenv"], "pip3_to_uninstall": [], "pip2_to_uninstall": []}'
}

test::assert_output() {
  for program_file in python python3 pipenv mypy; do
    if ! which $program_file >/dev/null; then
      echo "$program_file is not installed"
      exit 1
    fi
  done
}

test::check_syntax
test::run_ansible
test::assert_output
