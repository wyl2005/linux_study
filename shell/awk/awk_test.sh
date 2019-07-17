#!/bin/bash

#awk -F "\"" '{if($4==1700870) $4=1700888}1' test.txt

awk  'BEGIN{FS=OFS="\""} {if ($4==1700870) $4=1700888}1'  test.txt 

#awk  'BEGIN{FS=OFS="\""} {if($4==1700870) {$4=1700888; print $4}}1'  test.txt 

