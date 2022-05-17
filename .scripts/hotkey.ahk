; AutoHotKey_v1.1 HotKey_v0.7 lesnikm4@gmail.com
; KeyMap: # - Win, + - Shift, <^>! - RAlt(in russhian keyboard)

SetWorkingDir ..\..\
Menu, Tray, Icon, .\PortableApps\AutoHotkey\HotKey\hotkey.ico

;VK91 ScrollLock
VK91::
    buttonState := DllCall("user32.dll\SwapMouseButton", "UInt", 1)
    if buttonState <> 0
    {
        buttonState := DllCall("user32.dll\SwapMouseButton", "UInt", 0)
    }

CapsLock::ChangeLanguageInput()

;VK53 Ы
<^>!VK53::SendOfCaps("і","І")
<^>!+VK53::SendOfCaps("І","і")
;VKDD Ъ
<^>!VKDD::SendOfCaps("ї","Ї")
<^>!+VKDD::SendOfCaps("Ї","ї")
;VK55 Г
<^>!VK55::SendOfCaps("ґ","Ґ")
<^>!+VK55::SendOfCaps("Ґ","ґ")
;VKDE Э
<^>!VKDE::SendOfCaps("є","Є")
<^>!+VKDE::SendOfCaps("Є","є")
;VK45 У
<^>!VK45::SendOfCaps("ў","Ў")
<^>!+VK45::SendOfCaps("Ў","ў")
;VK54 Е
<^>!VK54::SendOfCaps("ё","Ё")
<^>!+VK54::SendOfCaps("Ё","ё")

;VK54 T
#VK54::Run .\PortableApps\CygwinPortable\App\Runtime\Cygwin\Cygwin.bat
;VK46 F
#VK46::Run C:\Windows\explorer.exe ..\..\..\lm\
;VK43 C
#VK43::Run C:\Windows\System32\calc.exe
;VK42 B
#VK42::Run .\PortableApps\GoogleChromePortable\GoogleChromePortable.exe
;VK56 V
#VK56::Run .\PortableApps\VeraCryptPortable\VeraCryptPortable.exe
;VK48 H
#VK48::Run .\PortableApps\fscPortable\fscPortable.exe

#Up::SoundSetWaveVolume "+4"
#Down::SoundSetWaveVolume "-4"

#VK37::WinUp()
WinUp(){
    WinRestore A
    WinMove, A,, 0, 0, %A_ScreenWidth%, % (A_ScreenHeight-35)/2
}
#VK38:: WinDown()
WinDown(){
    WinRestore A
    WinMove, A,, 0, % (A_ScreenHeight-35)/2, %A_ScreenWidth%, % (A_ScreenHeight-35)/2
}
#VK39::WinLeft()
WinLeft(){
    WinRestore A
    WinMove, A,, 0, 0, % A_ScreenWidth/2, % A_ScreenHeight-35
}
#VK30:: WinRight()
WinRight(){
    WinRestore A
    WinMove, A,, % A_ScreenWidth/2, 0, % A_ScreenWidth/2, % A_ScreenHeight-35
}

;VKBD -
#VKBD::WinMaxMin()
    WinMaxMin(){
    WinGet max_min, MinMax, A
    if (max_min = "0")
        WinMaximize A
    else
        WinRestore A
    }

;VK51 Q
#VK51::ExitApp
;VK55 U
#VK55::Reload

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


; Код перевода скопирован от уважаемого teadrinker, http://forum.script-coding.com/viewtopic.php?id=4492
#NoEnv
#SingleInstance, force

