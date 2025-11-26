@echo off
rem Add local build tools to the front of PATH (relative to this script path)
set "SCRIPT_DIR=%~dp0"
set "PATH=%SCRIPT_DIR%build\tools\win\gn-windows-amd64;%SCRIPT_DIR%build\tools\win;%PATH%"
echo PATH updated for this session.
exit /b 0
