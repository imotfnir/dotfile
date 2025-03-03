OnClipboardChange ChangeLatexFormat

ChangeLatexFormat(DataType) {
    A_Clipboard := RegExReplace(A_Clipboard,"m)\\\(\s|\s\\\)","$$",)
    A_Clipboard := RegExReplace(A_Clipboard,"m)^\\\[|\\\]$","$$$$",)
}
