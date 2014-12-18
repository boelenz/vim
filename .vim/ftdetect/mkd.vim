" markdown filetype file
au BufRead,BufNewFile *.mkd,*.markdown,*.mdwn,*.md   set filetype=mkd
set makeprg=pandoc\ --latex-engine=xelatex\ -o\ ~/Dropbox/settings/cygwinhome/pandoc/%:t:r.pdf\ %
