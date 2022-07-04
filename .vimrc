" ЯЗЫК И РАСКЛАДКА
set keymap=russian-jcukenwin "Русская раскладка по Ctrl+^
set iminsert=0 "Английский в режиме вставки
set imsearch=0 "Английский в режиме поиска

" ТЕМА И ПОДСВЕТКА
colorscheme default
set nocursorline "Подчеркивание текущей строки
set background=dark "При значении dark, меняет цвета на светлые
set wrap "Перенос строк
set nolinebreak "Перенос по словам
set breakindent "Отсуп исходной строки при переносе
filetype plugin on "Определение типа файла
syntax on "Подсветка синтаксиса по типу файла
set list "Показывать табы и пробелы в конце строки
set listchars=tab:>\ ,trail:- "Символы для показа
set shortmess+=I "Убрать сообщение при запуске

" ПОИСК
set incsearch "Поиск фрагмента по мере набора
set nohlsearch "Подсветку результатов поиска
set ignorecase "Не учитывать регистр символов при поиске
set smartcase "Учитывать регистр символов при поиске, только если есть символы в верхнем регистре

" ЗАГОЛОВОК И СТРОКА СОСТОЯНИЯ
set laststatus=1 "Отключить строку состояния (2-включить)
set title "Заголовок терминала
set titlestring= " :help statusline "Заголовок терминала

" НУМЕРАЦИЯ
set number "Нумерация
set numberwidth=3 "Ширина столбца нумерации

" ОТСТУПЫ
"set tabstop=4 "Ширина отображения отступов
set softtabstop=4 "Ширина табуляции при добавлении
set shiftwidth=4 "Ширина отсупа добавляемого >> и << или в начале строки при smarttab
set smarttab "Устанавливает при добавлении ширину отсупа в начале строки shiftwidth. Также позволяет удалять не отдельные пробелы, а отступы
set expandtab "Заменяет добавляемый отсуп на пробелы
"set autoindent "Копирует отступы текущей строки при добавлении новой
set smartindent "Копирует отступы текущей строки при добавлении, также добавляет отступы согласно синтаксису
filetype indent on "Автоотступ по определенному типу файла
au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8 "Для указанных типов файлов отключает замену табов пробелами и меняет ширину отступа

" ЗВУК
set noerrorbells "Отключение бипера, при ошибке ввода
set visualbell "Вместо бипера использовать мигание экрана

" БЕКАП
set backup "Включить бекапы редактируемых файлов до внесения изменеий
set swapfile "Включить файл подкачи для блокировки файла и сохранением изменений текущей сессии

" ИСТОРИЯ
set history=128 "Длина истории команд
set undolevels=2048 "Длина истории изменений

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

" СИСТЕМОЗАВИСИМЫЕ ПАРАМЕНТЫ
if !has('gui_win32')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set backupdir=~/.vim/backups//,. " // используются для сохранения полного пути файла, гре разделитель каталогов %
    set directory=~/.vim/backups//,. " если не найден каталог с бекапом будет использован текущий каталог (.)
endif
if has('gui_win32')
    source C:\Users\lm\.gvimrc
    set backupdir=C:\Users\lm\.vim\backups//,. " // используются для сохранения полного пути файла, гре разделитель каталогов %
    set directory=C:\Users\lm\.vim\backups//,. " если не найден каталог с бекапом будет использован текущий каталог (.)
endif
