@echo off
echo ?? Starting Market Service on port 8004...
cd /d C:\Users\lutha\ruralfarm-ai-advanced\services\market-service
python -c "import sys; print(f'Python version: {sys.version}')"
echo.
echo Running Market Service...
python main.py
echo.
echo ? Market Service crashed! Press any key to close...
pause
