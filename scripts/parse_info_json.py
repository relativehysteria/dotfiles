#!/usr/bin/env python

import json
from argparse import ArgumentParser
from subprocess import run

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
track_num = 0
for chapter in chapters:
    track_num  += 1
    start_time = chapter['start_time']
    end_time   = chapter['end_time']
    title      = chapter['title']
    extension  = data_file.split('.')[-1]
    run([
        "ffmpeg",
        "-i",
        f"{data_file}",
        "-ss",
        f"{start_time}",
        "-to",
        f"{end_time}",
        f"{track_num} {title}.{extension}",
        "-n"
    ])
