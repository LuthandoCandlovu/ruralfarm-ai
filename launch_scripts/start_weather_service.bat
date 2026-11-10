@echo off
echo ??? Starting Weather Service on port 8005...
cd /d C:\Users\lutha\ruralfarm-ai-advanced\services\weather-service
python -c "import sys; print(f'Python version: {sys.version}')"
echo.
echo Running Weather Service...
python main.py
echo.
echo ? Weather Service crashed! Press any key to close...
pause
