_neat_plugin_git_branch() {
    local is_repo="$(git rev-parse --is-inside-work-tree 2>&1)"

    if [[ "$is_repo" == "true" ]]; then
        printf "$(git branch --show-current) "
    else
        printf ""
    fi
}

neat_plugin_git_branch() {
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
    NEAT_PROMPT+=("_neat_plugin_git_status")
}
