" TODO NOTE TODO OPTIMIZE
augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|URGENT|NOTE|TODO|OPTIMIZE|IGNORE|SKIP)/
          \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo
