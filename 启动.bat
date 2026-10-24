@echo off
chcp 65001 >nul
setlocal
set "PAGE=%~dp0index.html"
set "PROFILE=%LOCALAPPDATA%\assets-hub-edge"

set "BROWSER="
if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" set "BROWSER=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if not defined BROWSER if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" set "BROWSER=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
if not defined BROWSER if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set "BROWSER=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not defined BROWSER if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set "BROWSER=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"

if not defined BROWSER (
  echo 没找到 Edge / Chrome，用系统默认浏览器打开（导出 PNG 可能因权限失败）
  start "" "%PAGE%"
  exit /b
)

start "" "%BROWSER%" --allow-file-access-from-files --user-data-dir="%PROFILE%" --start-maximized --new-window "%PAGE%"
exit /b
