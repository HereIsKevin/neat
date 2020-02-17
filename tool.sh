#!/bin/bash

OUTFILE="./neat.sh"

_format() {
    shfmt -i 4 -sr -ci -w $@
}

format() {
    _format "./bin/*" "./bin/**/*" \
        "./plugins/*" "./plugins/**/*" \
        "./src/*" "./src/**/*" \
        "./tool.sh" 2> /dev/null
}

_build() {
    cat "$1" | while read -r line || [[ -n $line ]]; do
        if echo "$line" | grep -e "source \"\$NEAT/.*" > /dev/null; then
            local nextfile="${line/'source '/}"
            nextfile="${nextfile/'$NEAT'/./src}"
            nextfile="${nextfile//'"'/}"
            _build "$nextfile"
        else
            echo "$line" >> $OUTFILE
        fi
    done
}

build() {
    clean

    _build "./src/init.sh"

    mkdir "./out/"
    mv "./neat.sh" "./out/"

    mkdir "./out/bin/"
    cp "./bin/neat" "./out/bin/"

    mkdir "./out/lib/"
    cp "./src/neatrc/neatrc.sh" "./out/lib/"

    mkdir "./out/plugins/"
    cp -r "./plugins/." "./out/plugins/"

    _format "./out/*" "./out/**/*"
}

clean() {
    rm -rf "./out/" 2> /dev/null
}

show_help() {
    echo "usage: $0 [-h | --help] <command>"
    echo ""
    echo "options:"
    echo "    -h, --help      show this help message again"
    echo ""
    echo "commands:"
    echo "    build           build neat into a single file as neat.sh"
    echo "    clean           clean the old build at neat.sh"
    echo "    format          format all source and output files"
}

main() {
    case "$1" in
        "build")
            build
            ;;
        "clean")
            clean
            ;;
        "format")
            format
            ;;
        "--help" | "-h" | "")
            show_help $0
            ;;
        *)
            echo "$0: $1 is not a command. See '$0 --help'"
            ;;
    esac
}

main $@
