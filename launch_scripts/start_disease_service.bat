@echo off
echo ?? Starting Disease Service on port 8003...
cd /d C:\Users\lutha\ruralfarm-ai-advanced\services\disease-service
python -c "import sys; print(f'Python version: {sys.version}')"
echo.
echo Running Disease Service...
python main.py
echo.
echo ? Disease Service crashed! Press any key to close...
pause
