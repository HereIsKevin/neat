source "$NEAT/neatrc/aliases.sh"

NEAT_RCS=(
    "$HOME/.neatrc"
)

NEAT_INSTALL="$HOME/.neat/"
NEAT_BUILTIN="$NEAT/plugins/"

NEAT_SOURCED="false"


for file in "${NEAT_RCS[@]}"; do
    if [ -f "$file" ]; then
        source "$file"
        NEAT_SOURCED="true"
    fi
done

if [[ "$NEAT_SOURCED" == "false" ]]; then
    source "$NEAT/neatrc/neatrc.sh"
fi

source "$NEAT/neatrc/unaliases.sh"

for path in "${NEAT_PLUGINS[@]}"; do
    if [ -f "$path/unaliases.sh" ]; then
        source "$path/unaliases.sh"
    fi
done
