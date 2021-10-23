" ЯЗЫК И РАСКЛАДКА
" Внутренней поддержки переключени русской раскладки по Ctrl+^
set keymap=russian-jcukenwin
" При запуске устанавливает английский в режиме вставки
set iminsert=0
" При запуске устанавливает английский в режиме поиска
set imsearch=0

" ТЕМА И ПОДСВЕТКА
" Установка темы
colorscheme peachpuff
" Подсветку (подчеркивание) текущей строки
set nocursorline
" Изменение цветов под темный фон
set background=dark
" Перенос длинных строк
set wrap
" Перенос длинных строк по словам
set nolinebreak
" Отображать перенос строк с отсупом исходной строки
set breakindent
" Определение типа файла
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
" Поиск фрагмента по мере набора
set incsearch
" Подсветку результатов поиска
set nohlsearch
" Не учитывать регистр символов при поиске
set ignorecase
" Учитывать регистр символов при поиске, только если есть символы в верхнем регистре
set smartcase

" ЗАГОЛОВОК И СТРОКА СОСТОЯНИЯ
" Отключить строку состояния (значение 2 - включить)
set laststatus=1
" Заголовок терминала
set title
" Изменить заголовок терминала
set titlestring= " :help statusline

" НУМЕРАЦИЯ
" Нумерация
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
" Автоотступ по определенному типу файла
filetype indent on
" Для указанных типов файлов отключает замену табов пробелами и меняет ширину отступа
au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8

" ЗВУК
" Отключение бипера, при ошибке ввода
set noerrorbells
" Вместо бипера использовать мигание экрана
set visualbell

" БЕКАП
" Включить бекапы редактируемых файлов до внесения изменеий
set backup
" Включить файл подкачи для блокировки файла и сохранением изменений текущей сессии
set swapfile
if has('win32')
    set backupdir=W:\portableapps\gVimPortable\Backups\,. " // используются для сохранения полного пути файла, гре разделитель каталогов %
    set directory=W:\portableapps\gVimPortable\Backups\,. " если не найден каталог с бекапом будет использован текущий каталог (.)
endif
if !has('win32')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set backupdir=~/.vim/backups//,. " // используются для сохранения полного пути файла, гре разделитель каталогов %
    set directory=~/.vim/backups//,. " если не найден каталог с бекапом будет использован текущий каталог (.)
endif

" ИСТОРИЯ
" Длина истории команд
set history=128
" Длина истории изменений
set undolevels=2048

""НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ ТЕКСТА (фолдинг)
"set foldenable " включить фолдинг
""set foldmethod=syntax " определять блоки на основе синтаксиса файла
"set foldmethod=indent " определять блоки на основе отступов
"set foldcolumn=3 " показать полосу для управления сворачиванием
"set foldlevel=1 " Первый уровень вложенности открыт, остальные закрыты
"set foldopen=all " автоматическое открытие сверток при заходе в них
"set tags=tags\ $VIMRUNTIME/systags " искать теги в текущй директории и в указанной (теги генерируются ctags)

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
