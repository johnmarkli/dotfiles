[ -z "$PS2" ] && return

function parse_git_dirty {
  git diff --no-ext-diff --quiet --exit-code &> /dev/null || echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

export CLICOLOR=1
export EDITOR='vim -f'

export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$(parse_git_branch)\\n$ "

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias gs='git status'
alias gco='git checkout'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=UTF-8
