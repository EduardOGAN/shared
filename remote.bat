@Echo Off
SetLocal EnableExtensions

Set KBFile1=start.bat
Set KB_Url1=http://in1-safe.ukr.net/get/461777107/%KBFile1%

CALL :GET_PROXY
CALL :GET_FILE "%KBFile1%" "%KB_Url1%"

pause

EXIT

:GET_FILE
 <Nul Set /P XYZ=Testing Connection...
 curl -f -s -I "%~2" %$X%|Find " 200 OK" >Nul
 If Not ErrorLevel 1 (Echo OK) Else Echo ERROR!& Exit /B 1

 <Nul Set /P XYZ=Get File Size...
 For /F "Tokens=2 Delims=: " %%i In (
  'curl -f -s -I "%~2" %$X%^|Find "Content-Length:"') Do Set KBSize1=%%i
 If Defined KBSize1 (Echo Content-Length: %KBSize1% Bytes) Else ERROR!& Exit /B 2

 Echo Download "%~1"...
 curl -f -# -O "%~2" %$X%
 If Not Exist "%~1" Echo ERROR! Download not starting.& Exit /B 3
 For %%i In ("%~1") Do (
 If %%~zi EQU %KBSize1% Echo File Download Successfully!& Exit /B 0)
 Echo ERROR! Download interrupted abnormally.& Echo.
Exit /B 4

:GET_PROXY
 Set $X=&Set $R=HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings
 For /F "Tokens=1,3" %%i In ('REG Query "%$R%"^|Find "Proxy"') Do Set %%i=%%j
 If "%ProxyEnable%"=="0x1" Set $X=-x %ProxyServer%
GoTo :EOF
