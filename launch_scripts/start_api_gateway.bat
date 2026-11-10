@echo off
echo ?? Starting API Gateway on port 8000...
cd /d C:\Users\lutha\ruralfarm-ai-advanced\services\api-gateway
python -c "import sys; print(f'Python version: {sys.version}')"
echo.
echo Running API Gateway...
python main.py
echo.
echo ? API Gateway crashed! Press any key to close...
pause
