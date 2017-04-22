# 環境変数
export LANG=ja_JP.UTF-8

if [[ -f ~/.zsh/antigen/antigen.zsh ]]; then
  source ~/.zsh/antigen/antigen.zsh
  antigen use oh-my-zsh
  antigen theme bira
  antigen apply
fi

# 色を使用出来るようにする
autoload -Uz colors
colors
export LSCOLORS=exfxcxdxbxegedabagacad

# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit -u

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# = の後はパス名として補完する
setopt magic_equal_subst

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

########################################
# エイリアス

alias la='ls -a'
alias ll='ls -l'
alias lp='ls -l peco'
alias lls='ll -S'
alias llt='ll -t'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias あとｍ='atom'

alias mkdir='mkdir -p'
alias db='cd Dropbox/'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi



########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        ;;
esac

# vim:set ft=zsh:
export PATH=$HOME/.nodebrew/current/bin:$PATH

#vimをタブで開くようにする
alias mvi="mvim --remote-tab-silent"

#
# Goolge Search by Google Chrome
#
ggl() {
    local str opt
    if [ $# != 0 ]; then
        for i in $*; do
            # $strが空じゃない場合、検索ワードを+記号でつなぐ(and検索)
            str="$str${str:++}$i"
        done
        opt='search?num=100'
        opt="${opt}&q=${str}"
    fi
    open http://www.google.co.jp/$opt
}


#現在のディレクトリをFinderで開くための設定

alias oph='open ./'

#Git関連
# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gb='git branch'
alias gbd='git branch -d '
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias gl='git log'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gpl='git pull'
alias gph='git push'
alias gss='git status -s'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'

# ----------------------
# Git Function
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }

# Utilities for Wolfram|Alpha on Terminal
alias wol="ruby ~/kkh/wolfram.rb"

#open LINE
alias cdu="cd ../"

#業務用の設定
alias kcs="ssh kcsmgr@160.16.62.96"

# OPAM configuration

. /Users/studio_graph/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# for computer architecture

export PATH=/Users/carch/bin:$PATH
alias simmips="../SimMips-0.5.5/SimMips -M ../SimMips-0.5.5/test/mem_mieru.txt"

#setting for ocaml
alias ocaml="rlwrap ocaml"

#=============================
## source auto-fu.zsh
##=============================
#if [ -f ~/.zsh/auto-fu.zsh ]; then
#source ~/.zsh/auto-fu.zsh
#function zle-line-init () {
#        auto-fu-init
#       }
#       zle -N zle-line-init
#       zstyle ':completion:*' completer _oldlist _complete
#fi
source ~/.zsh-autosuggestions/autosuggestions.zsh
# Enable autosuggestions automatically
zle-line-init() {
zle autosuggest-start
}
zle -N zle-line-init
# use ctrl+t to toggle autosuggestions(hopefully this wont be needed)
#bindkey '^T' autosuggest-toggle
# use ctrl+f to accept a suggested word
#bindkey '^F' autosuggest-execute-suggenstion
#
#setting for noti

# for postgresSQL
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# for rbenv
export PATH=$HOME/.rbenv/shims:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export LC_ALL='ja_JP.UTF-8'

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

export PATH="/Library/TeX/texbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/studio_graph/miniconda3/bin:$PATH"

alias pf='ssh -fN -L8888:localhost:8888 share2'
