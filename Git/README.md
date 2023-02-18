# Git

This folder contains configuration files for Git.

Order of operations on a new environment, run the following:

1. `setup-git.sh`
2. `setup-prompt.sh`

## Details

### setup-prompt.sh

Updated git-prompt.sh file that changes the Git Bash shell.
It will update the title to show the version of Git installed
along with an error icon if ```git-scm.com``` contains a newer
version of Git.  It also modifies the prompt along with a better
cursor.

It currently splits into two different modes:

1. Windows Git Bash setup
2. Linux Bash setup

Due to environment differences the same file can't be used on the same
platforms.

### setup-git.sh

Sets up the Git environment:

1. the SSH key to connect to the remote Git server
2. Generate the GPG key needed to sign Git commits
3. Setup the account information for the Git profile

There are two prompts:

1. Email address to use
2. User name to use, this will be used to pull GPG key id

#### SSH Key Gen

The SSH key gen runs the `ssh-keygen` command targeting a key type of:

> ed25519

#### GPG Key Gen

The GPG key generated is with default settings.  This includes storing the GPG
key id to an environment variable.

#### Git Profile

This will set the:

- username
- email
- GPG signing key
- Auto enforce signing git commits
- Set VIM as the editor for commit messages
