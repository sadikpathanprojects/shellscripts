#!/bin/bash

#read the content of csv file using the while loop

#!/bin/bash

while IFS="," read var1 var2 var3
do
	echo "$var1"
	echo "$var2"
	echo "$var3"
done < /root/file2


>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#below line will not print the first row
cat /root/file2 | awk 'NR!=1 {print}' | while IFS="," read var1 var2 var3
do
	echo "$var1"
	echo "$var2"
	echo "$var3"
done