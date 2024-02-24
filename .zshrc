function cd() {
    if [[ $# -eq 1 && -f "$1" ]] ; then
        echo "(Going to containing dir)"
        builtin cd "$(dirname $1)"
    else
        builtin cd "$@"
    fi
}
