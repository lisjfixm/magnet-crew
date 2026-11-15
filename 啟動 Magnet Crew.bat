@echo off
chcp 65001 >nul
cd /d "%~dp0"
set "PY="
where py >nul 2>nul
if not errorlevel 1 set "PY=py"
if not defined PY (
  where python >nul 2>nul
  if not errorlevel 1 set "PY=python"
)
if not defined PY (
  echo [錯誤] 找不到 Python 啟動器 (py)。請先安裝 Python 並勾選 Add python.exe to PATH。
  pause
  exit /b 1
)
start "Magnet Crew Local Server" %PY% -m http.server 8783 --bind 127.0.0.1
timeout /t 1 >nul
start "" http://127.0.0.1:8783/index.html
