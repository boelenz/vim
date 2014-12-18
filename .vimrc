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
set spell spelllang=nl

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