^+VK20::
{
                LastClip = ClipBoard
                Send ^{VK43}
                sourceText := Clipboard
                ClipBoard := LastClip
                from := RegExMatch(sourceText, "[А-Яа-я]") ? "ru" : "auto"
                to := from = "ru" ? "en" : "ru"
                transText := GoogleTranslate(sourceText, from, to)
                TrayTip %sourceText%, %transText%
                inTextLineBreak := RegExMatch(sourceText, "[\n]")
                if (!inTextLineBreak){
                    FileAppend %sourceText% ::: %transText% `n, ./lm/.trans_history
                }
}

CreateUrl(text, lng) {
   static JS := CreateScriptObj()
   url := "https://translate.google.com/translate_tts?ie=UTF-8&tl="
         . lng . "&total=1&idx=0&client=t&prev=input&textlen="
         . StrLen(text) . "&tk=" . JS.eval("tk").(text) . "&q=" . EncodeDecodeURI(text)
   Return url
}

EncodeDecodeURI(str, encode := true, component := true) {
        static JS
        ( !JS && JS := CreateScriptObj() )
   for k, v in [["\", "\\"], ["'", "\'"], ["`r", "\r"], ["`n", "\n"]]
      str := StrReplace(str, v[1], v[2])
   Return JS.eval( (encode ? "en" : "de") . "codeURI" . (component ? "Component" : "") . "('" . str . "')" )
}


GoogleTranslate(str, ByRef from, to := "en") {
   static JS := CreateScriptObj()

   if !Ping4("translate.google.com")
                Return "Error: Ping4(""translate.google.com"") failed with error: " . ErrorLevel

   json := SendRequest(JS, str, to, from)
   try oJSON := JS.JSON.parse(json)
        catch {
                Clipboard := json
                Return "Error: Can't parse json, full error text is in ClipBoard`n`n" . SubStr(json, 1, 500)
        }
   if !IsObject(oJSON[1])  {
      Loop % oJSON[0].length
         trans .= oJSON[0][A_Index - 1][0]
   }
   else  {
      MainTransText := oJSON[0][0][0]
      Loop % oJSON[1].length  {
         trans .= "`n+"
         obj := oJSON[1][A_Index-1][1]
      ;   Loop % obj.length  {
      ;      txt := obj[A_Index - 1]
      ;      trans .= (MainTransText = txt ? "" : "`n" txt)
      ;   }
      }
   }
   if !IsObject(oJSON[1])
      MainTransText := trans := Trim(trans, ",+`n ")
   else
      trans := MainTransText . "`n+`n" . Trim(trans, ",+`n ")

   from := oJSON[2]
   trans := Trim(trans, ",+`n ")
   Return trans
}

CreateScriptObj() {
   static doc, JS
   if !doc {
      doc := ComObjCreate("htmlfile")
      doc.write("<meta http-equiv='X-UA-Compatible' content='IE=9'>")
      JS := doc.parentWindow
      (doc.documentMode < 9 && JS.execScript())
                JS.eval("delete ActiveXObject; delete GetObject;")
                JS.eval( GetJScript() )
   }
   Return JS
}

