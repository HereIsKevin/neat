NEAT_RESET="\033[0m"

NEAT_BLACK="\033[30m"
NEAT_RED="\033[31m"
NEAT_GREEN="\033[32m"
NEAT_YELLOW="\033[33m"
NEAT_BLUE="\033[34m"
NEAT_MAGENTA="\033[35m"
NEAT_CYAN="\033[36m"
NEAT_WHITE="\033[37m"

NEAT_BRIGHT_BLACK="\033[30;1m"
NEAT_BRIGHT_RED="\033[31;1m"
NEAT_BRIGHT_GREEN="\033[32;1m"
NEAT_BRIGHT_YELLOW="\033[33;1m"
NEAT_BRIGHT_BLUE="\033[34;1m"
NEAT_BRIGHT_MAGENTA="\033[35;1m"
NEAT_BRIGHT_CYAN="\033[36;1m"
NEAT_BRIGHT_WHITE="\033[37;1m"

NEAT_BG_BLACK="\033[40m"
NEAT_BG_RED="\033[41m"
NEAT_BG_GREEN="\033[42m"
NEAT_BG_YELLOW="\033[43m"
NEAT_BG_BLUE="\033[44m"
NEAT_BG_MAGENTA="\033[45m"
NEAT_BG_CYAN="\033[46m"
NEAT_BG_WHITE="\033[47m"

NEAT_BG_BRIGHT_BLACK="\033[40;1m"
NEAT_BG_BRIGHT_RED="\033[41;1m"
NEAT_BG_BRIGHT_GREEN="\033[42;1m"
NEAT_BG_BRIGHT_YELLOW="\033[43;1m"
NEAT_BG_BRIGHT_BLUE="\033[44;1m"
NEAT_BG_BRIGHT_MAGENTA="\033[45;1m"
NEAT_BG_BRIGHT_CYAN="\033[46;1m"
NEAT_BG_BRIGHT_WHITE="\033[47;1m"

neat_color_set() {
    local colors=(
        "RESET"
        "BLACK"
        "RED"
        "GREEN"
        "YELLOW"
        "BLUE"
        "MAGENTA"
        "CYAN"
        "WHITE"
        "BRIGHT_BLACK"
        "BRIGHT_RED"
        "BRIGHT_GREEN"
        "BRIGHT_YELLOW"
        "BRIGHT_BLUE"
        "BRIGHT_MAGENTA"
        "BRIGHT_CYAN"
        "BRIGHT_WHITE"
        "BG_BLACK"
        "BG_RED"
        "BG_GREEN"
        "BG_YELLOW"
        "BG_BLUE"
        "BG_MAGENTA"
        "BG_CYAN"
        "BG_WHITE"
        "BG_BRIGHT_BLACK"
        "BG_BRIGHT_RED"
        "BG_BRIGHT_GREEN"
        "BG_BRIGHT_YELLOW"
        "BG_BRIGHT_BLUE"
        "BG_BRIGHT_MAGENTA"
        "BG_BRIGHT_CYAN"
        "BG_BRIGHT_WHITE"
    )

    local color="${1^^}"
    local value="$2"

    if [[ "$value" == "" ]]; then
        _neat_error "new color value must be specified"
    fi

    if _neat_contains "${colors[@]}" "$color"; then
        declare "NEAT_$color=$value"
    else
        _neat_error "$1 is not a color"
    fi
}

neat_color_get() {
    local colors=(
        "RESET"
        "BLACK"
        "RED"
        "GREEN"
        "YELLOW"
        "BLUE"
        "MAGENTA"
        "CYAN"
        "WHITE"
        "BRIGHT_BLACK"
        "BRIGHT_RED"
        "BRIGHT_GREEN"
        "BRIGHT_YELLOW"
        "BRIGHT_BLUE"
        "BRIGHT_MAGENTA"
        "BRIGHT_CYAN"
        "BRIGHT_WHITE"
        "BG_BLACK"
        "BG_RED"
        "BG_GREEN"
        "BG_YELLOW"
        "BG_BLUE"
        "BG_MAGENTA"
        "BG_CYAN"
        "BG_WHITE"
        "BG_BRIGHT_BLACK"
        "BG_BRIGHT_RED"
        "BG_BRIGHT_GREEN"
        "BG_BRIGHT_YELLOW"
        "BG_BRIGHT_BLUE"
        "BG_BRIGHT_MAGENTA"
        "BG_BRIGHT_CYAN"
        "BG_BRIGHT_WHITE"
    )

    local color="${1^^}"

    if _neat_contains "${colors[@]}" "$color"; then
        local var="NEAT_$color"
        echo "${!var}"
    else
        _neat_error "${color,,} is not a color"
    fi
}
