;HotKey v0.6 lesnikm4@gmail.com

TraySetIcon (".\hotkey.ico")
SetWorkingDir "..\..\..\"

Run ".\PortableApps\QTranslate\QTranslate.exe",,, &trans_pid
OnExit CloseTrans

#VK20::ChangeLanguageInput() ;Нажатие на Пробел при ужержании клавиши Win

;Дополнительные символы на AltGr: і І, ї Ї, є Є, ґ Ґ, ў Ў. 
;Правильное поведение при нажатии Shift, в зависимости от состояния клавиши Caps Lock
<^>!VK53::SendOfCaps("і","І")  ;Pressing Ы
<^>!+VK53::SendOfCaps("І","і") ;Pressing Shift + Ы
<^>!VKDD::SendOfCaps("ї","Ї")  ;Pressing Ъ
<^>!+VKDD::SendOfCaps("Ї","ї") ;Pressing Shift + Ъ
<^>!VK55::SendOfCaps("ґ","Ґ")  ;Pressing Г
<^>!+VK55::SendOfCaps("Ґ","ґ") ;Pressing Shift + Г
<^>!VKDE::SendOfCaps("є","Є")  ;Pressing Э
<^>!+VKDE::SendOfCaps("Є","є") ;Pressing Shift + Э
<^>!VK45::SendOfCaps("ў","Ў")  ;Pressing У
<^>!+VK45::SendOfCaps("Ў","ў") ;Pressing Shift + У
<^>!VK54::SendOfCaps("ё","Ё")  ;Pressing Е
<^>!+VK54::SendOfCaps("Ё","ё") ;Pressing Shift + Е

#VK54::Run ".\PortableApps\CygwinPortable\cygwin-portable-mintty.cmd"     ;Super+T
#VK46::Run "C:\Windows\explorer.exe ..\..\..\lm\"                         ;Super+F
#VK43::Run "C:\Windows\System32\calc.exe"                                 ;Super+C  
#VK42::Run ".\PortableApps\GoogleChromePortable\GoogleChromePortable.exe" ;Super+B 
#VK53::Run ".\PortableApps\PuTTYPortable\PuTTYPortable.exe"               ;Super+S 
#VK56::Run ".\PortableApps\VeraCryptPortable\VeraCryptPortable.exe"       ;Super+V
#VK48::Run ".\PortableApps\fscPortable\fscPortable.exe"                   ;Super+H

;Сочетания для управления : 
#Up::SoundSetVolume "+4"     ;Super+Up 
#Down::SoundSetVolume "-4"   ;Super+Down

;Super+7-0 - Перемещение активного окна
;Определяем разменр экрна за минусом панели задач
global width:=A_ScreenWidth ;Ширина основного экрана
global height:=A_ScreenHeight-35 ;Высота основного экрана за вычетом высоты панели задач

;Перемещение активного окна в верхнюю половину экрана
#VK37:: ;Нажатие 7 при удержании Super
    {
    WinRestore "A"
    WinMove 0, 0, width, height/2, "A"
    }
;Перемещение активного окна в нижнюю половниу экрана
#VK38:: ;Нажатие 8 при удержании Super
    {
    WinRestore "A"
    WinMove 0, height/2, width, height/2, "A"
    }
;Перемещение активного окна в левую половину экрана
#VK39:: ;Нажатие 9 при удержании Super
    {
    WinRestore "A"
    WinMove 0, 0, width/2, height, "A"
    }
;Перемещение активного окна в правую половину экрана
#VK30:: ;Нажатие 0 при удержании Super
    {
    WinRestore "A"
    WinMove width/2, 0, width/2, height, "A"
    }
;Развернуть на весь экран или свернуть в "плавающее" состояние, в зависимости от текущего
#VKBD:: ;Нажатие "-" при удержании Super
    {
    max_min:=WinGetMinMax("A") ;Определяем развернутость окна
    if (max_min = "0")         ;1=Развернуто, 0=Не свернуто, не развернуто(плавающее окно), -1=Свернуто(как я понял в трею)
        WinMaximize "A" ;Если активное окно в состоянии "Плавающее", тогда развернуть
    else
        WinRestore "A"  ;Активное окно "Развернуто", тогда в состоянии "Плавающее"
    }

