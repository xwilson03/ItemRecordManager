#!/bin/bash

#(a), get item number
read -p "Enter an item number: " itemNum

#check if file exists
if [ -f "./data/$itemNum.item" ]
then
	#grab simpleName before file is deleted
	read simpleName itemName <"./data/$itemNum.item"

	#(b), delete file
	rm "./data/$itemNum.item"

	#(c), update log
	curDate=$(date +"%Y-%m-%d %H:%M:%S")
	echo "DELETED: $curDate - $simpleName" >> ./data/queries.log

	#(d) print deletion message
	echo "$simpleName was successfully deleted."

else
	#(e), print error if file does not exist
	echo "ERROR: item not found"
fi
