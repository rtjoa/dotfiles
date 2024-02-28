######################
# configure zsh prompt
#######################

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats       \
    '%F{35}[%b]%f'
precmd () { vcs_info }
setopt prompt_subst
PS1=''
PS1+='%F{1}%(?..[%?]'$'\n'')%f' # return code and newline if code is nonzero
PS1+='${vcs_info_msg_0_}' # vcs info
PS1+='%B%F{blue}%~%f%b' # working directory
PS1+='$ '

# not sure what these do, but ok! 
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

#######################
# aliases and utility
#######################

alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'

function cd() {
    if [[ $# -eq 1 && -f "$1" ]] ; then
        echo "(Going to containing dir)"
        builtin cd "$(dirname $1)"
    else
        builtin cd "$@"
    fi
}

swap() {
	if [ $# -ne 2 ]; then
		echo "usage: swap FILE1 FILE2"
		return 1
	fi
    # local TMPFILE=tmp.$$
	TMPFILE="tempfiledontnamestuffthis" # i'd rather be able to get my file back if something goes wrong
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE "$2"
}

# code with extra tests, meant to be called as a utility in other scripts
# will not open code if not exists (e.g. might not be accessible from tmux), and
# will only open files
tcode() {
	if [ $# -ne 1 ]; then
		echo "usage: tcode FILE"
		return 1
	fi
	if [ -n $(which code) ]; then
		if ! [ -f $1 ]; then
			echo "$1 not found"
			return 1
		fi
		code $@
	fi
}

#######################