;Включить перемещение активного окна
!LButton:: ;Нажатие LeftMouse при удержании Alt
    {
    CoordMode "Mouse", "Screen"                                       ;Задаем для функции связанных с мышью отсчет координат относительно экрана
    win_name:=WinGetID("A")                                           ;Получаем текущее окно
    
    WinRestore "A"                                                    ;Перевод в состоянии "Плавающее"
    WinGetPos &currentX, &currentY, &winwidth, &winheight, win_name       ;Получить текущее положение окна и его размер   
    MouseMove currentX+winwidth/2, currentY+winheight/2               ;Поставить курсор в середину активного окна    
    loop {
        klik:=KeyWait("LButton", "T0.05")                             ;Ждем нажатие левой клавиши
        if (klik = 1) {
             WinActivate win_name                                     ;Активируем перемещенное окно
             Exit                                                     ;При нажатии завершаем скрипт
             }
        MouseGetPos &endX, &endY                                      ;Получаем конечные координаты
        deltaX:=endX-currentX-winwidth/2, deltaY:=endY-currentY-winheight/2 ;Считаем перемещение мыши
        new_winX:=currentX+deltaX, new_winY:=currentY+deltaY          ;Считаем новое положение окна
        currentX:=new_winX, currentY:=new_winY                        ;Получаем начальные координаты для следующего прохода
        WinMove new_winX, new_winY,,, win_name                        ;Перемещаем окно    
        }
    }

;Включить изменение размера активного окна
!RButton:: ;Нажатие RightMouse при удержании Alt
    {
    CoordMode "Mouse", "Screen"                                       ;Задаем для функции связанных с мышью отсчет координат относительно экрана
    win_name:=WinGetID("A")                                           ;Получаем текущее окно
    
    WinGetPos &currentX, &currentY, &w, &h, win_name                  ;Получить текущее положение окна и его размер   
    MouseMove currentX+w-20, currentY+h-20                            ;Поставить курсор в левый нижний угол активного окна    
    loop {
        klik:=KeyWait("RButton", "T0.05")                             ;Ждем нажатие левой клавиши
        if (klik = 1) {
             WinActivate win_name                                     ;Активируем перемещенное окно
             Exit                                                     ;При нажатии завершаем скрипт
             }
        MouseGetPos &endX, &endY                                      ;Получаем конечные координаты
        deltaX:=endX-currentX-w+20, deltaY:=endY-currentY-h+20        ;Считаем перемещение мыши
        new_w:=w+deltaX, new_h:=h+deltaY                              ;Считаем новое положение окна
        w:=new_w, h:=new_h                                            ;Получаем начальные координаты для следующего прохода
        WinMove ,,new_w, new_h, win_name                              ;Перемещаем окно    
        }    
    }

;Введение в активное окно сумму с НДС
#VK50:: ;Super+P
    {
    sum := InputBox("Число + 20%")
    if (sum.Result = "OK")
        {
        sum := sum.Value*1.2
        sum := Round(sum,2)
        SendInput sum
        }
    }

;Введение в активное окно сумму с НДС+Акциз 
#VK4F:: ;Super+O
    {
    sum := InputBox("Число + 20% + 5%")
    if (sum.Result = "OK")
        {
        sum := sum.Value*1.26
        sum := Round(sum,2)
        SendInput sum
        }
    }

#VK51:: ;Super+Q
    {
    ExitApp ;Завершение скрипта
    }
#VK55:: ;Super+U
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
        SendMessage 0x50,, 0x4190419,, "A" ;Если текущий язык ввода английский, переключает на русский
        }
    else {
        SendMessage 0x50,, 0x4090409,, "A" ;Если друкой язык ввода, переключает на английский
        }
    }

SendOfCaps(sendCapsOff, sendCapsOn)
;Depending on state of CapsLock send first or two parameter
    {
    if GetKeyState("CapsLock", "T") 
        Send sendCapsOn ;При включенном CapsLock
    else 
        Send sendCapsOff ;При вылюченном CapsLock
    }

CloseTrans(ExitReason, ExitCode)
    {
    ProcessClose trans_pid ;Закрытие переводчика
    }

;WinWait "ahk_pid " win_calc        ;Ждем появления окна калькулятора
;WinActivate "ahk_pid " win_calc    ;Делаем окно активным

;TODO Super + Left Right - Контроль яркости (при долгом нажатии продолжается)
;<!Right::
;<!Left::

;Перемещение активного окна в левую нижнюю четверть экрана
;#Numpad1:: ;Нажатие NumLock1 при удержании Super
;    {
;    WinRestore "A" ;Устанавливаем окно в "плавающее" состояние
;    WinMove 0, height/2, width/2, height/2, "A" ;Перемещаем и изменеяем размер окна
;    }
;Перемещение активного окна в правую нижнюю четверть экрана
;#Numpad3:: ;Нажатие NumLock3 при удержании Super
;    {
;    WinRestore "A"
;    WinMove width/2, height/2, width/2, height/2, "A"
;    }
;Перемещение активного окна в левую верхнюю экрана
;#Numpad7:: ;Нажатие NumLock7 при удержании Super
;    {
;    WinRestore "A"
;    WinMove 0, 0, width/2, height/2, "A"
;    }
;Перемещение активного окна правую верхнюю четверть экрана
;#Numpad9:: ;Нажатие NumLock9 при удержании Super
;    {
;    WinRestore "A"
;    WinMove width/2, 0, width/2, height/2, "A"
;    }
;Свернуть активное окно в трее
;#NumpadSub:: ;Нажатие NumpadSub при удержании Super
;    {
;    WinMinimize "A"
;    }
