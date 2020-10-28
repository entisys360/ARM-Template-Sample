import json
import argparse

parser = argparse.ArgumentParser()

parser.add_argument('-i', action='store',dest='jsonObj',
                    help='Json Object input from ARM')

param_result = parser.parse_args()


with open('/tmp/ansible_data.json', 'w') as outfile:
    json.dump(param_result.jsonObj , outfile)



