call plug#begin('~/.vim/plugged')
Plug 'powerline/fonts'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/groovyindent-unix'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-abolish'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'qpkorr/vim-bufkill'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'plasticboy/vim-markdown'
Plug 'nelstrom/vim-markdown-folding'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'mzlogin/vim-markdown-toc'
Plug 'matze/vim-move'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-rooter'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Set up deoplete
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

Plug 'Julian/vim-textobj-brace'
Plug 'jasonlong/vim-textobj-css'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-line'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-variable-segment'

Plug 'christoomey/vim-tmux-navigator'
Plug 'milkypostman/vim-togglelist'
Plug 'sodapopcan/vim-twiggy'
Plug 'tpope/vim-unimpaired'
Plug 'stephpy/vim-yaml'

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'micha/vim-colors-solarized'


" Install nightly build, replace ./install.sh with install.cmd on windows
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
" Or install latest release tag
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" Or build from source code
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Keep the icons loading last
Plug 'ryanoasis/vim-devicons'
call plug#end()




"set background=dark
"colorscheme solarized
color dracula

set encoding=UTF-8

" set up tab spacing
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
set autoindent
set smartindent

autocmd FileType python setlocal nosmartindent

" Stop vim-json or syntastic from setting the filetype of .template files to json                                                                                                                        
autocmd BufRead,BufNewFile *.template set filetype=text

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Treat other file types as zip files
autocmd BufReadCmd *.jar,*.xpi,*.jar,*.xpi,*.apk,*.crx call zip#Browse(expand("<amatch>"))

" Insert a newly generated UUID at the cursor position
command! Uuid execute "normal! i".system('uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "\n"')

" searching
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set ignorecase
set smartcase
set incsearch
set hlsearch

set title
set nocompatible

" keep 3 lines of context when scrolling
set scrolloff=3

set laststatus=2
set t_Co=256
set showmode
set showcmd
" Reduce delay waiting for a mapping/key code to complete
set timeoutlen=500
set ttimeoutlen=50

" Tab completion in command mode like zsh
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set wildmenu
"set wildmode=full
set wildmode=list:longest,list:full
set wildignore=.git,*.swp,*/tmp/*

" Markdown specific settings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Don't break lines on words in markdown
autocmd Filetype markdown setlocal linebreak

" Specify languages to ssyntax highlight in markdown code blocks
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'xml', 'json', 'html', 'python', 'bash=sh', 'java']


" Live life on the edge - don't create swap files
set noswapfile

if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j " Delete comment character when joining commented lines
endif

" Folding stuff
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Enable folding but open all folds on open
set foldenable
set foldmethod=indent
if has("autocmd")
    au BufRead * normal zR
endif

autocmd Filetype gitcommit setlocal nofoldenable
autocmd Filetype markdown setlocal foldenable

" Set fold level                                                                                                                                                                  
nmap z0 :set foldlevel=0<CR>
nmap z1 :set foldlevel=1<CR>
nmap z2 :set foldlevel=2<CR>
nmap z3 :set foldlevel=3<CR>
nmap z4 :set foldlevel=4<CR>
nmap z5 :set foldlevel=5<CR>
nmap z6 :set foldlevel=6<CR>
nmap z7 :set foldlevel=7<CR>
nmap z8 :set foldlevel=8<CR>
nmap z9 :set foldlevel=9<CR>

" Set the current working directory to that of the active file
"autocmd BufEnter * silent! lcd %:p:h









" Assorted key bindings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use space as the leader                                                                                                                                                          
map <space> <leader>

" Specific mapping for easymotion
map <space><space> <leader><leader>

" Maximise a window pane
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>


" Rebalance window panes
nnoremap <leader>= :wincmd =<cr>

" Swap j <=> gj and k <=> gk
" Also  prevent the swap if a count has been prefixed, e.g. 10k
" to move 10 lines down, thus 10 moves 10 actual lines, not 10 visual lines
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap gj j
nnoremap gk k

" K to split a line
nnoremap K i<CR><Esc>

" Now remap gJ to J for cases when we want to do the opposite
nnoremap gJ J

" Like gJ, but always remove spaces
fun! JoinSpaceless()
    execute 'normal gJ'

    " Character under cursor is whitespace?
    if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
        " When remove it!
        execute 'normal dw'
    endif
endfun

" Replace default J behaviour with one that doesn't add the extra space between
" joined lines
nnoremap J :call JoinSpaceless()<CR>

" Buffer cycling
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Y yanks to end of line
nmap Y y$

" Make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Get rid of highlighting
noremap <leader>h :noh<CR>

" Insert the current git branch name, stripping the text after the issue                                                                                                                             
" number, e.g. inserts "gh-123 " if the branch is "gh-123-some-issue"                                                                                                                                
noremap <leader>i :-1read ![[ "$(pwd)" =~ .*/\.git ]] && cd ..; git rev-parse --abbrev-ref HEAD \| sed -E "s/^(gh-[0-9]+).*$/\1 /"<CR>A

