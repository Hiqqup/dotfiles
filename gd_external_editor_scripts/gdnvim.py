import subprocess
import time
import pygetwindow as gw
import os
import sys

debug_file_name = "log.txt"
debug_file = open(debug_file_name, 'w') 
script_dir = os.path.dirname(os.path.abspath(__file__))

if len(sys.argv) != 4:
    print("Usage: script.py <FILE> <LINE> <COLUMN>")
    debug_file.write("wrong args")
    debug_file.close()
    sys.exit(1)


FILE= sys.argv[1]
LINE= sys.argv[2]
COLUMN = sys.argv[3]
TITLE = "gdNvim"  # Name for window manager focus
LISTEN_ADRESS = "127.0.0.1:6969"

#if not running start terminal
windows = gw.getWindowsWithTitle(TITLE)
if not windows:
    
    proc = subprocess.Popen(["alacritty", "--title", TITLE,  "--hold" , "--config-file",  script_dir+"/alacritty.toml"])
    while not windows:
        windows = gw.getWindowsWithTitle(TITLE)
        time.sleep(0.1)  # Wait a little
    
    win = gw.getWindowsWithTitle(TITLE)[0]
    win.moveTo(275, 140)
    win.resizeTo(1370, 640)

subprocess.Popen(["nvim", "--server", LISTEN_ADRESS, "--remote-send", '"<C-\\><C-N>:n '+FILE+'<CR>${'+LINE+'}G$'+COLUMN+'|"'])

window = gw.getWindowsWithTitle(TITLE)[0]
window.activate()  # Brings the window to the front
window.restore()  # Make sure the window is not minimized


