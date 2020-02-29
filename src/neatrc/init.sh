source "$NEAT/neatrc/plugins.sh"
source "$NEAT/neatrc/aliases.sh"

NEAT_RCS=(
    "$HOME/.neatrc"
    "$NEAT/lib/neatrc.sh"
)

for _neat_file in "${NEAT_RCS[@]}"; do
    if [[ -f "$_neat_file" ]]; then
        source "$_neat_file"
        break
    fi
done

source "$NEAT/neatrc/unaliases.sh"
neat_plugin_cleanup
