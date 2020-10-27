#!/usr/bin/python
#
# By tim.durham@entisys360.com
# v201025.1134 (Dev -> non-functional)
#
# This script expects the following:
# parameter "s"
# This parameter will contain a JSON string of all of the parameter values submitted from the ARM Template.
# When this script runs, it simply takes the JSON splat string of vars,
# Converts it into a yaml string, and save the contents to a .yml file.
#
# This script should live in: /tmp/armsplatparse.py
# and generates the var file: /opt/ansible/armsplatvars.yml
#

import sys
import json
import yaml


# Pull in Arguments
# Validate length
print('Number of arguments:', len(sys.argv), 'arguments.')

# Print Arguments
print('Argument List:', str(sys.argv))


# Assign Argument to string
# String to Object
# Object to YAML


# Output YAML to file



