_neat_plugin_git_branch() {
    local is_repo="$(git rev-parse --is-inside-work-tree 2>&1)"

    if [[ "$is_repo" == "true" ]]; then
        printf "$(git branch --show-current) "
    else
        printf ""
    fi
}

_neat_plugin_git_branch_wrapper() {
    printf '$(_neat_plugin_git_branch)'
}

neat_plugin_git_branch() {
    NEAT_PROMPT="${NEAT_PROMPT}$(_neat_plugin_git_branch_wrapper)"
}

_neat_plugin_git_status() {
    local is_repo="$(git rev-parse --is-inside-work-tree 2>&1)"

    if [[ "$is_repo" == "true" ]] && [[ "$(git status --short)" != "" ]]; then
        printf "* "
    elif [[ "$is_repo" == true ]]; then
        printf " "
    else
        printf ""
    fi
}

_neat_plugin_git_status_wrapper() {
    printf '$(_neat_plugin_git_status)'
}

neat_plugin_git_status() {
    NEAT_PROMPT="${NEAT_PROMPT}$(_neat_plugin_git_status_wrapper)"
}
