@echo off
title Aktivator v1.2 [Dont close this window]
echo This script will automatically activate Windows 10 Pro for free.
echo Please confirm every Pop-Up Window by clicking "Okay".
echo Wait until this window closes itself and dont close it on your own. Thanks
slmgr /upk
slmgr.vbs /cpky
slmgr /ckms
slmgr.vbs /ckms
slmgr /skms localhost
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms kms.digiboy.ir
echo Attention! This may take a while
slmgr /ato
echo Finished!
exit