" Hitting jk/kj will jump out of insert mode
inoremap jk <esc>
inoremap kj <esc>

" Toggle line wrapping
nnoremap <leader>w :set wrap!<cr>

" Make C-Space do the same as C-n. C-Space is seen by vim as C-@
inoremap <C-@> <C-n>

" toggle spell checking in the local buffer with F7
" There is an issue with Conoline hiding the spelling errors on the current
" line so turning on spelling current disables conoline. Temporary hack
" till I can work out how to fix it.
map <F7> :ConoLineToggle<CR>:setlocal spell! spelllang=en_gb<CR>









" Window split stuff
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" window split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Vertical split
noremap <leader>v :vsp<CR><C-w><C-w>

" Horizontal split
noremap <leader>s :sp<CR><C-w><C-w>

" Insert shell colour constants for use in 'echo -e'                                                                                                                                                  
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
noremap <leader>colours :set paste<CR>i#Colour constants for use in echo -e statements<CR>RED='\033[1;31m'<CR>GREEN='\033[1;32m'<CR>YELLOW='\033[1;33m'<CR>BLUE='\033[1;34m'<CR>NC='\033[0m' # No Colour<CR><ESC>:set nopaste<CR>
noremap <leader>blu i${BLUE}<ESC>
noremap <leader>red i${RED}<ESC>
noremap <leader>grn i${GREEN}<ESC>
noremap <leader>yel i${YELLOW}<ESC>
noremap <leader>nc i${NC}<ESC>
"insert an 'echo -e ""' and put it in insert mode in the quotes
noremap <leader>echo iecho -e ""<ESC>i







" line numbering
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set relativenumber
set number
if !has('nvim')

    "Toggle between line number states (relative|absolute|none)
    function! NumberToggle()
      if !exists("b:curr_num_state")
          let b:curr_num_state = "rel"
      endif

      if(b:curr_num_state ==# "rel")
        set number
        set norelativenumber
        let b:curr_num_state = "abs"
      elseif(b:curr_num_state ==# "abs")
        set nonumber
        set norelativenumber
        let b:curr_num_state = "none"
      else
        set relativenumber
        set number
        let b:curr_num_state = "rel"
      endif
    endfunc

    nnoremap <C-n> :call NumberToggle()<cr>
endif








" Cursor keys == BAD!
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"  Prevent use of cursor keys in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Prevent use of cursor keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>







" Script to stop vim overwriting the default register
" when pasting over a visual selection
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" I haven't found how to hide this function (yet)
function! RestoreRegister()
    let @" = s:restore_reg
    if &clipboard == "unnamed"
        let @* = s:restore_reg
    elseif &clipboard == "unnamedplus"
        let @+ = s:restore_reg
    elseif &clipboard == "unnamed,unnamedplus"
        let @* = s:restore_reg
        let @+ = s:restore_reg
    endif
    return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()








" GitGutter stuff
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Toggle gigGutter
noremap <leader>gg :GitGutterToggle<CR>

" Toggle gigGutter lines colouring
noremap <leader>gl ::GitGutterLineHighlightsToggle<CR>

let g:gitgutter_enabled = 1

" Change the gutter symbols
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
"let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed = '━'
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = '⛔'









"NERDTree
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let NERDTreeQuitOnOpen = 1
let g:NERDTreeChDirMode = 1
nnoremap <leader>' :NERDTreeToggle<cr>









"syntastic settings
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
" Stop syntastic from checking java files
let g:loaded_syntastic_java_javac_checker = 1
let g:syntastic_python_checkers=['flake8']








"vim-markdown stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_toc_autofit = 1
let g:move_key_modifier = 'M'
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'xml', 'json']








"vim-move
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if !has('nvim')
    execute "set <M-j>=\ej"
    nnoremap <M-j> j
    execute "set <M-k>=\ek"
    nnoremap <M-k> k
endif









" FZF (FuzzyFinder)
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"un-comment and chnage this to make vim behave differently to FZF in the shell
"let $FZF_DEFAULT_COMMAND= 'ag --hidden -g ""'

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Keyword'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Keyword'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

function! s:current_word()
  return expand('<cword>')
endfunction

"find files from the git root, rather than current dir
command! ProjectFiles execute 'Files!' s:find_git_root()

"find occurences from the git root, rather than current dir
command! WordOccurences execute 'Ag!' s:current_word() s:find_git_root()

" Use FZF to change current directory to a direct child of the passed
" directory
command! -nargs=* -complete=dir Cd call fzf#run(fzf#wrap(
  \ {'source': 'find '.(empty(<f-args>) ? '.' : <f-args>).' -maxdepth 1 -type d -not -wholename "./.git*"',
  \  'sink': 'cd'}, 1))

