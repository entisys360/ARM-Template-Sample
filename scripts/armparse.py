#!/usr/bin/python
#
# By tim.durham@entisys360.com
# v201026.1134
#
# This script is designed as a git pre-hook to a commit.
# It will leverage the /source/maindeploy_src.json file
# to build a set of correctly escaped parameters in the
# resulting ARM template output.
# This new output will be saved into the root as
# maindeploy.json

import json


##
# Service Variables
##
sourcepath = '../source/'
sourcefile = 'maindeploy_src.json'

searchstrg = 'VARSPLATSTRING'

outputpath = '../'
outputfile = 'maindeploy.json'

ARMstrg = ''
SplatStrg = ''
Outstrg = ''


##
# Get the content of the source ARM Template
##
with open( sourcepath + sourcefile, 'r') as file:
	ARMstrg = file.read()

##
# Parse the ARM Template JSON into a Python Object
##
ARMdict = json.loads(ARMstrg)


##
# Create the Splat Variables JSON string
# (escaped for ARM parsing)
# Example:
# [concat('{\"adminUsername\":\"', parameters('adminUsername'), '\",\"peer_node\":{\"peer_node\":\"', reference(concat(variables('nicN'), sub(1, copyIndex()), '-01')).ipConfigurations[0].properties.privateIPAddress ,'\"},\"vpx_config\":{\"snip_11\":\"', reference(concat(variables('nicN'), copyIndex(), '-11')).ipConfigurations[0].properties.privateIPAddress ,'\",\"pvt_ip_12\":\"', reference(concat(variables('nicN'), copyIndex(), '-12')).ipConfigurations[0].properties.privateIPAddress ,'\",\"subnet_11\":\"', reference(variables('snetRef-11'), '2017-10-01', 'Full').properties.addressPrefix ,'\",\"subnet_12\":\"', reference(variables('snetRef-12'), '2017-10-01', 'Full').properties.addressPrefix, '\"}}')]
##
SplatStrg = "concat('{"
for param in ARMdict["parameters"]:
	SplatStrg += '\\"' + param + '\\":\\"' + "', parameters('" + param + "'), '" + '\\",'

# Remove the last comma
SplatStrg = SplatStrg[:-1]

# Close the string block
SplatStrg += "}')"


##
# Substitute "VARSPLATSTRING" into ARMString
# Save output and print result to screen
##
Outstrg = ARMstrg.replace(searchstrg, SplatStrg)

# Save Output of updated ARM Template
with open(outputpath + outputfile, 'w') as json_file:
	json_file.write(Outstrg)

# Output new updated string as completed ARM Template
print(Outstrg)
