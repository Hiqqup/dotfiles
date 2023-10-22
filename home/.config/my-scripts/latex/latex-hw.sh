
mkdir tex
cp $1 tex
cd tex

touch Makefile
echo "pdf:" >> Makefile
echo "	pdflatex -interaction=nonstopmode $1" >> Makefile
tmux rename-window "edit"
tmux send-keys -t . "nvim $1" Enter

tmux new-window -n view
tmux send-keys -t view "make pdf"
tmux split-window -h -p 33
tmux send-keys -t view "zathura ${1%.*}.pdf"
tmux split-window -v -p 50
tmux send-keys -t view "cd .." Enter "zathura "
tmux select-pane -t 1
tmux select-window -t edit




