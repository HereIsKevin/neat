#        _______________________________________________________________
#       |      ____________   ____________   ____________       ___     |
#       |     / ________  /  / ________  /  /_________  /  ____/  /____ |
#       |    / /       / /  / /_______/ /  __________/ /  /____   ____/ |
#       |   / /       / /  / _________ /  / ________  /       /  /      |
#       |  / /       / /  / /_________   / /_______/ /       /  /____   |
#       | /_/       /_/  /___________/  /___________/       /_______/   |
#       |_______________________________________________________________|
#
#                                Version 0.1.0
#
#        Copyright (c) 2020 Kevin Feng (https://github.com/HereIsKevin)
# Licensed under GPLv3 (https://github.com/HereIsKevin/neat/blob/master/LICENSE)

# resolver code based on code from https://stackoverflow.com/questions/59895/
# how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself

NEAT_SOURCE="${BASH_SOURCE[0]}"

while [[ -L "$NEAT_SOURCE" ]]; do # resolve $NEAT_SOURCE until not a symlink
    NEAT_DIR="$(cd -P "$(dirname "$NEAT_SOURCE")" > /dev/null 2>&1 && pwd)"
    NEAT_SOURCE="$(readlink "$NEAT_SOURCE")"
    # if $NEAT_SOURCE is a symlink, resolve its path relative from the symlink
    [[ "$NEAT_SOURCE" != /* ]] && NEAT_SOURCE="$NEAT_DIR/$NEAT_SOURCE"
done

NEAT="$(cd -P "$(dirname "$NEAT_SOURCE")" > /dev/null 2>&1 && pwd)"
unset NEAT_SOURCE

source "$NEAT/util.sh"
source "$NEAT/colors.sh"
source "$NEAT/prompt.sh"
source "$NEAT/neatrc/init.sh"

alias neat="source $NEAT/bin/neat"
