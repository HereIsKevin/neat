NEAT_EXIT_CODE_CACHE=""

_neat_plugin_exit_code() {
    if [[ "$NEAT_EXIT_CODE" > "0" ]]; then
        printf "\001$NEAT_RED\002"
    else
        printf "\001$NEAT_RESET\002"
    fi
}

neat_plugin_exit_code_check() {
    if [[ "$NEAT_EXIT_CODE" != "$NEAT_EXIT_CODE_CACHE" ]]; then
        NEAT_UPDATE="1"
        NEAT_EXIT_CODE_CACHE="$NEAT_EXIT_CODE"
    fi
}

neat_plugin_exit_code() {
    if _neat_contains "${NEAT_CHECK[@]}" "neat_plugin_exit_code_check"; then
        NEAT_CHECK+=("neat_plugin_exit_code_check")
    fi

    NEAT_PROMPT+=("_neat_plugin_exit_code")
}
