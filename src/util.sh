_neat_contains() {
    local list=("${@:1:($# - 1)}")
    local value="${@:$#}"
    local item

    for item in "${list[@]}"; do
        if [[ "$item" == "$value" ]]; then
            true
            return
        fi
    done

    false
    return
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

    if [[ "$quit" == "1" ]]; then
        exit "1"
    else
        return "1"
    fi
}
