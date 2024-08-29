#!/bin/sh
company="Google"
  
#Pass the variable in string
case "$company" in
    #case 1
    "Google") echo "CTC: 33 Lac" ;;
      
    #case 2
    "Microsoft") echo "CTC: 52 Lac" ;;
      
    #case 3
    "Amazon") echo "CTC: 45 Lac" ;;
esac
