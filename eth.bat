@Echo Off
setx GPU_FORCE_64BIT_PTR 0
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100
setx GPU_SINGLE_ALLOC_PERCENT 100
@Echo On

EthDcrMiner64.exe -mode 1 -epool eu1.ethermine.org:4444 -ewal 0x63eD9066802675985Eedb41609374F2329773c89 -eworker %computername% -epsw x -dbg -1 -r 1

echo "Unexpected error..."
timeout 20
reboot.bat
