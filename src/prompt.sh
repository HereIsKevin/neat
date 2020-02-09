RESET="\033[0m"

BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"

BRIGHT_BLACK="\033[30;1m"
BRIGHT_RED="\033[31;1m"
BRIGHT_GREEN="\033[32;1m"
BRIGHT_YELLOW="\033[33;1m"
BRIGHT_BLUE="\033[34;1m"
BRIGHT_MAGENTA="\033[35;1m"
BRIGHT_CYAN="\033[36;1m"
BRIGHT_WHITE="\033[37;1m"

BG_BLACK="\033[40m"
BG_RED="\033[41m"
BG_GREEN="\033[42m"
BG_YELLOW="\033[43m"
BG_BLUE="\033[44m"
BG_MAGENTA="\033[45m"
BG_CYAN="\033[46m"
BG_WHITE="\033[47m"

BG_BRIGHT_BLACK="\033[40;1m"
BG_BRIGHT_RED="\033[41;1m"
BG_BRIGHT_GREEN="\033[42;1m"
BG_BRIGHT_YELLOW="\033[43;1m"
BG_BRIGHT_BLUE="\033[44;1m"
BG_BRIGHT_MAGENTA="\033[45;1m"
BG_BRIGHT_CYAN="\033[46;1m"
BG_BRIGHT_WHITE="\033[47;1m"

git_branch() {
    local is_repo="$(git rev-parse --is-inside-work-tree 2>&1)"
    local return_value=""

    if [[ "$is_repo" == "true" ]]; then
        printf "\001$RED\002$(git branch --show-current)\001$RESET\002"
    fi
}

git_status_2() {
    local is_repo="$(git rev-parse --is-inside-work-tree 2>&1)"

    if [[ "$is_repo" == "true" ]] && [[ "$(git status --short)" != "" ]]; then
        printf "\001$RED\002*\001$RESET\002)"
    elif [[ "$is_repo" == true ]]; then
        printf ")"
    fi
}

git_status_1() {
    local is_repo="$(git rev-parse --is-inside-work-tree 2>&1)"

    if [[ "$is_repo" == "true" ]] && [[ "$(git status --short)" != "" ]]; then
        printf " (\001$RED\002*\001$RESET\002"
    elif [[ "$is_repo" == true ]]; then
        printf " ("
    fi
}

git_prompt() {
    printf '$(git_status_1)$(git_branch)$(git_status_2)'
}

export PS1="\[$BRIGHT_GREEN\]\u\[$RESET\] \[$BLUE\]\W\[$RESET\]$(git_prompt) \$ "
