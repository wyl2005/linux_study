# Setup fzf
# ---------
if [[ ! "$PATH" == */home/wyl/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/wyl/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/wyl/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/wyl/.fzf/shell/key-bindings.bash"
