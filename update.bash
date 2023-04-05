#!/bin/bash

#(a), parse user input
read -p "Item number: " itemNum
read -p "Simple name: " newSimpleName
read -p "Item name: " newItemName
read -p "Current quantity: " newCurQuant
read -p "Maximum quantity: " newMaxQuant
read -p "Description: " newDesc

#(b), check to make sure the item exists
if [ -f "./data/$itemNum.item" ]
then
	#parse file
	while true
	do
		read simpleName itemName
        	read curQuant maxQuant
        	read desc
		break
	done<"./data/$itemNum.item"
	
	#update variables if non-null
	if [[ -n $newSimpleName ]]; then
		simpleName=$newSimpleName
	fi
	
	if [[ -n $newItemName ]]; then
		itemName=$newItemName
	fi
	
	if [[ -n $newCurQuant ]]; then
		curQuant=$newCurQuant
	fi
	
	if [[ -n $newMaxQuant ]]; then
		maxQuant=$newMaxQuant
	fi
	
	if [[ -n $newDesc ]]; then
		desc=$newDesc
	fi
	
	#(c), update file
	echo "$simpleName $itemName" > "./data/$itemNum.item"
        echo "$curQuant $maxQuant" >> "./data/$itemNum.item"
        echo "$desc" >> "./data/$itemNum.item"
 
	#(d) update log
	curDate=$(date +"%Y-%m-%d %H:%M:%S")
	echo "UPDATED: $curDate - $simpleName" >> ./data/queries.log
	
else
	#(e), print error if file does not exist
	echo "ERROR: item not found"
fi
