# aliases
alias ls='ls -G'
alias vi=vim

# appearance
autoload -U colors; colors
case "${TERM}" in
    "kterm*"|"xterm*")
    precmd() {
        echo -ne "\033]0;${USER}@${HOST}:${PWD}\007"
    }
    ;;
    "screen")
    preexec() {
        # see [zsh-workers:13180]
        # http://www.zsh.org/mla/workers/2000/msg03993.html
        emulate -L zsh
        local -a cmd; cmd=(${(z)2})
        echo -n "\ek$cmd[1]:t\e\\"
        #echo -ne "\ek${1%% *}\e\\"
    }
    precmd() { echo -n "\ekzsh\e\\" }
    ;;
esac

PROMPT='%n@%m:%~%# '
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "

# history
HISTFILE=$HOME/.zsh_history  # ヒストリ保存ファイル
HISTSIZE=1000                # メモリ内の履歴の数
SAVEHIST=10000               # 保存される履歴の数

# 補完つかう
autoload -U compinit; compinit # -u
# 補完の時に大文字小文字を区別しない (但し、大文字を打った場合は小文字に変換しない)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 一部のコマンドライン定義は、展開時に時間のかかる処理を行う
# -- apt-get, dpkg (Debian), rpm (Redhat), urpmi (Mandrake), perlの-Mオプション, bogofilter (zsh 4.2.1以降), fink, mac_apps (MacOS X)(zsh 4.2.2以降)
zstyle ':completion:*' use-cache true
# 補完候補を ←↓↑→ で選択 (補完候補が色分け表示される)
zstyle ':completion:*:default' menu select=1

## キーバインドとか
# 端末設定
stty    erase   '^H'        # Ctrl+H に 1 文字削除
stty    intr    '^C'        # Ctrl+C に割り込み
stty    susp    '^Z'        # Ctrl+Z にサスペンド
# emacs っぽく
bindkey -e
# カーソル位置から前方削除 (vim のコマンドモードの ^u みたいな)
# override kill-whole-line
bindkey '^U' backward-kill-line
# history incremental search
bindkey "^R" history-incremental-search-backward
# ls /usr/local/etc などと打っている際に、C-w で単語ごとに削除
# default  : ls /usr/local → ls /usr/ → ls /usr → ls /
# この設定 : ls /usr/local → ls /usr/ → ls / (vim の(ry
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# ほか
setopt prompt_subst          # プロンプトに escape sequence (環境変数) を通す
setopt auto_cd               # ディレクトリのみで移動
setopt auto_list             # ^Iで補完可能な一覧を表示する(補完候補が複数ある時に、一覧表示)
setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt append_history        # 履歴を追加 (毎回 .zhistory を作るのではなく)
setopt inc_append_history    # 履歴をインクリメンタルに追加
setopt share_history         # 履歴の共有
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_space     # スペースで始まるコマンド行はヒストリリストから削除
                             # (→ 先頭にスペースを入れておけば、ヒストリに保存されない)
setopt no_flow_control       # C-s/C-q によるフロー制御を使わない
setopt ignore_eof            # C-dでログアウトしない
setopt no_beep               # コマンド入力エラーでBeepを鳴らさない
setopt interactive_comments  # コマンド入力中のコメントを認める
setopt print_eightbit        # 8 ビット目を通すようになり、日本語のファイル名などを見れるようになる

# site option
if [[ -s "$HOME/.zshrc.site" ]]  ; then source "$HOME/.zshrc.site" ; fi

# zaw
if [[ -s "$HOME/.zsh/zaw/zaw.zsh" ]] ; then
  source "$HOME/.zsh/zaw/zaw.zsh"
  bindkey '^R' zaw-history
fi

# z
if [[ -s "$HOME/.zsh/z/z.sh" ]] ; then
  source "$HOME/.zsh/z/z.sh"
fi

# pyenv
eval "$(pyenv init -)"
