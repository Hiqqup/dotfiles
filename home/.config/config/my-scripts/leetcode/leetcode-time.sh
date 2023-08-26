#

cd ~/Documents/leetcode/
mkdir $1
cd $1 
cp ~/.config/my-scripts/leetcode/template.html ./index.html
tmux split-window -h -p 25 -d live-server
nvim +4 index.html


