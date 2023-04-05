#!/bin/bash

#(a), get item number
read -p "Enter an item number: " itemNum

#(b), check to make sure the item exists
if [ -f "./data/$itemNum.item" ]
then
	#parse item file
	while true
	do
		read simpleName itemName
		read curQuant maxQuant
		read desc
		break

	done <"./data/$itemNum.item"

	#(c), print item information
	echo "Item Name: $itemName"
	echo "Simple Name: $simpleName"
	echo "Item Number: $itemNum"
	echo "Qty: $curQuant/$maxQuant"
	echo "Description: $desc"

else
	#(d), print error if file does not exist
	echo "ERROR: item not found"
fi
