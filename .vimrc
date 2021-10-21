" ЯЗЫК И РАСКЛАДКА
" Включение внутренней поддержки переключени русской раскладки по Ctrl+^
set keymap=russian-jcukenwin
" При запуске устанавливает английский в режиме вставки
set iminsert=0
" При запуске устанавливает английский в режиме поиска
set imsearch=0

" ТЕМА И ПОДСВЕТКА
" Отключить строку состояния (значение 2 - включить)
set laststatus=1
" Отключить подсветку текущей строки
set nocursorline
" Установка темы
colorscheme peachpuff
" Изменение цветов под темный фон
set background=dark
" Включить перенос длинных строк
set wrap
" Оключить перенос длинных строк по словам 
set nolinebreak
" Отображать перенос строк с отсупом исходной строки
set breakindent
" Включить определение типа файла
filetype plugin on
" Подсветка синтаксиса по типу файла
syntax on
" Подсвечивать табы и пробелы в конце строки
set list
" Установить символы, которыми будет осуществляться подсветка
set listchars=tab:>-,trail:- 
" Убрать сообщение при запуске
set shortmess+=I

" ПОИСК
" Подсветка слов совпадающих со словом под курсором
autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))
" Поиск фрагмента по мере набора
set incsearch
" Отключить подсветку результатов поиска
set nohlsearch
" Не учитывать регистр символов при поиске
set ignorecase
" Учитывать регистр символов при поиске, только если есть символы в верхнем регистре
set smartcase

" ЗАГОЛОВОК
" Включить заголовок терминала
set title
" Изменить заголовок терминала
set titlestring= " :help statusline

" НУМЕРАЦИЯ
" Включение нумерации
set number
" Ширина столбца нумерации
set numberwidth=3

" ОТСТУПЫ
" Ширина отображения отступов
"set tabstop=4
" Ширина табуляции при добавлении 
set softtabstop=4
" Ширина отсупа добавляемого >> и << или в начале строки при smarttab
set shiftwidth=4
" Устанавливает при добавлении ширину отсупа в начале строки shiftwidth
" также позволяет удалять не отдельные пробелы, а отступы
set smarttab
" Заменяет добавляемый отсуп на пробелы
set expandtab
" Копирует отступы текущей строки при добавлении новой
"set autoindent
" Копирует отступы текущей строки при добавлении, также добавляет отступы
" согласно синтаксису
set smartindent
" Включение автоотступов по определенному типу файла
filetype indent on
" Для указанных типов файлов отключает замену табов пробелами и меняет ширину отступа
au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8

" ЗВУК
" Отключение бипера, при ошибке ввода
set noerrorbells
" Вместо бипера использовать мигание экрана
set visualbell

" БЕКАП
" TODO Win
" Создание каталога с сохранениями
silent !mkdir ~/.vim/backups > /dev/null 2>&1
" Включить бекапы редактируемых файлов до внесения изменеий
set backup
" Включить файл подкачи для блокировки файла и сохранением изменений текущей сессии
set swapfile
" Каталог для сохранения файла
set backupdir=~/.vim/backups//,. " // используются для сохранения полного пути файла, гре разделитель каталогов %
" Каталог для сохранения файла подкачки
set directory=~/.vim/backups//,. " если не найден каталог с бекапом будет использован текущий каталог (.)

" ИСТОРИЯ
" Длина истории команд
set history=128
" Длина истории изменений
set undolevels=2048


" Изменение цвета элемента
"highlight Cursor guibg=Green guifg=NONE guibg=grey80

" Годный файл с настройками, много настроек для кодировок файла
"https://wiki.research.ru.com/?p=529

""НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ ТЕКСТА (фолдинг)
"set foldenable " включить фолдинг
""set foldmethod=syntax " определять блоки на основе синтаксиса файла
"set foldmethod=indent " определять блоки на основе отступов
"set foldcolumn=3 " показать полосу для управления сворачиванием
"set foldlevel=1 " Первый уровень вложенности открыт, остальные закрыты
"set foldopen=all " автоматическое открытие сверток при заходе в них
"set tags=tags\ $VIMRUNTIME/systags " искать теги в текущй директории и в указанной (теги генерируются ctags)

" ПЕРЕНАЗНАЧЕНИЕ
"map <leader>alias command
"map nmap vmap omap cmap imap 
"noremap cnoremap

"" НАСТРОЙКИ ЯЗЫКА
"" Цвет статусной строки если она ключенна 
"set laststatus=2
"function! MyKeyMapHighlight()
"   if &iminsert == 0 " при английской раскладке статусная строка текущего окна будет серого цвета
"      hi StatusLine ctermfg=White guifg=White
"   else " а при русской - зеленого.
"      hi StatusLine ctermfg=DarkRed guifg=DarkRed
"   endif
"endfunction
"call MyKeyMapHighlight() " при старте Vim устанавливать цвет статусной строки
"autocmd WinEnter * :call MyKeyMapHighlight() " при смене окна обновлять информацию о раскладках
"" использовать Ctrl+F для переключения раскладок
"cmap <silent> <C-F> <C-^>
"imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
"nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
"vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv

""ВКЛЮЧЕНИЕ АВТОДОПЛНЕНИЯ ВВОДА (omnifunct)
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType tt2html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"" Опции автодополнения - включаем только меню с доступными вариантами
"" автодополнения (также, например, для omni completion может быть
"" окно предварительного просмотра).
"set completeopt=menu
""-------------------------------------------------------------------------------
"" perl-support.vim
""-------------------------------------------------------------------------------
"let g:Perl_AuthorName        = 'dimio'
"let g:Perl_AuthorRef         = 'http:://dimio.org'
"let g:Perl_Email             = 'dimio@dimio.org'

"" ФУНКЦИИ
""" Удалить пробелы в конце строк (frantsev)
"function! RemoveTrailingSpaces()
"   normal! mzHmy
"   execute '%s:\s\+$::ge'
"   normal! 'yzt`z
"endfunction
"
"autocmd! bufwritepre * call BackupDir() " сделаем резервную копию перед записью буфера на диск
"function! BackupDir()
"   " определим каталог для сохранения резервной копии
"   if has('win32')
"        let l:backupdir = $TEMP.'\backup'
"    else
"        let l:backupdir = $VIMRUNTIME.'/backup/'.
"        \substitute(expand('%:p:h'), '^'.$HOME, '~', '')
"    endif
"   " если каталог не существует, создадим его рекурсивно
"   if !isdirectory(l:backupdir)
"      call mkdir(l:backupdir, 'p', 0700)
"   endif
"   " переопределим каталог для резервных копий
"   let &backupdir=l:backupdir
"   " переопределим расширение файла резервной копии
"   let &backupext=strftime('~%Y-%m-%d~')
"endfunction
"
"» Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана
"set showcmd
"
"https://unixforum.org/viewtopic.php?t=36820&start=390
""Что б не тянутся к esc в режиме вставки (мне кажется самое удобное)
"imap jj <Esc>
"Удобный переход по окнам:
"map <C-H> <C-W>h
"map <C-J> <C-W>j
"map <C-K> <C-W>k
"map <C-L> <C-W>l
" Показывать строку вкладок всегда
"set showtabline=2
"
"Очень много инфы по Виму
"https://www.sites.google.com/site/kfgnb0101/home/Doc/komandy-terminala/gnu-screen/vi----vim#TOC--