"Use FZF/Ag to list occurances of current word (smart case match)
"nmap <leader>o :Ag! <C-R><C-w> call s:find_git_root()<CR>
nmap <leader>o :WordOccurences<CR>
"open FZF in lines mode
nmap <leader>l :Lines!<CR>
"open FZF in files mode, rooted at the current git root
nmap <leader>p :ProjectFiles<CR>
"open FZF in bUffer mode, 'b' is quite slow as there are other b... maps
nmap <leader>u :Buffers!<CR>
"open FZF in history mode (Most recently used)
nmap <leader>m :History!<CR>
"open FZF in files mode in the root of git_work
nmap <leader>gw :Files! ~/git_work<CR>
" Use FZF to change current directory to one of the git repos in git_work
nmap <leader>d :Cd ~/git_work<CR>






" ag - The Silver Searcher
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if executable('ag')
  " Use ag instead of ack
  let g:ackprg = 'ag --vimgrep'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif







"fugitive (git) stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nmap <leader>g :Gstatus<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gp :Gpush<CR>
set diffopt+=vertical








"vim-sneak stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"enable smart streak mode
let g:sneak#streak = 1 








" conoline.vim stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"use colour scheme's colours for normal mode
let g:conoline_use_colorscheme_default_normal=1

if &diff
    "in diff mode so disable conoline as it doesn't work with diff's colour
    "scheme
    let g:conoline_auto_enable = 0
else
    "enable conoline
    let g:conoline_auto_enable = 1
endif








" vim-expand-region stuff                                                                                                                                                         
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                                                                                                                      
let g:expand_region_text_objects_xsd = {                                                                                                                                          
      \ 'iw' :0,
      \ 'iW' :0,
      \ 'iq' :0,
      \ 'aq' :0,
      \ 'i>' :0,
      \ 'a>' :0,
      \ 'it' :1,
      \ 'at' :1,
      \ }
                                                                                                                                                                                  
let g:expand_region_text_objects_xml = {
      \ 'iw' :0,
      \ 'iW' :0,
      \ 'iq' :0,
      \ 'aq' :0,
      \ 'i>' :0,
      \ 'a>' :0,
      \ 'it' :1,
      \ 'at' :1,
      \ }
      
let g:expand_region_text_objects_markdown = {
      \ 'iw' :0,
      \ 'iW' :0,
      \ 'ib' :0,
      \ 'ab' :0,
      \ 'iq' :0,
      \ 'aq' :0,
      \ 'i_' :0,
      \ 'a_' :0,
      \ 'i`' :0,
      \ 'a`' :0,
      \ 'is' :0,
      \ 'as' :0,
      \ 'ip' :0,
      \ 'ap' :0,
      \ }







" vim-tmux-navigator stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1








" vim-togglelist stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Prevent mapping <leader>l to the location list as this would clash with FZF
let g:toggle_list_no_mappings=1

" map <leader>q to toggle the quickfix window
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>








" vim-rooter stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugin to change directory to the root of the repository

let g:rooter_silent_chdir = 1








" For Prettier
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nnoremap <leader>f :Prettier<cr>







"vim-markdown-preview
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let vim_markdown_preview_github = 1
let vim_markdown_preview_hotkey='<C-m>'








" vim-air-line
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:airline_powerline_fonts = 1

" Don't count trailing whitespace since it lags in huge files
let g:airline#extensions#whitespace#enabled = 0

" Put a buffer list at the top
let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#fnamecollapse = 1
"let g:airline#extensions#tabline#fnametruncate = 20
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme = 'luna'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline_symbols.space = "\ua0"

" Prefix the filename (%t) with the current working dir, max 30chars
let g:airline_section_c = '%-0.30{getcwd()}/%t'

" Unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''








" Use deoplete.
"let g:deoplete#enable_at_startup = 1








"neovim specific stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if has('nvim')
    " Tell Vim which characters to show for expanded TABs,
    " trailing whitespace, and end-of-lines. VERY useful!
    if &listchars ==# 'eol:$'
        set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    endif
    " Show problematic characters.
    set list

    " Also highlight all tabs and trailing whitespace characters.
    highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
    match ExtraWhitespace /\s\+$\|\t/

    "ESC to get out of terminal mode
    :tnoremap <Esc> <C-\><C-n>

    "switch windows without escaping
    :tnoremap <C-h> <C-\><C-n><C-w>h
    :tnoremap <C-j> <C-\><C-n><C-w>j
    :tnoremap <C-k> <C-\><C-n><C-w>k
    :tnoremap <C-l> <C-\><C-n><C-w>l
endif




""""""""""""""""""""""""""""""""""""""""""""""
" COC
""""""""""""""""""""""""""""""""""""""""""""""
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }



" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>l  :<C-u>CocListResume<CR>
""""""""""""""""""""""""""""""""""""""""""""""
" /COC
""""""""""""""""""""""""""""""""""""""""""""""
