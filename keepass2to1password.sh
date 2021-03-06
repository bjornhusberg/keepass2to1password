#!/bin/bash

if [ "$#" != "2" ]; then
  echo "Usage: $0 <input file> <output file>"
  exit 1
fi

cat $1 | tr '\n' '\r' | sed 's/\([^,]\)""/\1@@@@/g' | sed 's/\"\([^"]*\)\",\"\([^"]*\)\",\"\([^"]*\)\",\"\([^"]*\)\",\"\([^"]*\)\",\"\([^"]*\)\"/"\1\/\2","\5","\3","\4","\6"/g' | sed 's/@@@@/""/g' | tr '\r' '\n' > $2
