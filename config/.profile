# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
#PATH="/home/wyl/work/makeblock/laserservice/makeblock_lasercut_firmwall/toolchains/gcc-linaro-5.5.0-2017.10-x86_64_arm-linux-gnueabihf/bin:$PATH"

PATH="/home/wyl/work/makeblock/makeblock_lasercut_firmwall/toolchains/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf/bin:$PATH"

alias g++11="g++ -std=c++11"
alias chgrep="grep -nr --include={*.c,*.h}"
alias cgrep="grep -nr --include=*.c"
alias hgrep="grep -nr --include=*.h"
alias cigrep="grep -nir --include={*.c,*.h}"
alias cdk="cd ~/allan/work/rk3399/kernel/"
