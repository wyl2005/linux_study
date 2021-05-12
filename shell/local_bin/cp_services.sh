#!/bin/bash

#usage: ./cp_services.sh dest_dir
dst_dir=$1

array=$(find ./services -name *.a)
echo $array
echo $dst_dir

for str in ${array[@]}; do
	# echo $str
	# echo $dst_dir$str
	cp $str $dst_dir$str
done

array=$(find ./utils -name *.a)

for str in ${array[@]}; do
	# echo $str
	# echo $dst_dir$str
	cp $str $dst_dir$str
done
