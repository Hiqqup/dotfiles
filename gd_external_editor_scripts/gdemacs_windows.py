import subprocess
import time
import pygetwindow as gw
import os
import sys

debug_file_name = "log.txt"
debug_file = open(debug_file_name, 'w')


if len(sys.argv) != 4:
    print("Usage: script.py <FILE> <LINE> <COLUMN>")
    debug_file.write("wrong args")
    debug_file.close()
    sys.exit(1)

emacs_bin ="C:\\Program Files\\Emacs\\emacs-29.3_2\\bin\\";

FILE= sys.argv[1]
LINE= sys.argv[2]
COLUMN = sys.argv[3]
TITLE = "gdEmacs"  # Name for window manager focus

env = os.environ.copy()  # Copy the current environment
env['HOME'] = 'C:\\Users\\ju'

# Start Emacs daemon if not already running
def start_emacs_daemon():
    try:
        subprocess.check_call([emacs_bin+'emacsclient','--server-file=foo',  '-e', '(emacs-pid)'],env=env, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    except subprocess.CalledProcessError:
        subprocess.Popen([emacs_bin + 'emacs', '--bg-daemon=foo'],env=env, creationflags=subprocess.CREATE_NEW_CONSOLE)

                




# Start GUI client if not already running
def start_gui_client():
    # Check if Emacs window is open, if not, open it
    try:
        windows = gw.getWindowsWithTitle(TITLE)
        if not windows:
            subprocess.Popen([emacs_bin+'emacsclient',"--server-file=foo" ,  '-c', '-n', '--eval', f"""
                (let ((f (selected-frame)))
                  (set-frame-parameter f 'name "{TITLE}")
                  (set-frame-position f 280 140)
                  (set-frame-size f 122 25))
            """], env=env)
            subprocess.check_call([emacs_bin+'emacsclient','--server-file=foo',  '-e', '(set-frame-font "Consolas-15" nil t)'],env=env, stdout=debug_file, stderr=debug_file)
    except Exception as e:
        print(f"Error checking windows: {e}")

# Move and focus Emacs window
def focus_emacs_window():
    try:
        window = gw.getWindowsWithTitle(TITLE)[0]
        window.activate()  # Brings the window to the front
        window.restore()  # Make sure the window is not minimized
    except IndexError:
        print("Emacs window not found!")


# Open file and move to the specified line and column
def open_file_and_navigate():
    emacsclient_cmd = f"""
    (progn
      (select-frame-by-name "{TITLE}")
      (find-file "{FILE}")
      (goto-char (point-min))
      (forward-line (1- {LINE}))
      (move-to-column {COLUMN}))
    """
    subprocess.run([emacs_bin+'emacsclient', '--server-file=foo', '-n', '--eval', emacsclient_cmd],env=env)


start_emacs_daemon()
start_gui_client()
open_file_and_navigate()

debug_file.close()


