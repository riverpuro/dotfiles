" NeoBundle config
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

NeoBundle "Shougo/unite.vim"

NeoBundle "YankRing.vim"
NeoBundle "eregex.vim"

NeoBundle "tpope/vim-surround"
NeoBundle "tpope/vim-bundler"
NeoBundle "tpope/vim-rails"

NeoBundle "motemen/hatena-vim"

NeoBundle "tyru/skk.vim"

NeoBundle "kana/vim-fakeclip"
NeoBundle "thinca/vim-tabrecent"
NeoBundle "h1mesuke/vim-alignta"
NeoBundle "tpope/vim-repeat"
NeoBundle "vim-jp/vimdoc-ja"

NeoBundle "thinca/vim-ref"
NeoBundle "thinca/vim-quickrun"

NeoBundleCheck
