#!/usr/bin/env bash
# https://gitlab.com/wef/dotfiles/-/blob/master/bin/toolwait
TIME_STAMP="20220627.153508"

# dependencies: https://gitlab.com/wef/dotfiles/-/blob/master/bin/argp.sh
#                 jq

# Copyright (C) 2021-2022 Bob Hepple < bob dot hepple at gmail dot com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

initialise() {
    PROG=$(basename "$0")
    VERSION="$TIME_STAMP"
    USAGE="
Run 'command', wait for somehing to happen on-screen, then exit. If no
window appears in 'timeout' seconds (eg by running a non-GUI program
like 'date') then terminate.

eg.

    $PROG firefox # this gives time for the window to be created before:
    swaymsg 'floating disable; border none'

To run more complex commands use '--'. eg.

    $PROG -- bash -c 'some complex bash commands'

This may be similar to the ancient Sun OpenWindows command toolwait or
the X11 version at
http://www.ibiblio.org/pub/linux/X11/xutils/toolwait-0.9.tar.gz

This was a proof of concept - more functionality is in the
sway-toolwait python script at:
https://gitlab.com/wef/dotfiles/-/blob/master/bin/sway-toolwait
 "

    NEW_ARGS=( )

    timeout=10 # keeps shellcheck happy
    ARGS="
ARGP_DELETE=quiet
ARGP_VERSION=$VERSION
ARGP_PROG=$PROG
##############################################################
#OPTIONS:
#name=default sname arg       type range   description
##############################################################
TIMEOUT='10'  t     timeout   i    ''      timeout in secs (default $timeout)
##############################################################
ARGP_ARGS=[--] command
ARGP_SHORT=$SHORT_DESC
ARGP_USAGE=$USAGE"

    exec 4>&1
    eval "$( echo "$ARGS" | $HOME/.config/sway/scripts.d/argp.sh "$@" 3>&1 1>&4 || echo exit $? )"
    exec 4>&-

    NEW_ARGS=( "$@" )

    return 0
}

get_id_list() {
    swaymsg -t get_tree | jq '.. | select(.type?) | .id' | sort -n
}

initialise "$@" && set -- "${NEW_ARGS[@]:-}"

[[ "$VERBOSE" ]] && set -x

initial_tree=$( get_id_list )
initial_time=$( date +%s )

# run commands:
eval "$@" &
retval=0

while true; do
    new_tree=$( get_id_list )
    if [[ "$new_tree" != "$initial_tree" ]]; then
        break
    fi
    new_time=$( date +%s )
    # shellcheck disable=SC2153
    if (( new_time - initial_time > TIMEOUT )); then
        echo "$PROG: timed out" >&2
        retval=1
        break
    fi
    sleep 0.1
done

echo "$PROG: terminating"
exit $retval

# Local Variables:
# mode: shell-script
# time-stamp-pattern: "4/TIME_STAMP=\"%:y%02m%02d.%02H%02M%02S\""
# eval: (add-hook 'before-save-hook 'time-stamp)
# End:
