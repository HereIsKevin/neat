NEAT_PLUGIN_EXIT_CODE_CACHE="normal"
NEAT_PLUGIN_EXIT_CODE_CODE=""

_neat_plugin_exit_code() {
    if [[ "$NEAT_EXIT_CODE" > "0" ]]; then
        neat_prompt_color "bright_red"
    else
        neat_prompt_color "reset"
    fi
}

neat_plugin_exit_code_update() {
    if [[ "$NEAT_EXIT_CODE" > "0" && "$NEAT_PLUGIN_EXIT_CODE_CACHE" == "normal" ]]; then
        NEAT_UPDATE="true"
        NEAT_PLUGIN_EXIT_CODE_CACHE="error"
    elif [[ "$NEAT_EXIT_CODE" == "0" && "$NEAT_PLUGIN_EXIT_CODE_CACHE" == "error" ]]; then
        NEAT_UPDATE="true"
        NEAT_PLUGIN_EXIT_CODE_CACHE="normal"
    fi
}

neat_plugin_exit_code() {
    if [[ "$(_neat_contains "$NEAT_CHECK" "neat_plugin_exit_code_update")" != "1" ]]; then
        NEAT_CHECK+=("neat_plugin_exit_code_update")
    fi

    NEAT_PROMPT+=("_neat_plugin_exit_code")
}
