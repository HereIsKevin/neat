# from https://stackoverflow.com/questions/59895/
# how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself

BP_SOURCE="${BASH_SOURCE[0]}"
while [ -h "$BP_SOURCE" ]; do # resolve $BP_SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$BP_SOURCE" )" >/dev/null 2>&1 && pwd )"
    BP_SOURCE="$(readlink "$BP_SOURCE")"
    [[ $BP_SOURCE != /* ]] && BP_SOURCE="$DIR/$BP_SOURCE" # if $BP_SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
BP_DIR="$( cd -P "$( dirname "$BP_SOURCE" )" >/dev/null 2>&1 && pwd )"

source $BP_DIR/prompt.sh
