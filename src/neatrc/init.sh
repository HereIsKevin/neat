source "$NEAT/neatrc/aliases.sh"

NEAT_RCS=(
    "$HOME/.neatrc"
)

for file in "${NEAT_RCS[@]}"; do
    if [ -f "$file" ]; then
        source "$file"
    fi
done

source "$NEAT/neatrc/unaliases.sh"

for path in "${NEAT_PLUGINS[@]}"; do
    if [ -f "$path/unaliases.sh" ]; then
        source "$path/unaliases.sh"
    fi
done
