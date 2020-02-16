NEAT_PLUGINS=()
NEAT_INSTALL="$HOME/.neat/"
NEAT_BUILTIN="$NEAT/plugins/"

neat_plugin_load() {
    local path="$1"

    if [[ -d "$NEAT_BUILTIN/$path/" ]]; then
        NEAT_PLUGINS+=("$NEAT_BUILTIN/$path/")
    elif [[ -d "$NEAT_INSTALL/$path/" ]]; then
        NEAT_PLUGINS+=("$NEAT_INSTALL/$path/")
    elif [[ -d "$path" ]]; then
        NEAT_PLUGINS+=("$path")
    else
        _neat_error "$path is not a plugin"
    fi

    source "${NEAT_PLUGINS[-1]}/init.sh"

    if [[ -f "${NEAT_PLUGINS[-1]}/aliases.sh" ]]; then
        source "${NEAT_PLUGINS[-1]}/aliases.sh"
    fi
}

neat_plugin_cleanup() {
    for plugin in "${NEAT_PLUGINS[@]}"; do
        if [[ -f "$plugin/unaliases.sh" ]]; then
            source "$plugin/unaliases.sh"
        fi
    done
}
