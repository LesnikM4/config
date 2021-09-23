" ЯЗЫК И РАСКЛАДКА
" Соответствие клавиш русской клавиатуры к латинской, для ввода команд в нормальном режмие
"set langmap=ёйцукенгшщзхъфывапролджэячсмитьбю;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.
"set langmap=ЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
" Соответствие команд в командном режиме
"cnoreabbrev ц w
"cnoreabbrev ч x
"cnoreabbrev цй wq
"cnoreabbrev й q
"cnoreabbrev й! q!
" Включение внутренней поддержки переключени русской раскладки по Ctrl+^
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" ТЕМА И ПОДСВЕТКА
" Установка темы
colorscheme peachpuff
" Изменение цветов под темный фон
set background=dark
" Подсветка результатов поиска
set hlsearch                       
" Включить перенос длинных строк
set wrap
" Включить перенос длинных строк по словам 
"set linebreak
" Отображать перенос строк с отсупом исходной строки
set breakindent
" Включить определение типа файла
filetype plugin on
" Подсветка синтаксиса по типу файла
syntax on

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

" ЗВУК
" Отключение бипера, при ошибке ввода
set noerrorbells

" ПЕРЕНАЗНАЧЕНИЕ
"map <leader>alias command
"map nmap vmap omap cmap imap 
"noremap cnoremap

