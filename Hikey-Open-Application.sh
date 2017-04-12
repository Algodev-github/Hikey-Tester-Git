#!/bin/bash
#   Copyright (C) 2017 Luca Miccio <lucmiccio@gmail.com>

#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.

#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.

#   This script is used to open a specific app test on a device running Android OS
#
#   N.B: this script is not intended to be used as a single script, but only with
#   the Hikey-Tester suite

# Main variables
App="$1/$2"
pid_application=""

# Start the application
echo "\n----Starting Testing App($1)----\n"
echo "Ctrl+c to stop the script when the application is loaded\n\n"
# Start the timer
sh Hikey-Timer.sh &

am start $App
pid_application=$(pidof $1)
while [[ "$pid_application" == "" ]]; do
    echo "Getting pid..."
    pid_application=$(pidof $1)
done
echo "$1 pid: $pid_application"
echo
echo
