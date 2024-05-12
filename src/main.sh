#!/bin/bash

# Include other shell file.
# shellcheck disable=SC1091
source usage_basic.sh

# This is comment line.
echo "Hello world linux shell programming"
echo ""

echo "#### Usage: function to check if file exist"
fileName="./notExistFile"
checkFileExist $fileName
echo "check result: $?"
echo ""

echo "#### Usage: array"
useArray
echo ""

echo "#### Usage: file"
useFile
echo ""

echo "#### Usage: string"
useString
echo ""

echo "#### Usage: integer"
useInteger
echo ""

echo "#### Usage: case"
useCase
echo ""

echo "#### Usage: for while"
useForWhile
echo ""
