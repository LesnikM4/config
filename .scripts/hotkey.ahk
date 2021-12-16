;AutoHotKey_v1.1 HotKey_v0.7 lesnikm4@gmail.com

SetWorkingDir ..\..\..\
;TraySetIcon "W:\PortableApps\AutoHotkey\HotKey\hotkey.ico"

;Run ".\PortableApps\QTranslate\QTranslate.exe",,"Hide", &trans_pid
;OnExit CloseTrans
;#VK4B::Run .\PortableApps\AutoHotkey\Compiler\AutoHotkeyV1.1_U64.exe W:\PortableApps\AutoHotkey\HotKey\translate_mini.ahk
#VK20::ChangeLanguageInput() ;Нажатие на Пробел при ужержании клавиши Win

<^>!VK53::SendOfCaps("і","І")  ;Ы
<^>!+VK53::SendOfCaps("І","і") ;+Ы
<^>!VKDD::SendOfCaps("ї","Ї")  ;Ъ
<^>!+VKDD::SendOfCaps("Ї","ї") ;+Ъ
<^>!VK55::SendOfCaps("ґ","Ґ")  ;Г
<^>!+VK55::SendOfCaps("Ґ","ґ") ;+Г
<^>!VKDE::SendOfCaps("є","Є")  ;Э
<^>!+VKDE::SendOfCaps("Є","є") ;+Э
<^>!VK45::SendOfCaps("ў","Ў")  ;У
<^>!+VK45::SendOfCaps("Ў","ў") ;+У
<^>!VK54::SendOfCaps("ё","Ё")  ;Е
<^>!+VK54::SendOfCaps("Ё","ё") ;+Е

#VK54::Run .\PortableApps\Git\git-bash, .\lm\
#VK46::Run C:\Windows\explorer.exe ..\..\..\lm\
#VK43::Run C:\Windows\System32\calc.exe
#VK42::Run .\PortableApps\GoogleChromePortable\GoogleChromePortable.exe
#VK56::Run .\PortableApps\VeraCryptPortable\VeraCryptPortable.exe
#VK48::Run .\PortableApps\fscPortable\fscPortable.exe

#Up::SoundSetWaveVolume "+4"     ;#Up
#Down::SoundSetWaveVolume "-4"   ;#Down

;global height:=^A_ScreenHeight-35% ;Высота основного экрана за вычетом высоты панели задач

