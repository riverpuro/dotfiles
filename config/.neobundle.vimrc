" NeoBundle config
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

let vimproc_updcmd = has('win64') ?
      \ 'tools\\update-dll-mingw 64' : 'tools\\update-dll-mingw 32'
execute "NeoBundle 'Shougo/vimproc.vim'," . string({
      \ 'build' : {
      \     'windows' : vimproc_updcmd,
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ })

NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/neomru.vim"

NeoBundle "YankRing.vim"
NeoBundle "othree/eregex.vim"

NeoBundle "tpope/vim-surround"
NeoBundle "tpope/vim-bundler"
NeoBundle "tpope/vim-rails"

NeoBundle "motemen/hatena-vim"

NeoBundle "tyru/skk.vim"

NeoBundle "kana/vim-fakeclip"
NeoBundle "thinca/vim-tabrecent"
NeoBundle "junegunn/vim-easy-align"
NeoBundle "tpope/vim-repeat"
NeoBundle "vim-jp/vimdoc-ja"

NeoBundle "thinca/vim-ref"
NeoBundle "thinca/vim-quickrun"

NeoBundle "timcharper/textile.vim"
NeoBundle "slim-template/vim-slim"

NeoBundle 'derekwyatt/vim-scala'

NeoBundle 'udalov/kotlin-vim'
NeoBundle 'pangloss/vim-javascript'

NeoBundle 'fatih/vim-go'

NeoBundle 'Vimjas/vim-python-pep8-indent'
NeoBundle 'dense-analysis/ale'

NeoBundleCheck

call neobundle#end()
