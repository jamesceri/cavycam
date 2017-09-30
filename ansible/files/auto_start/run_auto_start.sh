#!/bin/bash
#
# Run all executables found in AUTO_START_SCRIPTS
#

AUTO_START_SCRIPTS=/home/pi/auto_start
SCRIPT_NAME=$(basename $BASH_SOURCE)

for executable in \
  $(find "${AUTO_START_SCRIPTS}" -type f ! -iname "${SCRIPT_NAME}" ! -name *.log ! -name *.out ! -name *.txt); do
    if [[ -x "$executable" ]];then
        echo "$(date): Running $executable"
        nohup "$executable" &> /dev/null &
    fi
done

