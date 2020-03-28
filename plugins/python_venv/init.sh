# =============================git plugin for neat==============================
# Version 0.1.1
# Copyright (c) 2020 Kevin Feng (https://github.com/HereIsKevin)
# Licensed under GPLv3 (https://github.com/HereIsKevin/neat/blob/master/LICENSE)
# ==============================================================================

NEAT_PLUGIN_PYTHON_VENV_CACHE=""

_neat_plugin_python_venv() {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        printf "($(basename "$VIRTUAL_ENV")) "
    else
        printf ""
    fi
}

neat_plugin_python_venv() {
    if ! _neat_contains "${NEAT_CHECK[@]}" "neat_plugin_python_venv_check"; then
        NEAT_CHECK+=("neat_plugin_python_venv_check")
    fi

    NEAT_PROMPT+=("_neat_plugin_python_venv")
}

neat_plugin_python_venv_check() {
    if [[ "$NEAT_PLUGIN_PYTHON_VENV_CACHE" != "$VIRTUAL_ENV" ]]; then
        NEAT_PLUGIN_PYTHON_VENV_CACHE="$VIRTUAL_ENV"
        NEAT_UPDATE="1"
    fi
}
