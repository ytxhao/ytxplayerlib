#!/bin/bash

echo "start"
rm gtags.files
rm GPATH 
rm GRTAGS
rm GTAGS

find .  -name '*.cc' -o -name '*.cpp' -o -type f -name '*.c' -o -name '*.h' -o -name '*.java' > gtags.files

gtags --accept-dotfiles -c -f gtags.files

echo "end"
