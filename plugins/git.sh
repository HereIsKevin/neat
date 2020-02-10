git_branch() {
    local is_repo="$(git rev-parse --is-inside-work-tree 2>&1)"
    local return_value=""

    if [[ "$is_repo" == "true" ]]; then
        printf "\001$RED\002$(git branch --show-current)\001$RESET\002"
    fi
}

git_status_2() {
    local is_repo="$(git rev-parse --is-inside-work-tree 2>&1)"

    if [[ "$is_repo" == "true" ]] && [[ "$(git status --short)" != "" ]]; then
        printf "\001$RED\002*\001$RESET\002)"
    elif [[ "$is_repo" == true ]]; then
        printf ")"
    fi
}

git_status_1() {
    local is_repo="$(git rev-parse --is-inside-work-tree 2>&1)"

    if [[ "$is_repo" == "true" ]] && [[ "$(git status --short)" != "" ]]; then
        printf " (\001$RED\002*\001$RESET\002"
    elif [[ "$is_repo" == true ]]; then
        printf " ("
    fi
}

git_prompt() {
    printf '$(git_status_1)$(git_branch)$(git_status_2)'
}
