# pup-python

[sheepdoge](https://github.com/mattjmcnaughton/sheepdoge) for managing python
installation. It gives you the option of installing python3/python2, and
installing system usable pips.

Note, we do not attempt to manage virtualenvs, preferring to install `pipenv`.
As such, you should only include `pip` packages you want available across your
system.

## Variables

- `install_python3`: Whether we should install `python3/pip3`.
- `install_python2`: Whether we should install `python2/pip2`.
- `pip3_to_install`: Pips to install using `pip3`.
- `pip2_to_install`: Pips to install using `pip2`. Note, we recommend using
  `pip3` if possible.
- `pip3_to_uninstall`: Pips to uninstall using `pip3`.
- `pip2_to_uninstall`: Pips to uninstall using `pip2`.

## Requirements

If you do not already have the desired python/pip version installed, you will
need either `homebrew` or `python-apt` (depending on your OS).
