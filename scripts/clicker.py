#!/usr/bin/env python
from pynput.mouse import Button
from pynput.mouse import Controller
from os import getpid
from os import kill
from os import unlink
from os.path import exists
from time import sleep

PID_FILE = "/tmp/clicker_pid"

# Check whether there is a pid file present.
# If it is, get the pid inside, kill it and exit.
# If it isn't, create it and write the pid of this script inside.
if exists(PID_FILE):
    with open(PID_FILE) as f:
        pid = f.read().strip()
    unlink(PID_FILE)
    kill(int(pid), 9)
    exit()

# Write down the pid of this process
with open(PID_FILE, "w") as f:
    f.write(str(getpid()))

# Start clicking
mouse = Controller()
while True:
    sleep(0.1)
    mouse.click(Button.left)
