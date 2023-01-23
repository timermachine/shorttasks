#! /bin/bash

# Given string 
s="./tasks/Dororo.sh"
pattern='.tasks/'
repace='x'
# ${main_string/search_term/replace_term}
a=${s/.\/tasks\//''}
b=${a/'.sh'/''}
echo "$b - $a"
# fname=(${string//"./tasks/"/ })
# cmdname=(${fname//".sh"/ })
# printf "$cmdname=$fname+$string"


# Syntax to replace all occurrences of "anime" with " "
# Print each value of the array by using the loop
# for val in "${arr[@]}";
# do
#   printf "Anime name is = $val\n"
# done