" Reformat paragraphs and list.
nnoremap R {gq}
nnoremap W :VimwikiAll2HTML<CR> :! unison wiki<CR>
nnoremap <silent> <C-j> :cnext<CR> 
nnoremap <silent> <C-k> :cprevious<CR> 
nnoremap <silent> <C-o> :copen<CR> 
execute pathogen#infect()
set nocompatible
filetype plugin on
syntax on

"The following is adapted from
"http://vim.wikia.com/wiki/Toggle_spellcheck_with_function_keys

let g:myLang = 0
let g:myLangList = [ "nospell", "nl", "us" ]
function! MySpellLang()
  "loop through languages
let g:myLang = g:myLang + 1
  if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
  if g:myLang == 0 | set nospell | endif
  if g:myLang == 1 | setlocal spell spelllang=nl | endif
  if g:myLang == 2 | setlocal spell spelllang=en_us | endif
  echo "language:" g:myLangList[g:myLang]
endf

map <Leader>s :call MySpellLang()<CR>

" Here ends the part for spelling

set nojoinspaces "nojs: prevents inserting two spaces after punctuation on a join (it's not 1990 anymore)

let vimwiki_path='~/text/vimwiki/'
let vimwiki_export_path='~/temp/vimwiki_html/'
let wiki_settings={'template_path': vimwiki_export_path.'vimwiki-assets/','template_default': 'default','template_ext': '.html','auto_export': 0,}

let wikis=["tonswiki"]
let g:vimwiki_list = []
for wiki_name in wikis
	let wiki=copy(wiki_settings)
	let wiki.path = vimwiki_path.wiki_name.'/'
	let wiki.path_html = vimwiki_export_path.wiki_name.'/'
	let wiki.diary_index = 'index'
	let wiki.diary_rel_path = 'diary/'
	call add(g:vimwiki_list, wiki)
endfor
