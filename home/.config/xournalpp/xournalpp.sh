
filename="$1"

if [[ ! "$filename" =~ \.xopp$ ]];
then
    filename="$filename.xopp"
fi
if [ ! -f "./$filename" ]; then
    cp ~/.config/xournalpp/default.xopp ./$filename
fi
xournalpp $filename
