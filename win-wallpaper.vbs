Dim fs, http, strm, ws, PREFIX, FOLDER, PATH, LIMIT, POS, DELAY

Set fs = CreateObject("Scripting.FileSystemObject")
Set ws = CreateObject("WScript.Shell")
Set http = CreateObject("MSXML2.ServerXMLHTTP.6.0") 
Set strm = createobject("Adodb.Stream")

LIMIT = 30
POS = 0.2
DELAY = 10000
PREFIX = ws.expandenvironmentstrings("%userprofile%") & "\Pictures"
FOLDER = "Wallpaper"

PATH = PREFIX & "\" & FOLDER

wscript.sleep DELAY

If Not fs.FolderExists(PREFIX) Then 
	fs.CreateFolder(PREFIX)
End If

If Not fs.FolderExists(PATH) Then 
	fs.CreateFolder(PATH)
End If


If LIMIT < fs.GetFolder(PATH).files.Count Then
	For Each file in fs.GetFolder(PATH).files
		Randomize
		If Rnd < POS Then
			fs.DeleteFile(file.path)
			Exit For
		End If
	Next
	For Each file in fs.GetFolder(PATH).files
		Randomize
		If Rnd < POS Then
			fs.DeleteFile(file.path)
			Exit For
		End If
	Next
End If



http.Open "GET", "https://api.yimian.xyz/img/?type=wallpaper", False
http.Send

with strm
    .type = 1 '//binary
    .open
    .write http.responseBody
    .savetofile PATH&"\"&http.getResponseHeader("content-length")&".jpg", 2 '//overwrite
end with