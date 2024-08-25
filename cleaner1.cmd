@echo off

::Progress bar
color 0A
echo Loading...
echo ========================================
echo ^|                                ^|   0 ^|
echo ========================================
ping localhost -n 2 >nul
cls
echo Loading...
echo ========================================
echo ^|##                              ^|   5 ^|
echo ========================================
ping localhost -n 1 >nul
cls
echo Loading...
echo ========================================
echo ^|####                            ^|  15 ^|
echo ========================================
ping localhost -n 1 >nul
cls
echo Loading...
echo ========================================
echo ^|########                        ^|  30 ^|
echo ========================================
ping localhost -n 2 >nul
cls
echo Loading...
echo ========================================
echo ^|##########                      ^|  42 ^|
echo ========================================
ping localhost -n 1 >nul
cls
echo Loading...
echo ========================================
echo ^|##########                      ^|  45 ^|
echo ========================================
ping localhost -n 1 >nul
cls
echo Loading...
echo ========================================
echo ^|############                    ^|  47 ^|
echo ========================================
ping localhost -n 1 >nul
cls
echo Loading...
echo ========================================
echo ^|##############                  ^|  50 ^|
echo ========================================
ping localhost -n 2 >nul
cls
echo Loading...
echo ========================================
echo ^|################                ^|  52 ^|
echo ========================================
ping localhost -n 1 >nul
cls
echo Loading...
echo ========================================
echo ^|##################              ^|  53 ^|
echo ========================================
ping localhost -n 1 >nul
cls
echo Loading...
echo ========================================
echo ^|####################            ^|  65 ^|
echo ========================================
ping localhost -n 2 >nul
cls
echo Loading...
echo ========================================
echo ^|######################          ^|  70 ^|
echo ========================================
ping localhost -n 1 >nul
cls
echo Loading...
echo ========================================
echo ^|##########################      ^|  80 ^|
echo ========================================
ping localhost -n 1 >nul
cls
echo Loading...
echo ========================================
echo ^|############################    ^|  89 ^|
echo ========================================
ping localhost -n 1 >nul
cls
echo Loading...
echo ========================================
echo ^|##############################  ^|  90 ^|
echo ========================================
ping localhost -n 1 >nul
cls
echo Loading...
echo ========================================
echo ^|##############################  ^|  95 ^|
echo ========================================
ping localhost -n 1 >nul
cls
echo Loading Complete...
echo ========================================
echo ^|################################^| 100 ^|
echo ========================================
echo OK!

cls

title CLEANER-1
color a
echo Date : %date%
echo Starting with Simple Clean
ping -n 6 127.0.0.1 > nul

:: Sicherstellen, dass das Skript als Administrator ausgeführt wird
whoami /groups | find "S-1-5-32-544" > nul
if errorlevel 1 (
    echo RUN AS ADMIN
    pause
    exit /b
)

set DEL_PARAMS=/F /S /Q

del *.~* %DEL_PARAMS%
del .#*.* %DEL_PARAMS%
del *.$$$ %DEL_PARAMS%
del *.exe %DEL_PARAMS%
del *.apk %DEL_PARAMS%
del *.dof %DEL_PARAMS%
del *.ddp %DEL_PARAMS%
del *.bpl %DEL_PARAMS%
del *.bpi %DEL_PARAMS%
del *.dcp %DEL_PARAMS%
del *.so %DEL_PARAMS%
del *.drc %DEL_PARAMS%
del *.map %DEL_PARAMS%
del *.pas.bak %DEL_PARAMS%
del *.dcu %DEL_PARAMS%
del *.o %DEL_PARAMS%
del *.lib %DEL_PARAMS%
del *.tds %DEL_PARAMS%
del *.rsm %DEL_PARAMS%
del *.dres %DEL_PARAMS%
del *.identcache %DEL_PARAMS%
del *.local %DEL_PARAMS%
del *Resource.rc %DEL_PARAMS%
del *.hpp %DEL_PARAMS%
del *.cfg %DEL_PARAMS%
del *.ocx %DEL_PARAMS%
del *.tvsconfig %DEL_PARAMS%
del *.dsk %DEL_PARAMS%
del *.projdata %DEL_PARAMS%
del *.groupproj.local %DEL_PARAMS%
del *.dproj.local %DEL_PARAMS%
del *.identcache %DEL_PARAMS%
del *.stat %DEL_PARAMS%
del *.bak %DEL_PARAMS%

:: Löschen des Inhalts des Recent-Ordners
echo Löschen des Inhalts des Recent-Ordners...
RD /S /Q "%USERPROFILE%\Recent"
if errorlevel 1 (
    echo ERROR
) else (
    MKDIR "%USERPROFILE%\Recent"
)

:: Löschen aller temporären Dateien, die mit d3d10.dll zu tun haben
echo Deleting tracers from d3d10.dll
for /R "%TEMP%" %%F in (d3d10.dll*) do (
    takeown /f "%%F" /a
    icacls "%%F" /grant Administrators:F /c /l /q
    del /F /Q "%%F"
)
for /R "C:\Windows\Temp" %%F in (d3d10.dll*) do (
    takeown /f "%%F" /a
    icacls "%%F" /grant Administrators:F /c /l /q
    del /F /Q "%%F"
)

:: Löschen und erneutes Erstellen der Temp-Ordner
takeown /f "%TEMP%" /r /d y
icacls "%TEMP%" /grant Administrators:F /t /c /l /q
RD /S /Q "%TEMP%"
MKDIR "%TEMP%"

takeown /f "C:\Windows\Temp" /r /d y
icacls "C:\Windows\Temp" /grant Administrators:F /t /c /l /q
RD /S /Q "C:\Windows\Temp"
MKDIR "C:\Windows\Temp"

echo Cleaner Done.

