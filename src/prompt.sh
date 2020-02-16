NEAT_PROMPT=()
NEAT_CHECK=()
NEAT_OLD_DIR=""
NEAT_UPDATE="0"
NEAT_EXIT_CODE="$?"

neat_prompt_color() {
    local colors=(
        "BLACK"
        "RED"
        "GREEN"
        "YELLOW"
        "BLUE"
        "MAGENTA"
        "CYAN"
        "WHITE"
        "BRIGHT_BLACK"
        "BRIGHT_RED"
        "BRIGHT_GREEN"
        "BRIGHT_YELLOW"
        "BRIGHT_BLUE"
        "BRIGHT_MAGENTA"
        "BRIGHT_CYAN"
        "BRIGHT_WHITE"
        "BG_BLACK"
        "BG_RED"
        "BG_GREEN"
        "BG_YELLOW"
        "BG_BLUE"
        "BG_MAGENTA"
        "BG_CYAN"
        "BG_WHITE"
        "BG_BRIGHT_BLACK"
        "BG_BRIGHT_RED"
        "BG_BRIGHT_GREEN"
        "BG_BRIGHT_YELLOW"
        "BG_BRIGHT_BLUE"
        "BG_BRIGHT_MAGENTA"
        "BG_BRIGHT_CYAN"
        "BG_BRIGHT_WHITE"
    )

    local color="${1^^}"
    local var="$"

    if _neat_contains "$colors" "$color"; then
        NEAT_PROMPT+=("color $(eval "echo \"\001${var}NEAT_${color}\002\"")")
    else
        _neat_error "${color,,} is not a color"
    fi
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
        eval "$item"
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
                prompt="${prompt}$(eval "$item")"
            fi
        done

        export PS1="$prompt"
    fi
}

export PROMPT_COMMAND="{ time neat_prompt_update; } &>> ~/times.txt"
