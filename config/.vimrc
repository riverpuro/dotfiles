set nocompatible
set nobackup
set hidden
set history=1000
filetype plugin indent on
scriptencoding utf-8
autocmd!

" indent
set autoindent smartindent
set expandtab
set backspace=indent,start,eol

" appearance
set background=dark
colorscheme slate
syntax enable
set showmatch
set wrap
set number
set ruler
set showcmd
set list
set listchars=tab:>-,eol:<
set laststatus=2
set statusline=%<%f[%n]\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']('.(&ft!=''?&ft:'text').')'}%=%l,%c%V%8P

highlight Pmenu    ctermfg=gray ctermbg=darkmagenta
highlight PmenuSel ctermfg=red  ctermbg=black

" tabline
function! MyTabLabel(n)
  let l:buflist = tabpagebuflist(a:n)
  let l:winnr = tabpagewinnr(a:n)
  let l:buflen = tabpagewinnr(a:n, '$')
  let l:bufname = fnamemodify(bufname(l:buflist[l:winnr - 1]), ':t')
  let l:label = a:n . ": "
  let l:label .= l:bufname == '' ? 'No name' : l:bufname
  let l:label .= '[' . l:buflen . ']'
  let l:label .= len(filter(l:buflist, 'getbufvar(v:val, "&modified")')) ? '+' : ' '
  return l:label
endfunction

function! MyTabLine()
  let l:line = ''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let l:line .= '%#TabLineSel#'
    else
      let l:line .= '%#TabLine#'
    endif
    let l:line .= '%' . (i + 1) . 'T'
    let l:line .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor
  let l:line .= '%#TabLineFill#%T'
  if tabpagenr('$') > 1
    let l:line .= '%=%#TabLine#%999Xx'
  endif
  return l:line
endfunction
set tabline=%!MyTabLine()
set showtabline=2
highlight TabLine     term=reverse   cterm=reverse   ctermfg=white ctermbg=black
highlight TabLineSel  term=underline cterm=underline ctermfg=red   ctermbg=black
highlight TabLineFill term=reverse   cterm=reverse   ctermfg=white ctermbg=black

" search
set hlsearch
set wrapscan
set noincsearch
set ignorecase
set smartcase

" behavior
set wildmenu

" mapping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <silent> <Space>ul :<C-u>undolist<CR>
nnoremap <silent> <Space>n  :<C-u>n<CR>
nnoremap <silent> <Space>N  :<C-u>N<CR>
nnoremap <silent> <Space>p  :<C-u>prev<CR>

nnoremap [TABOP] <Nop>
nmap <Space>t [TABOP]
nnoremap <silent> [TABOP]f :<C-u>tabfirst<CR>
nnoremap <silent> [TABOP]l :<C-u>tablast<CR>
nnoremap <silent> [TABOP]n :<C-u>tabn<CR>
nnoremap <silent> [TABOP]N :<C-u>tabN<CR>
nnoremap <silent> [TABOP]p :<C-u>tabp<CR>
nnoremap <silent> [TABOP]e :<C-u>tabe<CR>
nnoremap <silent> [TABOP]c :<C-u>tabc<CR>
nnoremap <silent> [TABOP]o :<C-u>tabo<CR>

nnoremap [BUFOP] <Nop>
nmap <Space>b [BUFOP]
nnoremap <silent> [BUFOP]f :<C-u>br<CR>
nnoremap <silent> [BUFOP]l :<C-u>bl<CR>
nnoremap <silent> [BUFOP]n :<C-u>bn<CR>
nnoremap <silent> [BUFOP]N :<C-u>bN<CR>
nnoremap <silent> [BUFOP]p :<C-u>bp<CR>

nnoremap <silent> <Space>cf :<C-u>crew<CR>
nnoremap <silent> <Space>cl :<C-u>cla<CR>
nnoremap <silent> <Space>cn :<C-u>cn<CR>
nnoremap <silent> <Space>cN :<C-u>cN<CR>
nnoremap <silent> <Space>cp :<C-u>cp<CR>
nnoremap <silent> <Space>r  :<C-u>registers<CR>
nnoremap <silent> <Space>l  :<C-u>ls<CR>
nnoremap <silent> <Space>m  :<C-u>marks<CR>
nnoremap <silent> <Space>j  :<C-u>tabs<CR>
nnoremap <silent> <Space>g  :<C-u>tags<CR>
nnoremap <silent> <Space>.  :<C-u>edit $MYVIMRC<CR>
function! s:toggle_quickfix_window()
""" toggle quickfixwindow http://d.hatena.ne.jp/kuhukuhun/20090119/1232343733
    let _ = winnr('$')
    cclose
    if _ == winnr('$')
        cwindow
    endif
endfunction
nnoremap <silent> <Space>q :<C-u>call <SID>toggle_quickfix_window()<CR>

" commands
command! -nargs=0 ToggleVisual setlocal number! list!
nnoremap <silent> <Leader>t :<C-u>ToggleVisual<CR>

command! -nargs=0 Lcd lcd %:h

" strftime
command! -nargs=0 AppendDate :execute "normal a".strftime("%Y-%m-%d")
command! -nargs=0 AppendNow  :execute "normal a".strftime("%c")
command! -nargs=0 AppendTime :execute "normal a".strftime("%H:%M")
command! -nargs=0 Timestamp  :execute "normal a".strftime("%Y-%m-%d %H:%M")

" enc, fenc
command! -bang -nargs=? Utf8Edit  edit<bang> ++enc=utf-8 <args>
command! -bang -nargs=? EucjpEdit edit<bang> ++enc=euc-jp <args>
command! -bang -nargs=? SjisEdit  edit<bang> ++enc=sjis <args>
command! -bang -nargs=? Cp932Edit edit<bang> ++enc=cp932 <args>
command! -nargs=0 Utf8Set  setlocal fenc=utf-8
command! -nargs=0 EucjpSet setlocal fenc=euc-jp
command! -nargs=0 SjisSet  setlocal fenc=sjis
nnoremap <Leader>eu :<C-u>Utf8Edit<CR>
nnoremap <Leader>ee :<C-u>EucjpEdit<CR>
nnoremap <Leader>es :<C-u>SjisEdit<CR>
nnoremap <Leader>ec :<C-u>Cp932Edit<CR>
nnoremap <Leader>su :<C-u>Utf8Set<CR>
nnoremap <Leader>se :<C-u>EucjpSet<CR>
nnoremap <Leader>ss :<C-u>SjisSet<CR>

let pluginconf = ".vimplugins"
if filereadable(pluginconf)
  source pluginconf
endif

let vimrcext = ".vimrcext"
if filereadable(vimrcext)
  source vimrcext
endif
