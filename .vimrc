let $LANG = 'en'
set nocompatible              " be iMproved, required
filetype off                  " required
set re=1

if has("autocmd")
  " Restore cursor position
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/tComment'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'

"Color
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'machakann/vim-colorscheme-kemonofriends'
Plugin 'morhetz/gruvbox'

" For easily move, try ,,w ,,f{char}
Plugin 'Lokaltog/vim-easymotion'

Plugin 'tpope/vim-bundler'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'

" Sidebar like IDE
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'

" For fuzzy find
" Plugin 'rking/ag.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" Ruby and rails
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'kana/vim-textobj-user'  "define text objct
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'thoughtbot/vim-rspec'

Plugin 'google/vim-searchindex'
" Plugin 't9md/vim-choosewin'

Plugin 'machakann/vim-highlightedyank'

Plugin 'scrooloose/vim-slumlord'
Plugin 'aklt/plantuml-syntax'

" For React syntax highlight
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Plugin 'mhinz/vim-startify'
call vundle#end()            " required

let g:NERDTreeHijackNetrw=0

filetype plugin indent on

" For clever completion with the :find command
set path+=**

" Display all matching files when we tab complete
set wildmenu

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=200
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set autowrite     " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" if executable('ag')
"   " Use Ag over Grep
"   set grepprg=ag\ --nogroup\ --nocolor
" 
"   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'
" 
"   " ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
" 
"   if !exists(":Ag")
"     " command -nargs=+ -complete=file -bar Ag ! grep! <args>|cwindow|redraw!
"     " comment out here because i need search in reverse direction
"     " nnoremap <Leader>\ :Ag<SPACE>
"   endif
" endif

" line numbers
set number relativenumber
set lazyredraw

set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
" set wildmode=list:longest,list:full
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<Tab>"
"     else
"         return "\<C-p>"
"     endif
" endfunction
" inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
" inoremap <S-Tab> <C-n>

" Switch between the last two files
nnoremap <Leader>b <C-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell
setglobal complete-=i

" Always use vertical diffs
set diffopt+=vertical

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" ctrap
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Leader
let mapleader=","
noremap \ ,

" For fzf

" Let fzf ignore the files which is ignored by gitignore or hgignore
if executable("ag") == 1
  let $FZF_DEFAULT_COMMAND='ag -g ""'
  let g:fzf_tmux_height = 200
endif

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" bind K to grep word under cursor
nnoremap K :Rg<CR>"\b<C-R><C-W>\b"
" nmap K :call fzf#vim#grep('ag --nogroup --column --color ^', 1)<cr>
" binding.pry
" nnoremap <C-p> :call fzf#vim#files('', fzf#vim#with_preview('right'))<cr>
nnoremap <Leader>f :FZF!<CR>

" For quicker buffer movement
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" For quicker quit and save
map <Leader>z ZZ
map <Leader>x ZQ
nmap <Leader>w :w<CR>

" For tab
nmap <Leader><c-t> <esc>:tabnew<CR>
map <Leader>ct :tabclose<CR>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tagbar#enabled = 0

let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" For VundleInstall
map <Leader>pi :PluginInstall<CR>

" map <Leader><Leader>b obyebug<esc>:w<CR>
map <Leader><Leader>b obinding.pry<esc>:w<CR>

" For pwd to clipboard
nnoremap <Leader>pcb :let @+=expand('%:p')<CR>

" NERD tree
let NERDChristmasTree=1
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let g:NERDTreeWinSize=40
let NERDTreeWinPos="left"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

" Open a NERDTree
nmap <F5> :NERDTreeToggle<cr>

" Color scheme
" colorscheme jellybeans
" colorscheme molokai
" highlight NonText guibg=#060606
" highlight Folded  guibg=#0A0A0A guifg=#9090D0
" colorscheme kemonofriends
colorscheme gruvbox
set background=dark

" status bar
set laststatus=2 " Always display the status line

" Rspec
let g:rspec_command = "Dispatch rspec {spec}"
" let g:rspec_command = "compiler rspec | set makeprg=zeus | Make test {spec}"
let g:rspec_runner = "os_x_iterm2"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" For large dispatch quickwindow
let g:dispatch_quickfix_height = 30

" paste only register
map <Leader>pr "0p

" Faster quickfix window resize
map <Leader>qr1 :copen<CR>:resize + 10
map <Leader>qr2 :copen<CR>:resize + 20
map <Leader>qvr1 :copen<CR>:vertical resize + 10
map <Leader>qvr2 :copen<CR>:vertical resize + 20

" Faster window resize
map <Leader>vw :vertical resize +20<CR>
map <Leader>rw :resize +20<CR>

" Easier system copy/paste
noremap <Leader>y "+y
noremap <Leader><c-v> "+p

set tags=./tags,tags;$HOME

" For choose win
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" For nerdcomment
let g:NERDSpaceDelims = 1

command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ','), "\n")
endfunction

augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

map <Leader><Leader>rn :call RenameFile()<cr>

" For quicker enter normal model after pressing esc
" set timeoutlen=1000 ttimeoutlen=0


" For vim highlightyank
let g:highlightedyank_highlight_duration = 200

" For snippet trigger
imap <C-J> <Plug>snipMateNextOrTrigger
map <C-J> <Plug>snipMateNextOrTrigger

" Easymotion setting
let g:EasyMotion_smartcase = 1
" nmap <leader><leader>s <Plug>(easymotion-overwin-f)
nmap <leader><leader>a <Plug>(easymotion-overwin-f2)
nmap <leader>e <Plug>(easymotion-w)
nmap <leader><c-e> <Plug>(easymotion-b)
" nmap <leader><leader>la <Plug>(easymotion-overwin-line)
" nmap <Leader><leader>wa <Plug>(easymotion-overwin-w)

" Fix problem in nerdtree
let g:NERDTreeNodeDelimiter = "\u00a0"

" For vimrc edition
map <Leader><c-m> :e $MYVIMRC<CR>
nmap <Leader><c-r> :so $MYVIMRC<cr>

" For close current buffer and move to previous without lose split window
nnoremap <Leader>bd :bp\|bd #<CR>

" Select whole file
map <leader><C-a> <esc>ggVG<CR>

" abbreviation for react

iabbrev mstp const mapStateToProps = state =>
iabbrev mdtp const mapDispatchToProps = dispatch =>
iabbrev csl console.log
