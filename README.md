# pup-python

[sheepdoge](https://github.com/mattjmcnaughton/sheepdoge) for managing python
installation.

We only install Python3.

This pup also manages installing Pips. It supports both installing pips globally
into the user-space and into a specified virtual environment.

## Variables

- `global_pip_to_install`: Global pips to install.
- `global_pip_to_uninstall`: Global pips to uninstall.
- `virtualenv_path`: Path in which to create a virtualenv.
- `virtualenv_pip_to_install`: Virtualenv pips to install.
- `virtualenv_pip_to_uninstall`: Virtualenv pips to uninstall.
- `dotfile`: Path to the dotfile (necessary for making sure pip binaries are
  accessible).

## Requirements

If you do not already have the desired python/pip version installed, you will
need either `homebrew` or `python-apt` (depending on your OS).

We also assume that you have the `virtualenv` executable available (however you
decide to install it).
