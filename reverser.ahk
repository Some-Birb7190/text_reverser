#SingleInstance, Force
; This is by far the worst piece of code I have ever written

!F10:: ; Reverses the whole clipboard
Send, ^c
if (clipboard != "")
{
    i = % (StrLen(clipboard))
    ; Send, % (i) 
    Loop, Parse, clipboard
    {
        Send, % SubStr(clipboard, i, 1)
        i := i-1
    }
}
Return

!F11:: ; Reverses each word individually
Send, ^c
if (clipboard != "")
{
    words := StrSplit(Clipboard, A_Space)
    i := 1
    For x in words
    {    
        j = % (StrLen(words[x]))
        Loop, Parse, % words[x]
        {
            Send, % (SubStr(words[x], j, 1))
            j := j-1
        }
        Send, % A_Space
    }
}
Return