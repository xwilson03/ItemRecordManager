#!/bin/bash

#(a), parse user input
read -p "Item number: " itemNum
read -p "Simple name: " simpleName
read -p "Item name: " itemName
read -p "Current quantity: " curQuant
read -p "Maximum quantity: " maxQuant
read -p "Description: " desc

#check to see if file exists
if [ -f "./data/$itemNum.item" ]
then
	#(d), print an error if it does
	echo "ERROR: item already exists"

else
	#(b), otherwise create a file with the given data
	echo "$simpleName $itemName" > "./data/$itemNum.item"
	echo "$curQuant $maxQuant" >> "./data/$itemNum.item"
	echo "$desc" >> "./data/$itemNum.item"
	
	#(c), update log
	curDate=$(date +"%Y-%m-%d %H:%M:%S")
	echo "CREATED: $curDate - $simpleName" >> ./data/queries.log

fi
