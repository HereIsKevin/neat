NEAT_PROMPT=()
NEAT_CHECK=()
NEAT_OLD_DIR=""
NEAT_UPDATE="0"
NEAT_EXIT_CODE="$?"

neat_prompt_color() {
    local color="$1"
    NEAT_PROMPT+=("color \001$(neat_color_get $1)\002")
}

neat_prompt_text() {
    if [[ $1 == "" ]]; then
        _neat_error "no arguments were passed"
    else
        NEAT_PROMPT+=("text $1")
    fi
}

neat_prompt_date() {
    neat_prompt_text "\d"
}

neat_prompt_hostname() {
    neat_prompt_text "\H"
}

neat_prompt_hostname_short() {
    neat_prompt_text "\h"
}

neat_prompt_jobs() {
    neat_prompt_text "\j"
}

neat_prompt_basename() {
    neat_prompt_text "\l"
}

neat_prompt_shellname() {
    neat_prompt_text "\s"
}

neat_prompt_time() {
    neat_prompt_text "\@"
}

neat_prompt_time_24() {
    neat_prompt_text "\t"
}

neat_prompt_time_12() {
    neat_prompt_text "\T"
}

neat_prompt_username() {
    neat_prompt_text "\u"
}

neat_prompt_shversion() {
    neat_prompt_text "\v"
}

neat_prompt_shrelease() {
    neat_prompt_text "\V"
}

neat_prompt_path() {
    neat_prompt_text "\w"
}

neat_prompt_folder() {
    neat_prompt_text "\W"
}

neat_prompt_histnumber() {
    neat_prompt_text "\!"
}

neat_prompt_cmdnumber() {
    neat_prompt_text "\#"
}

neat_prompt_update() {
    NEAT_EXIT_CODE="$?"

    for item in "${NEAT_CHECK[@]}"; do
        "$item"
    done

    if [[ "$(pwd)" != "$NEAT_OLD_DIR" ]] || [[ "$NEAT_UPDATE" == "1" ]]; then
        NEAT_OLD_DIR="$(pwd)"
        NEAT_UPDATE="0"

        local prompt=""

        for item in "${NEAT_PROMPT[@]}"; do
            if echo "$item" | grep -e "color .*" > /dev/null; then
                prompt="${prompt}${item/'color '/}"
            elif echo "$item" | grep -e "text .*" > /dev/null; then
                prompt="${prompt}${item/'text '/}"
            else
                prompt="${prompt}$("$item")"
            fi
        done

        export PS1="$prompt"
    fi
}

export PROMPT_COMMAND="{ time neat_prompt_update; } &>> ~/times.txt"
