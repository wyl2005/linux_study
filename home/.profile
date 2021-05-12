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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#PATH="$PATH:/mnt/d/work/toolchain/gcc-arm-none-eabi-6_2-2016q4/bin"
# PATH="$PATH:/mnt/d/work/toolchain/gcc-arm-none-eabi-4_9-2014q4/bin"
#PATH="$PATH:/mnt/d/work/toolchain/gcc-arm-none-eabi-9-2019-q4-major/bin"
PATH="$PATH:/mnt/d/work/local/bin:/mnt/d/work/local/nvim-linux64/bin"

alias gcc_path="echo /mnt/d/work/toolchain/gcc-arm-none-eabi-9-2019-q4-major/bin/"

alias set_gcc4_9="PATH=/home/${USER}/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Users/wyl/DOCUME~1/MobaXterm/slash/bin:/mnt/c/Windows/:/mnt/c/Windows/system32/:/snap/bin:/home/wyl/.fzf/bin:/mnt/d/work/local/bin:/mnt/d/work/toolchain/gcc-arm-none-eabi-4_9-2014q4/bin; arm-none-eabi-gcc -v"

alias set_gcc8="PATH=/home/${USER}/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Users/wyl/DOCUME~1/MobaXterm/slash/bin:/mnt/c/Windows/:/mnt/c/Windows/system32/:/snap/bin:/home/wyl/.fzf/bin:/mnt/d/work/local/bin:/mnt/d/work/toolchain/gcc-arm-none-eabi-8-2019-q3-update/bin; arm-none-eabi-gcc -v"

alias set_gcc9="PATH=/home/${USER}/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Users/wyl/DOCUME~1/MobaXterm/slash/bin:/mnt/c/Windows/:/mnt/c/Windows/system32/:/snap/bin:/home/wyl/.fzf/bin:/mnt/d/work/local/bin:/mnt/d/work/toolchain/gcc-arm-none-eabi-9-2019-q4-major/bin; arm-none-eabi-gcc -v"

alias set_gcc9_noccache="PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Users/wyl/DOCUME~1/MobaXterm/slash/bin:/mnt/c/Windows/:/mnt/c/Windows/system32/:/snap/bin:/home/wyl/.fzf/bin:/mnt/d/work/local/bin:/mnt/d/work/toolchain/gcc-arm-none-eabi-9-2019-q4-major/bin; arm-none-eabi-gcc -v"

export PATH="/home/${USER}/.bin:$PATH"
export PATH="$PATH:/mnt/d/work/toolchain/gcc-arm-none-eabi-9-2019-q4-major/bin"

alias g++11="g++ -std=c++11"

alias grep="grep --color=auto"

alias chgrep="grep -nr --include={*.c,*.cpp,*.h,*.S}"
alias cgrep="grep -nr --include={*.c,*.cpp,*.S}"
alias hgrep="grep -nr --include=*.h"
alias agrep="grep -nir --include={*.c,*.cpp,*.h,*.S,*.mk,Makefile} --exclude={*.o,*.a,*.out,tags}"
alias cdk="cd ~/allan/work/rk3399/kernel/"

alias ll="ls -al"
alias cdw="cd /mnt/d/work"
alias cdd="cd /mnt/d/work/ew010"
alias cde="cd /mnt/d/work/EM028_overseas"
alias git_modified="git st . | grep \"modified:\" | awk '{print \$2}' | xargs "

alias cr='ctags -R --fields=+lS && cscope -Rbq'

# sudo service binfmt-support start
export LC_ALL=zh_CN.UTF-8

export GIT_SSL_NO_VERIFY=1


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
# fd
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
# export FZF_DEFAULT_COMMAND="fd --exclude={*.a,*.o,.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#ripgrep
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules}/*" 2> /dev/null'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="rg --sort-files --files --null 2> /dev/null | xargs -0 dirname | uniq"

# CTRL-T - Paste the selected files and directories onto the command-line
# CTRL-R - Paste the selected command from history onto the command-line
# ALT-C - cd into the selected directory

