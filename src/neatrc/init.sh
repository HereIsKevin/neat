source "$NEAT/neatrc/plugins.sh"
source "$NEAT/neatrc/aliases.sh"

NEAT_RCS=(
    "$HOME/.neatrc"
    "$NEAT/lib/neatrc.sh"
)

for file in "${NEAT_RCS[@]}"; do
    if [[ -f "$file" ]]; then
        source "$file"
        break
    fi
done

source "$NEAT/neatrc/unaliases.sh"
neat_plugin_cleanup
