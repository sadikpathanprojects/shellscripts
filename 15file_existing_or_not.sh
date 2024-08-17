
#!/bin/bash
clear
echo "this script checks if the file exists or not"
if [ -f /home/iafzal/error.txt ] 
then
echo "File exist" 
else
echo "File does not exist "
fi
