# =============================git plugin for neat==============================
# Version 0.1.2
# Copyright (c) 2020 Kevin Feng (https://github.com/HereIsKevin)
# Licensed under GPLv3 (https://github.com/HereIsKevin/neat/blob/master/LICENSE)
# ==============================================================================

NEAT_PLUGIN_GIT_STATUS_CACHE=""
NEAT_PLUGIN_GIT_BRANCH_CACHE=""

_neat_plugin_git_branch() {
    local is_repo="$(git rev-parse --is-inside-work-tree 2> /dev/null)"

    if [[ "$is_repo" == "true" ]]; then
        printf "$(git rev-parse --abbrev-ref HEAD 2> /dev/null) "
    else
        printf ""
    fi
}

neat_plugin_git_branch() {
    if ! _neat_contains "${NEAT_CHECK[@]}" "neat_plugin_git_check"; then
        NEAT_CHECK+=("neat_plugin_git_check")
    fi

    NEAT_PROMPT+=("_neat_plugin_git_branch")
}

_neat_plugin_git_status() {
    local is_repo="$(git rev-parse --is-inside-work-tree 2> /dev/null)"

    if [[ "$is_repo" == "true" && "$(git status --porcelain 2> /dev/null)" != "" ]]; then
        printf "* "
    else
        printf ""
    fi
}

neat_plugin_git_status() {
    if ! _neat_contains "${NEAT_CHECK[@]}" "neat_plugin_git_check"; then
        NEAT_CHECK+=("neat_plugin_git_check")
    fi

    NEAT_PROMPT+=("_neat_plugin_git_status")
}

neat_plugin_git_check() {
    local git_status="$(git status --porcelain 2> /dev/null)"
    local git_branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"

    if [[ "$git_status" != "$NEAT_PLUGIN_GIT_STATUS_CACHE" || \
        "$git_branch" != "$NEAT_PLUGIN_GIT_BRANCH_CACHE" ]]; then
        NEAT_PLUGIN_GIT_STATUS_CACHE="$git_status"
        NEAT_PLUGIN_GIT_BRANCH_CACHE="$git_branch"
        NEAT_UPDATE="1"
    fi
}
