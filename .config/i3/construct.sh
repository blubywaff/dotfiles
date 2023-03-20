#!/bin/bash

base=$HOME/.config/i3
cat $(find $base/*.$machine_type -type f | sort) $(find $base/*.common -type f | sort) > $base/config 2> /dev/null
