#!/usr/bin/env python

import json
from argparse import ArgumentParser
from os import system

# Parse me some arguments
parser = ArgumentParser(description="Split a file into smaller files \
    or something. This script requires `ffmpeg` to be in PATH.")
parser.add_argument("data_file", help="The file that contains the data that is \
    bound to <json_file>, e.g. a video or an audio file.")
parser.add_argument("json_file", help="File containing the JSON data \
    (produced by --write-info-json) that is used to parse <data_file> and \
    split it into smaller files.")
args = parser.parse_args()
json_file = args.json_file
data_file = args.data_file

# Get the json data, specifically the 'chapters'
with open(json_file) as f:
    json_data = json.load(f)
    chapters = json_data['chapters']

# Do the ffmpeg stuff
for chapter in chapters:
    start_time = chapter['start_time']
    end_time   = chapter['end_time']
    title      = chapter['title']
    system(f"ffmpeg -i '{data_file}' -ss '{start_time}' -to '{end_time}' \
            '{title}")