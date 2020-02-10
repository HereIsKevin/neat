_neat_contains() {
    local list="$1"
    local value="$2"
    local found="0"

    for item in "${list[@]}"; do
        if [[ "$item" == "$value" ]]; then
            found="1"
            break
        fi
    done

    return "$found"
}

_neat_error() {
    local quit="1"
    local message="$1"

    if [[ "$1" == "--no-exit" ]]; then
        local quit="0"
        local message="$2"
    elif [[ "$2" == "--no-exit" ]]; then
        local quit="0"
        local message="$1"
    fi

    printf "error: %s\n" "$message" >&2

    if [[ "$quit" == true ]]; then
        exit "1"
    else
        return "1"
    fi
}
