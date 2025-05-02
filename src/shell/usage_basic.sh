#!/bin/bash

function checkFileExist()
{
    echo "Script name: $0"
    echo "Function name: ${FUNCNAME[0]}"
    echo "Parameter number: $#"
    echo "Parameter list: $*"
    echo "Parameter 1: $1"

    if [ -f "$1" ]; then
        return 0
    else
        return 1
    fi
}

function useArray()
{
    declare -a array
    array[0]=1
    array[2]=2
    echo "array: ${array[*]}"
}

function useFile()
{
    test -e main.sh
    echo "File exist: $?"

    test ! -e main.sh
    echo "File exist: $?"

    test ! -d ../src
    echo "Directory exist: $?"
}

function useString()
{
    str1=""
    test -z "$str1"
    echo "String zero: $?"

    test -n "$str1"
    echo "String not null: $?"

    str2="hello"
    test "$str1" = "$str2"
    echo "String equal: $?"

    [ "$str1" != "$str2" ]
    echo "String not equal: $?"
}

function useInteger()
{
    num1=1
    num2=2

    [ $num1 -eq $num2 ]
    echo "Integer equal: $?"

    [ $num1 -ne $num2 ]
    echo "Integer not equal: $?"

    [ $num1 -lt $num2 ]
    echo "Integer less than: $?"

    [ $num1 -gt $num2 ]
    echo "Integer great than: $?"
}

function useCase()
{
    os=$(uname -s)

    case "$os" in
        FreeBSD)
            echo "OS: bsd"
            ;;
        Linux)
            echo "OS: Linux"
            ;;
        *)
            echo "OS: Unknown"
            ;;
    esac
}

function useForWhile()
{
    for var in 1 2 3; do
        echo "for loop $var"
    done

    for var in {1..3}; do
        echo "for loop $var"
    done

    counter=3
    SLEEP_TIME=1
    while [ $counter -gt 0 ]; do
        echo "while loop $counter"
        # Instead of let expr, prefer (( expr )).
        ((counter--))
        sleep $SLEEP_TIME
    done

    counter=3
    # Exit when condition is true.
    until [ $counter -eq 0 ]; do
        echo "until loop $counter"
        ((counter--))
    done

    CHILD_PROCESS="str1 \
                   str2 \
                   str3"
    for var in $CHILD_PROCESS; do
        echo "$var"
    done
}

useIfElse()
{
    if [ -f "main.sh" ] && [ -d "../src" ]; then
        echo "file exist"
    else
        echo "file not exist"
    fi

    # if-then-else in one line
    [ $? = 0 ] && echo "OK" || echo "FAIL"
}