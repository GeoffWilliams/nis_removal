#!/bin/bash
# Install ypbind packages (linux) so we can verify removal
puppet resource package 'ypbind' ensure=present
puppet resource package 'ypserv' ensure=present
