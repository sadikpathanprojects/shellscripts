#!/bin/bash

function sum {
    let addition=$1+$2
    echo "addition of the 2 numbers is $addition"
}

function diff {
    let subs=$1-$2
    echo "substraction of the 2 numbers is $subs"
}

function multiple  {
    let multi=$1*$2
    echo "multiplication of the 2 numbers is $multi"
}


sum 3 5
diff 4 6
multiple 3 7