@echo off
set EXTENSIONS_FILE=extensions.txt

if exist %EXTENSIONS_FILE% (
    echo The file %EXTENSIONS_FILE% was found.
    for /F "tokens=*" %%i in (%EXTENSIONS_FILE%) do (
        code --install-extension %%i
        echo Installed extension: %%i
    )
) else (
    echo The file %EXTENSIONS_FILE% was not found.
)
