@echo off
cd /d c:
for /f "tokens=*" %%a in (' mountvol %~d0 /l ') do ( mountvol %~d0 /d & mountvol D: %%a & exit )