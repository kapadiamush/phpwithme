#!/bin/bash
#$1 should the type of php file
#$2 should be the path to the file 
#$3 - $x should be the fields to add

#help menu
if [ $1 == '-h' ]
then 
	echo ""
	echo "Usage:"
	echo ""
	echo 'easybake/addfieldsto.sh "<type of file: model|controller>" "<name of file>" "<field_1>" "<field_2>" ... "<field_n>"'
	echo ""
fi

$path = ''

if [ $1 == 'model' ] 
then 
	$path = 'public/model'
fi

if [ $1 == 'controller' ] 
then 
	$path = 'public/controller'
fi 

#use sed to insert after the '//mark', but need to figure out how to loop this 
for var in $@
do
	if [ $counter -gt 2 ]  #counter should be greater than two
	then
		sed -i "s/\/\/mark/\t\$$var;\n\/\/mark\n/" $path/$2
	fi
	$((counter++))
done