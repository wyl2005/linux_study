#!/bin/bash

#usage: ./get_patch.sh old_commit new_commit dir_name
#if [ $  ]


if [ $# == 2 ]; then
    old_commit=$1^
    new_commit=$1
    dir_name=$2
    echo "2 parameters"
    echo $old_commit
    echo $new_commit
    echo $dir_name
elif [ $# == 3 ]; then
    old_commit=$1
    new_commit=$2
    dir_name=$3
    echo $old_commit
    echo $new_commit
    echo $dir_name
    echo "3 parameters"
else
    echo ""error""
	echo "usage: ./get_patch.sh old_commit new_commit dir_name"
fi

origin_branch=$(git branch | grep "^* " | awk '{print $2}')

echo old_commit=$old_commit
echo new_commit=$new_commit
echo dir_name=$dir_name

#mkdir -p ${dir_name}_new
#mkdir -p ${dir_name}_old

#zip new commit files
git checkout ${new_commit}
git diff --name-only ${old_commit} ${new_commit} | xargs zip ${dir_name}_new.zip
unzip ${dir_name}_new.zip -d ${dir_name}_new


#zip old commit files
git checkout ${old_commit}
git diff --name-only ${old_commit} ${new_commit} | xargs zip ${dir_name}_old.zip
unzip ${dir_name}_old.zip -d ${dir_name}_old

git checkout ${origin_branch}
echo "get patch done!"

