# general aliases
alias ls='ls --color=auto'
alias rm='rm -iv '

# window manager aliases
alias rp='ratpoison '

# systemctl aliases
alias sc='sudo systemctl '
alias scs='sudo systemctl status '
alias scr='sudo systemctl restart '
alias scd='sudo systemctl daemon-reload'
alias scdr='scd; scr'
alias sch='sudo systemctl hibernate'
alias scu='systemctl --user '
alias scus='systemctl --user status '
alias scur='systemctl --user restart '
alias scud='systemctl --user daemon-reload'
alias scudr='scud; scur'
alias jc='journalctl '

# pacman aliases
alias pacupg='sudo pacman -Syu'                    # Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacin='sudo pacman -S'                       # Install specific package(s) from the repositories
alias pacins='sudo pacman -U'                      # Install specific package not from the repositories but from a file 
alias pacre='sudo pacman -R'                       # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'                    # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'                          # Display information about a given package in the repositories
alias pacreps='pacman -Ss'                         # Search for package(s) in the repositories
alias pacloc='pacman -Qi'                          # Display information about a given package in the local database
alias paclocs='pacman -Qs'                         # Search for package(s) in the local database
alias paclo="pacman -Qdt"                          # List all packages which are orphaned
alias paclli="pacman -Qm"                          # List all *l*ocally *i*nstalled packages, so mostly from AUR
alias pacc="sudo pacman -Scc"                      # Clean cache - delete all not currently installed package files
alias paclf="pacman -Ql"                           # List all files installed by a given package
alias pacexpl="pacman -D --asexp"                  # Mark one or more installed packages as explicitly installed 
alias pacimpl="pacman -D --asdep"                  # Mark one or more installed packages as non explicitly installed
alias pacro="pacman -Qtdq > /dev/null &&\
             sudo pacman -Rns \$(pacman -Qtdq |\
             sed -e ':a;N;$!ba;s/\n/ /g')"         # '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacupd='sudo pacman -Sy && sudo abs'         # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'            # Install given package(s) as dependencies
alias pacmir='sudo pacman -Syy'                    # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias pacunlock="sudo rm /var/lib/pacman/db.lck"   # Delete the lock file /var/lib/pacman/db.lck
alias paclock="sudo touch /var/lib/pacman/db.lck"  # Create the lock file /var/lib/pacman/db.lck

# aurget aliases
#alias aurget='aurget --nocolor --edit --nodeps --nodiscard --builddir $HOME/Code/archlinux/builds '
#alias aurget_unsafe='aurget --nocolor --edit --deps --devel --rebuild --discard --builddir $HOME/Code/archlinux/builds '

# emacs aliases
alias e="emacsclient --tty --alternate-editor=emacs"
# alias: invoke emacsclient, but with GUI not in tty/terminal mode.
alias eg="emacsclient --no-wait --create-frame --alternate-editor=emacs"

# vim aliases
alias vi='vim '

# alias: quicker shortcut to open file with xdg-open
alias o='mimeopen '
alias open='mimeopen '
