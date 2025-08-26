# bindings/settings

## At home

1. run cmd as admin

```bash
# cd to your vscode settings dir
cd c:\Users\arvydas\AppData\Roaming\Code\User

# make symlink to settings.json from vscode dotfiles repo
mklink settings.json C:\Users\arvydas\Desktop\GIT\dotfiles\vscode\settings.json

# make symlink to keybindings.json from vscode dotfiles repo
mklink keybindings.json C:\Users\arvydas\Desktop\GIT\dotfiles\vscode\keybindings.json
```

## At work

1. Order SID LAR (if on work laptop)

```bash
# jeigu darai darbe - galimai po direktorijos pokyciu - neuzsisakiau lar ir pridejau fiziskai tuos failiukus i roaming/code/user forlderi, ne symlinkas

# cd to your vscode settings dir
cd c:\Users\s2753g\AppData\Roaming\Code\User

# make symlink to settings.json from vscode dotfiles repo
mklink settings.json C:\Users\s2753g\GIT\dotfiles\vscode\settings.json

# make symlink to keybindings.json from vscode dotfiles repo
mklink keybindings.json C:\Users\s2753g\GIT\dotfiles\vscode\keybindings.json
```

# extensions

Put all the extensions you want to install in `extensions.txt` file. Install them with `./install-extensions.bat`

```bat
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
```