GetJScript()
{
   script =
   (
      var TKK = ((function() {
        var a = 561666268;
        var b = 1526272306;
        return 406398 + '.' + (a + b);
      })());

      function b(a, b) {
        for (var d = 0; d < b.length - 2; d += 3) {
            var c = b.charAt(d + 2),
                c = "a" <= c ? c.charCodeAt(0) - 87 : Number(c),
                c = "+" == b.charAt(d + 1) ? a >>> c : a << c;
            a = "+" == b.charAt(d) ? a + c & 4294967295 : a ^ c
        }
        return a
      }

      function tk(a) {
          for (var e = TKK.split("."), h = Number(e[0]) || 0, g = [], d = 0, f = 0; f < a.length; f++) {
              var c = a.charCodeAt(f);
              128 > c ? g[d++] = c : (2048 > c ? g[d++] = c >> 6 | 192 : (55296 == (c & 64512) &&
                                  f + 1 < a.length && 56320 == (a.charCodeAt(f + 1) & 64512) ?
              (c = 65536 + ((c & 1023) << 10) + (a.charCodeAt(++f) & 1023), g[d++] = c >> 18 | 240,
              g[d++] = c >> 12 & 63 | 128) : g[d++] = c >> 12 | 224, g[d++] = c >> 6 & 63 | 128), g[d++] = c & 63 | 128)
          }
          a = h;
          for (d = 0; d < g.length; d++) a += g[d], a = b(a, "+-a^+6");
          a = b(a, "+-3^+b+-f");
          a ^= Number(e[1]) || 0;
          0 > a && (a = (a & 2147483647) + 2147483648);
          a `%= 1E6;
          return a.toString() + "." + (a ^ h)
      }
   )
   Return script
}

SendRequest(JS, str, tl, sl, proxy := "") {
   static Whr, userAgent := "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0"
   ComObjError(false)
   if !Whr {
      Whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
      ( proxy && Whr.SetProxy(2, proxy) )
      Whr.Open("GET", "https://translate.google.com", true)
      Whr.SetRequestHeader("User-Agent", userAgent)
      Whr.Send()
      Whr.WaitForResponse(-1)
   }
   Whr.Open("POST", "https://translate.googleapis.com/translate_a/single?client=gtx"
                ; or https://clients5.google.com/translate_a/t?client=dict-chrome-ex
      . "&sl=" . sl . "&tl=" . tl . "&hl=" . tl
      . "&dt=at&dt=bd&dt=ex&dt=ld&dt=md&dt=qca&dt=rw&dt=rm&dt=ss&dt=t&ie=UTF-8&oe=UTF-8&otf=0&ssel=0&tsel=0&pc=1&kc=1"
      . "&tk=" . JS.eval("tk").(str), true)

   Whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8")
   Whr.SetRequestHeader("User-Agent", userAgent)
   Whr.Send("q=" . EncodeDecodeURI(str))
   Whr.WaitForResponse(-1)
   Return Whr.responseText
}

Ping4(Addr, ByRef Result := "", Timeout := 1024) {
   Static WSADATAsize := (2 * 2) + 257 + 129 + (2 * 2) + (A_PtrSize - 2) + A_PtrSize
   OrgAddr := Addr
   Result := ""
   VarSetCapacity(WSADATA, WSADATAsize, 0)
   if (Err := DllCall("Ws2_32\WSAStartup", "UShort", 0x0202, "Ptr", &WSADATA, "Int")) {
      ErrorLevel := "WSAStartup failed with error " . Err
      Return
   }
   if !RegExMatch(Addr, "^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$") {
      if !(HOSTENT := DllCall("Ws2_32\gethostbyname", "AStr", Addr, "UPtr")) {
         DllCall("Ws2_32\WSACleanup")
         ErrorLevel := "gethostbyname failed with error " . DllCall("Ws2_32\WSAGetLastError", "Int")
         Return
      }
      PAddrList := NumGet(HOSTENT + 0, (2 * A_PtrSize) + 4 + (A_PtrSize - 4), "UPtr")
      PIPAddr := NumGet(PAddrList + 0, 0, "UPtr")
      Addr := StrGet(DllCall("Ws2_32\inet_ntoa", "UInt", NumGet(PIPAddr + 0, 0, "UInt"), "UPtr"), "CP0")
   }
   INADDR := DllCall("Ws2_32\inet_addr", "AStr", Addr, "UInt")
   if (INADDR = 0xFFFFFFFF) {
      ErrorLevel := "inet_addr failed for address " . Addr
      Return
   }
   DllCall("Ws2_32\WSACleanup")
   HMOD := DllCall("LoadLibrary", "Str", "Iphlpapi.dll", "UPtr")
   Err := ""
   if (HPORT := DllCall("Iphlpapi\IcmpCreateFile", "UPtr")) {
      REPLYsize := 32 + 8
      VarSetCapacity(REPLY, REPLYsize, 0)
      if DllCall("Iphlpapi\IcmpSendEcho", "Ptr", HPORT, "UInt", INADDR, "Ptr", 0, "UShort", 0, "Ptr", 0
                                                                                                         , "Ptr", &REPLY, "UInt", REPLYsize, "UInt", Timeout, "UInt")
                {
         Result := {}
         Result.InAddr := OrgAddr
         Result.IPAddr := StrGet(DllCall("Ws2_32\inet_ntoa", "UInt", NumGet(Reply, 0, "UInt"), "UPtr"), "CP0")
         Result.RTTime := NumGet(Reply, 8, "UInt")
      }
      else
         Err := "IcmpSendEcho failed with error " . A_LastError
      DllCall("Iphlpapi\IcmpCloseHandle", "Ptr", HPORT)
   }
   else
      Err := "IcmpCreateFile failed to open a port!"
        DllCall("FreeLibrary", "Ptr", HMOD)
   if (Err) {
      ErrorLevel := Err
      Return
   }
   ErrorLevel := 0
   Return Result.RTTime
}

