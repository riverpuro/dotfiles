" plugins
let s:vimdir = "~/.vim"

" skk.vim
let skk_jisyo = s:vimdir . '/skk/skk-jisyo'
let skk_large_jisyo = s:vimdir . '/skk/SKK-JISYO.L'
let skk_auto_save_jisyo = 1
let skk_keep_state = 0
let skk_egg_like_newline = 0
let skk_show_annotation = 1
let skk_use_face = 1

" yankring.vim
let g:yankring_history_dir = s:vimdir . '/info'
let g:yankring_max_history = 200
let g:yankring_max_display = 200
let g:yankring_window_use_separate = 1
let g:yankring_window_height = 13
nnoremap <silent> <Space>y :YRShow<CR>
command! -nargs=1 Y YRSearch <args>

" tabrecent.vim
command! -bang -nargs=? T TabRecent<bang> <args>
nnoremap <silent> <Space>tt :<C-u>TabRecent<CR>

" surround.vim
let g:surround_{char2nr("n")} = "<\1tagname: \r..*\r&\1\2attribute: \r..*\r &\2\3value: \r..*\r=\"&\"\3>\r</\1\1>"
let g:surround_{char2nr("a")} = "<a href=\"\r\">\1link\ text: \1</a>"

" matchit
source $VIMRUNTIME/macros/matchit.vim

" align.vim
let g:Align_xstrlen = 3

" unite.vim
let g:unite_data_directory = s:vimdir . '/info/.unite'
let g:unite_enable_start_insert = 1
nnoremap [ANYTHING] <Nop>
nmap <Space>f [ANYTHING]
nnoremap <silent> [ANYTHING]f  :<C-u>Unite file<CR>
nnoremap <silent> [ANYTHING]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [ANYTHING]l  :<C-u>Unite buffer<CR>
nnoremap <silent> [ANYTHING]r  :<C-u>Unite register<CR>
nnoremap <silent> [ANYTHING]a :<C-u>Unite mark<CR>
nnoremap <silent> [ANYTHING]m  :<C-u>Unite file_mru<CR>
nnoremap <silent> [ANYTHING]d  :<C-u>Unite directory_mru<CR>
nnoremap <silent> [ANYTHING]u  :<C-u>Unite source<CR>
nnoremap <silent> [ANYTHING]j  :<C-u>Unite tab<CR>
nnoremap <silent> [ANYTHING]tt :<C-u>Unite tab<CR>
nnoremap <silent> [ANYTHING]tb :<C-u>Unite buffer_tab<CR>
nnoremap <silent> [ANYTHING]o  :<C-u>Unite outline<CR>
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  imap <buffer> <C-c> <Plug>(unite_exit)
endfunction

nnoremap <silent> [TABOP]u :<C-u>Unite tab<CR>

let g:eregex_default_enable = 0

" ALE
let g:ale_lint_on_enter = 0

let g:ale_linters = {
      \  'python': ['flake8', 'mypy', 'pylint']
      \}

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'python': ['autopep8', 'isort'],
      \}