;#VK37:: ;#7 верхняя половина
;{
;    SysGet, width, 78
;    SysGet, height, 79
;    WinRestore A
;MsgBox % width, % height/2
;
;    WinMove, A,, 0, 0, % width, % height/2
;}
;#VK38:: ;#8 нижняя половина
;{
;    SysGet, width, 78
;    SysGet, height, 79
;    WinRestore A
;    WinMove, A,, 0, %height%/2, %width%, %height%/2
;}
;#VK39:: ;#9 левая половина
;{
;    SysGet, width, 78
;    SysGet, height, 79
;    WinRestore A
;    WinMove, A,, 0, 0, %width%/2, %height%
;}
;#VK30:: ;#0 правая половина
;{
;    SysGet, width, 78
;    SysGet, height, 79
;    WinRestore A
;    WinMove, A,, %width%/2, 0, %width%/2, %height%
;}
;#VKBD:: ;#- свернуть развернуть
;    {
;    WinGet max_min, MinMax, "A" ;Определяем развернутость окна
;
;    if (max_min = "0")         ;1=Развернуто, 0=Не свернуто, не развернуто(плавающее окно), -1=Свернуто(как я понял в трею)
;        WinMaximize "A" ;Если активное окно в состоянии "Плавающее", тогда развернуть
;    else
;        WinRestore "A"  ;Активное окно "Развернуто", тогда в состоянии "Плавающее"
;    }
;
;!LButton::
;   {
;    SysGet, width, 78
;    SysGet, height, 79
;    CoordMode "Mouse", "Screen"                                       ;Задаем для функции связанных с мышью отсчет координат относительно экрана
;    WinGet win_name, ID, "A"                                           ;Получаем текущее окно
;
;    WinRestore "A"                                                    ;Перевод в состоянии "Плавающее"
;    WinGetPos currentX, currentY, winwidth, winheight, win_name   ;Получить текущее положение окна и его размер
;    MouseMove currentX+winwidth/2, currentY+winheight/2               ;Поставить курсор в середину активного окна
;    loop {
;        klik:=KeyWait "LButton", "T0.05"                             ;Ждем нажатие левой клавиши
;        if (klik = 1) {
;             WinActivate win_name                                     ;Активируем перемещенное окно
;             Exit                                                     ;При нажатии завершаем скрипт
;             }
;        MouseGetPos endX, endY                                      ;Получаем конечные координаты
;        deltaX:=endX-currentX-winwidth/2, deltaY:=endY-currentY-winheight/2 ;Считаем перемещение мыши
;        new_winX:=currentX+deltaX, new_winY:=currentY+deltaY          ;Считаем новое положение окна
;        currentX:=new_winX, currentY:=new_winY                        ;Получаем начальные координаты для следующего прохода
;        WinMove new_winX, new_winY,,, win_name                        ;Перемещаем окно
;        }
;    }
;
;!RButton::
;    {
;    SysGet, width, 78
;    SysGet, height, 79
;    CoordMode "Mouse", "Screen"                                       ;Задаем для функции связанных с мышью отсчет координат относительно экрана
;    WinGet win_name, ID, "A"                                           ;Получаем текущее окно
;
;    WinGetPos currentX, currentY, w, h, win_name                  ;Получить текущее положение окна и его размер
;    MouseMove currentX+w-20, currentY+h-20                            ;Поставить курсор в левый нижний угол активного окна
;    loop {
;        klik:=KeyWait "RButton", "T0.05"                             ;Ждем нажатие левой клавиши
;        if (klik = 1) {
;             WinActivate win_name                                     ;Активируем перемещенное окно
;             Exit                                                     ;При нажатии завершаем скрипт
;             }
;        MouseGetPos endX, endY                                      ;Получаем конечные координаты
;        deltaX:=endX-currentX-w+20, deltaY:=endY-currentY-h+20        ;Считаем перемещение мыши
;        new_w:=w+deltaX, new_h:=h+deltaY                              ;Считаем новое положение окна
;        w:=new_w, h:=new_h                                            ;Получаем начальные координаты для следующего прохода
;        WinMove ,,new_w, new_h, win_name                              ;Перемещаем окно
;        }
;    }
;
;#VK50:: ;#P
;    {
;    InputBox sum, "20"
;    if (sum.Result = "OK")
;        {
;        sum := sum.Value*1.2
;        sum := Round(sum,2)
;        SendInput sum
;        }
;    }
;
;#VK4F:: ;#O
;    {
;    InputBox sum, "25"
;    if (sum.Result = "OK")
;        {
;        sum := sum.Value*1.26
;        sum := Round(sum,2)
;        SendInput sum
;        }
;    }
;
#VK51::ExitApp    ;#Q
#VK55::           ;#U
    {
    Run ".\PortableApps\AutoHotkey\StartHotKey.exe"
    ExitApp ;Перезапуск скрипта
    }

ChangeLanguageInput()
    {
    active_hwnd := WinExist("A")
    threadID := dllCall("GetWindowThreadProcessId", "uint", active_hwnd, "uint", 0)
    code := dllCall("GetKeyboardLayout", "uint", threadID, "uint") & 0xFFFF ;Получение кода текущей раскладки
    if (code == 1033) {                                                     ;RU=1049, EN=1033
        SendMessage, 0x50,, 0x4190419,, A ;Если текущий язык ввода английский, переключает на русский
        }
    else {
        SendMessage, 0x50,, 0x4090409,, A ;Если друкой язык ввода, переключает на английский
        }
    }

SendOfCaps(sendCapsOff, sendCapsOn)
;Depending on state of CapsLock send first or two parameter
    {
    if GetKeyState("CapsLock", "T")
        Send %sendCapsOn% ;При включенном CapsLock
    else
        Send %sendCapsOff% ;При вылюченном CapsLock
    }

;CloseTrans(ExitReason, ExitCode)
;    {
;    ProcessClose trans_pid ;Закрытие переводчика
;    }
;
;RunAndActive(Target,ProcessName)
;    {
;    Run Target
;    Sleep 1
;    WinWait "ahk_exe " ProcessName
;    WinActive "ahk_exe " ProcessName
;    }
