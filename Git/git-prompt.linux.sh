# grab current installed git version
CURRENT_GIT_VERSION="$(git --version | awk '{print $3}' | grep -oE '[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+')"
# grab the latest version from git-scm
LATEST_GIT_VERSION="$(curl -s https://mirrors.edge.kernel.org/pub/software/scm/git/ | grep -oE "[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]" --color | sort -rV | head -n 1)"
GIT_ALERT="🥺"
if [ "$CURRENT_GIT_VERSION" = "$LATEST_GIT_VERSION" ];
then
	GIT_ALERT="✔️"
fi 
# add Git version alreat plus the installed version
TITLEPREFIX="$GIT_ALERT Git v$CURRENT_GIT_VERSION"

PS1='\[\033]0;$TITLEPREFIX\007\]' # set window title
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'\[\033[35m\]'       # change to purple
PS1="$PS1"'\t '                # Show system time
PS1="$PS1"'\[\033[33m\]'       # change to brownish yellow
PS1="$PS1"'\w'                 # current working directory

GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
COMPLETION_PATH="$GIT_EXEC_PATH"
if test -f "$COMPLETION_PATH/git-sh-prompt"
then
	#. "$COMPLETION_PATH/git-completion.bash"
	. "$COMPLETION_PATH/git-sh-prompt"
	PS1="$PS1"'\[\033[36m\]'  # change color to cyan
	PS1="$PS1"'`__git_ps1`'   # bash function
else
	echo "Failed to setup prompt..."
fi

PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'🐧️ '                # prompt: always TUX


MSYS2_PS1="$PS1"               # for detection by MSYS2 SDK's bash.basrc

# Evaluate all user-specific Bash completion scripts (if any)
for c in "$HOME"/bash_completion.d/*.bash
do
	# Handle absence of any scripts (or the folder) gracefully
	test ! -f "$c" ||
	. "$c"
done

