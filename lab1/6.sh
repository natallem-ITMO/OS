#!/bin/bash
if [[ $PWD = $HOME ]]
then
echo $HOME
exit 0
else 
echo "ERROR INCORRECT DIRECTORY"
exit 1
fi


