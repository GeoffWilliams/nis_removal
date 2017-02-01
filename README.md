[![Build Status](https://travis-ci.org/GeoffWilliams/nis_removal.svg?branch=master)](https://travis-ci.org/GeoffWilliams/nis_removal)
# nis_removal

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with nis_removal](#setup)
    * [What nis_removal affects](#what-nis_removal-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with nis_removal](#beginning-with-nis_removal)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This is a module to remove NIS from nodes (or lock it down to a single subnet).

## Setup

### What nis_removal affects

* Removes NIS packages
* Stops and disables NIS daemons
* Remove NIS users and groups

## Usage

### Remove NIS packages and services
```puppet
include nis_removal
```

### Remove NIS users and groups
```puppet
include nis_removal::delete_nis_users
```
* Removes users beginning with `+`

### Lockdown NIS to only work on a given subnet (AIX only)
```puppet
class { "nis_removal::nis_lockdown":
  allowed_subnet => "255.255.255.0 10.16.132.0",
}
```

## Reference

### Classes
* `nis_removal` - completely remove NIS
* `nis_removal::nis_lockdown` - allow NIS only from specific subnet on AIX

## Limitations
* Supports AIX, Solaris and Linux
* Lockdown to specific subnet only exists on AIX

## Development

PRs accepted :)

## Testing
This module supports testing using [PDQTest](https://github.com/GeoffWilliams/pdqtest).

Test can be executed with:

```
bundle install
bundle exec pdqtest all
```


See `.travis.yml` for a working CI example
