# Fuzzyvim bound to ctrl+p
_fuzzyvim() {
  ~/scripts/fuzzyvim
}

zle -N _fuzzyvim
bindkey "^P" _fuzzyvim

# Show notes bound to ctrl+n
_note_show() {
  ~/scripts/note_show
}

zle -N _note_show
bindkey "^N" _note_show

# Ranger cd

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi  
    rm -f -- "$tempfile"
}

bindkey -s '^O' 'ranger-cd\n'
