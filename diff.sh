#!/bin/bash

current_branch=$(git symbolic-ref -q --short HEAD)
diff_file="${current_branch}.diff"
zip_file="${current_branch}.zip"

#echo $zip_file
#echo $(printf "%q" "$zip_file");

#make diff file
echo "making diff file..."
git diff > $diff_file

#make zip file
echo "making zip file"
git status --porcelain | grep -e '^??'|sed -e 's/^?? //g'| zip $(printf "%q" "$zip_file") -@ -x $zip_file -x git-diff.sh

echo "removing diff file"
rm $diff_file
