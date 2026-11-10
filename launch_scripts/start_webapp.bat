@echo off
echo ?? Starting Web App on port 3000...
cd /d C:\Users\lutha\ruralfarm-ai-advanced\frontend\web-app
python -m http.server 3000
echo.
echo ? Web App crashed! Press any key to close...
pause
