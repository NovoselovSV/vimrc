set encoding=utf-8

call plug#begin('~/vimfiles/plugged')

Plug 'tpope/vim-commentary'
"comment line = gcc
"comment area = gc[area]

Plug 'jeetsukumaran/vim-pythonsense'
"class area = <action>[ai]c
"function area = <action>[ai]f
"docstring area = <action>[ai]d

Plug 'preservim/nerdtree'
"Toggle = <c-n>

Plug 'dense-analysis/ale'
let g:ale_fixers = {'python': 'yapf'}
"Lint - flake8
"Fix - yapf
"ALEFix = <F3>

Plug 'SirVer/ultisnips'
"UltiSnips snipets engine
Plug 'honza/vim-snippets'
"Default snipets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plug 'tpope/vim-fugitive'
":Gedit HEAD~3:% loads the current file as it existed 3 commits ago.
":Gdiffsplit (or :Gvdiffsplit) brings up the staged version of the file side by side with the working tree version.
":Gread is a variant of git checkout -- filename that operates on the buffer rather than the file itself.
":Gwrite writes to both the work tree and index versions of a file, making it like git add when called from a work tree file and like git checkout when called from the index or a blob in history.
":Ggrep is :grep for git grep. :Glgrep is :lgrep for the same.

Plug 'tmsvg/pear-tree'
"auto pair

Plug 'morhetz/gruvbox'
autocmd vimenter * ++nested colorscheme gruvbox
"colorsheme

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

Plug 'ryanoasis/vim-devicons'
"fonts

Plug 'davidhalter/jedi-vim'
"Autocompletion
"To change selection = (Ctrl+Space)
"To pydock = Shift+k

Plug 'puremourning/vimspector'
"debugger

Plug 'liuchengxu/vista.vim'
"Toggle = <F2>

call plug#end()


set guifont=Monaco\ 14

"To pretty pasting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

colorscheme gruvbox
set background=dark
set number
set expandtab
set tabstop=2

set hlsearch
set incsearch

nmap <F2> :Vista!!<CR>
nmap <F3> :ALEFix<CR>
map <C-n> :NERDTreeToggle<CR>
nmap <F5> :w<CR>:!python3 %<CR>

"settings to debugger
"leader \
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver
let g:vimspector_adapters = #{
      \   test_debugpy: #{ extends: 'debugpy' }
      \ }

let g:vimspector_configurations = {
      \ "test_debugpy_config": {
      \   "adapter": "test_debugpy",
      \   "filetypes": [ "python" ],
      \   "configuration": {
      \     "request": "launch",
      \     "type": "python",
      \     "cwd": "${fileDirname}",
      \     "args": [],
      \     "program": "${file}",
      \     "stopOnEntry": v:false,
      \     "console": "integratedTerminal",
      \     "integer": 123,
      \   },
      \   "breakpoints": {
      \     "exception": {
      \       "raised": "N",
      \       "uncaught": "",
      \       "userUnhandled": ""
      \     }
      \   }
      \ } }

"to Vista
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
