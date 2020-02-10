NEAT_PLUGINS=()

neat_plugin_load() {
    local path="$1"

    if [ -d "$path" ]; then
        NEAT_PLUGINS+=("$path")
    fi

    source "$path/init.sh"

    if [ -f "$path/aliases.sh" ]; then
        source "$path/aliases.sh"
    fi
}
