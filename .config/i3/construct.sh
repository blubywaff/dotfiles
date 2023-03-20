#!/bin/bash

# machine_type
echo $machine_type
cat $(find *.$machine_type -type f | sort) $(find *.common -type f | sort) > config 2> /dev/null
