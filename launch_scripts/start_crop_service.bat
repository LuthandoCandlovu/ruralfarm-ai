@echo off
echo ?? Starting Crop Service on port 8002...
cd /d C:\Users\lutha\ruralfarm-ai-advanced\services\crop-service
python -c "import sys; print(f'Python version: {sys.version}')"
echo.
echo Running Crop Service...
python main.py
echo.
echo ? Crop Service crashed! Press any key to close...
pause
