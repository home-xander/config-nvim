" Xander NeoVim config
"
" General:
" \ 		: LEADER KEY.
" \\ 		: <EM> EASYMOTION LEADER KEY
" <esc> 	: change to the command mode.
" i 		: change to insert mode.
" : 		: last-line mode, enter commands.
" a 		: insert text after cursor.
" A 		: append at the end of the line.
" o 		: begin a new line below the cursor.
" O 		: begin a new line above the cursor.
" u 		: undo last command.
" ctrl-r 	: redo the last undo.
" . 		: repeat the last action.
"
" Delete:
" x 		: delete character under cursor.
" dw 		: delete a word.
" d0 		: delete to the beginning of the line.
" d$ 		: delete to the end of the line.
" d) 		: delete to the end of the sentence.
" dgg 		: delete to the beginning of the file.
" dG 		: delete to the end of the file.
" dd 		: delete line.
" 3dd 		: delete three lines.
"
" Replace:
" r<char> 	: replace selection with <char>.
" R 		: replace characters instead of inserting them.
"
" Navigation:
" h 		: move cursor left.
" j 		: move cursor down.
" k 		: move cursor up.
" l 		: move cursor right.
" 0 (zero) 	: move the start of the line.
" $ 		: move to the end of the line.
" ^ 		: move to the first non-empty character in the line.
" <EM>w 	: move forward in the document.
" <n>w 		: move forward <n> words in the line, ex. 5w moves the cursor
" 		  five words forward.
" <EM>b 	: move backward in the document.
" <n>b 		: move backwards <n> words in the line.
" G 		: move to the end of the file.
" gg 		: move to the beginning of the file.
"
" Copy:
" Paste:
" yy 		: copy current line into the default register. 
" ["x]yy 	: copy current line into register x.
" p 		: paste the contents of default register after the line.
" P 		: paste the contents of default register before the line.
" ["x]p 	: paste the contents of register x after the line.
" ["x]P 	: paste the contents of register x before the line.
"
" dd 		: move the line into the default register.
" p 		: paste the default register.
"
" Search:
" /# 		: search for #.
" ctrl-l 	: remove the search highlight.
"
" Replace:
" :%s/1/2 	: replace the first occurrence of the first 1 with 2.
" :%s/1/2/g 	: replace all occurrences of 1 with 2.
" :%s/1/2/gc 	: replace all occurrences of 1 with 2 but ask for confirmation.
"
" Bookmarks:
" m<char> 	: set a bookmark at the current position.
" `<char> 	: jump to a bookmark.
" :marks 	: list all bookmarks.
" :delmarks <c>	: delete the mark <char>.
"
" Modify:
" ~ 		: change letter case. 
" 
" Align: <EA> EasyAlign.
" ga 		: start interactive <EA>
" vipga<char> 	: [v]isual select [i]nner [p]aragraph start <EA> and align
" 		  around <char>.
" gaip<char> 	: <EA> select [i]nner [p]aragraph and align around <char.
"
" Nerdtree:
" F10 		: toggle, open/close.
"
" Commenting:
" gcc 		: comment out a line.
" gcc<n> 	: comment out the next <n> lines.
" gc 		: comment out the target of a motion.
"  		  ex. `gcap` for a paragraph.
" 		  also works in visual mode and operator mode. 
"
" Buffers:
" ctrl-^ 	: switch between buffers.
" :ls 		: show all buffers.
"
" Windows:
" ctrl-w w 	: cycle between buffers.
" ctrl-w h 	: cycle left.
" ctrl-w i 	: cycle down.
" ctrl-w k 	: cycle up.
" ctrl-w l 	: cycle right.
"
" Tabs:
" ctrl-w T 	: move split window into its own tab.
" :tabedit 	: open a new file.
" :tabclose 	: close a file. 
" :tabonly 	: close all tabs except this one. 
" gt 		: move to the next tab.
" gT 		: move to the previous tab.
" <n>gt 	: move to tab <n>.
"

" Plugins become available after plug#end().
call plug#begin('$HOME/.cache/vim-plugins')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sensible'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Autocomplete:
let aci={'do': 'yarn --install --frozen-lockfile'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-emmet', aci
Plug 'neoclide/coc-pairs', aci 
Plug 'neoclide/coc-json', aci
Plug 'neoclide/coc-rls', aci
Plug 'tpope/vim-commentary'
"   TODO: vim-airline 
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
" ctrlP
call plug#end()

"* Sensible defaults.
let g:is_posix =1
set list listchars=tab:→\ ,trail:·
"set colorcolumn=120
set textwidth=80
"set colorcolumn=+100
let &colorcolumn=join(range(81,999),",")
set relativenumber
set smartcase
set spell
set encoding=utf-8
set autoindent
set smartindent
set smarttab
set shiftround
set termguicolors
colorscheme gruvbox

"* EasyMotion


"* CoC configuration.
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" relative linenumbers
" disable mouse support
" arrow keys to noesckeys
"
"

"* EasyMotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

"" Remap ljkn to use easymotion.
map l <Plug>(easymotion-lineforward)
map j <Plug>(easymotion-j)
map k <Plug>(easymotion-k)
map h <Plug>(easymotion-linebackward)

"" Unmap arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"" Keep cursor column when jk motion 
let g:EasyMotion_startofline = 0

"" Work like Vim's smartcase (only care about case sensitivity if needed).
let g:EasyMotion_smartcase = 1

"" Same principle but then for signs; 1:!, 2:@, 3:#, all are equal.
let g:EasyMotion_use_smartsign_us = 1

"* EasyAlign
"" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

"" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"* NERDTree
"" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

"" Add this line to avoid crashes when calling vim-plug functions while in the
"" NERDTree window:
let g:plug_window = 'noautocmd vertical topleft new'

"" Automatically open NERDTree when vim is started without a file to open.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"" Automatically open NERDTree when a folder is opened.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif

"" Map <F10> to NERDTree
map <F10> :NERDTreeToggle<CR>

"" Close the NERDTree window after opening a file.
let NERDTreeQuitOnOpen=1
