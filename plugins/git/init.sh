export NEAT_PLUGIN_GIT_STATUS_CACHE=""

_neat_plugin_git_branch() {
    local is_repo="$(git rev-parse --is-inside-work-tree 2>&1)"

    if [[ "$is_repo" == "true" ]]; then
        printf "$(git rev-parse --abbrev-ref HEAD) "
    else
        printf ""
    fi
}

neat_plugin_git_branch() {
    if [[ "$(_neat_contains "NEAT_UPDATE" "neat_status")" == "0" ]]; then
        NEAT_UPDATE+=("neat_plugin_git_update")
    fi

    NEAT_PROMPT+=("_neat_plugin_git_branch")
}

_neat_plugin_git_status() {
    local is_repo="$(git rev-parse --is-inside-work-tree 2>&1)"

    if [[ "$is_repo" == true ]] && [[ "$(git status --short)" != "" ]]; then
        printf "* "
    else
        printf ""
    fi
}

neat_plugin_git_status() {
    if [[ "$(_neat_contains "NEAT_UPDATE" "neat_status")" == "0" ]]; then
        NEAT_UPDATE+=("neat_plugin_git_update")
    fi

    NEAT_PROMPT+=("_neat_plugin_git_status")
}

neat_plugin_git_update() {
    local git_status="$(git status)"

    if [[ "$git_status" != "$NEAT_PLUGIN_GIT_STATUS_CACHE" ]]; then
        NEAT_PLUGIN_GIT_STATUS_CACHE="$git_status"
        NEAT_UPDATE="true"
    fi
}
