EthDcrMiner64.exe -mode 1 -epool eu1.ethermine.org:4444 -ewal %ETH_WALLET% -eworker %computername% -epsw x -dbg -1 -r 1
# if unexpected error
timeout 20
reboot.bat
