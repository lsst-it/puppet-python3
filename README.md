
# python3

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with python3](#setup)
    * [What python3 affects](#what-python3-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with python3](#beginning-with-python3)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)

## Description

The LSST Python3 module installs and configures a base working Python3 that doesn't interfere with older Python installed by the OS (e.g. RHEL/CentOS 7's default Python 2.7). This module installs Python 3.6 from the EPEL YUM repository.

## Setup

### What python3 affects

Python 3 binaries are accessible via the following paths:
* /usr/bin/python3
* /usr/bin/python36
* /usr/bin/pip
* /usr/bin/pip3

A base set of Python packages are installed via both YUM and PIP, but can also be expanded through hiera data.

### Setup Requirements

This module requires the EPEL YUM repository to be configured and enabled. This is not currently enforced by the module.

This module requires the following puppet modules to be installed:

* https://forge.puppet.com/puppetlabs/stdlib

### Beginning with python3

## Usage

To use load Python3, declare this class in your manifest with `include python3`.

## Reference

The following parameters let you extend Python3 options beyond the default:

  * `python3:old_files` - Array of old files that need to be removed from any previous Python installations
  * `python3:old_packages` - Array of old YUM packages that need to be removed from any previous Python installations
  * `python3:packages` - Array of additional Python3 related YUM packages that should be installed
  * `python3:pip_packages` - Hash of additional Pip3 packages that should be installed
  * `python3:symlinks` - Hash of additional file symlinks that should be created

## Limitations

This Python3 module only supports RHEL/CentOS servers that have the EPEL YUM repositoring installed and enabled.

