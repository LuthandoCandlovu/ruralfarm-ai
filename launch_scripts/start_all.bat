@echo off
echo ========================================
echo ?? Starting ALL RuralFarm AI Services
echo ========================================
echo.

start "API Gateway" cmd /k "cd /d C:\Users\lutha\ruralfarm-ai-advanced\services\api-gateway && python main.py"
timeout /t 2 /nobreak >nul

start "Crop Service" cmd /k "cd /d C:\Users\lutha\ruralfarm-ai-advanced\services\crop-service && python main.py"
timeout /t 2 /nobreak >nul

start "Disease Service" cmd /k "cd /d C:\Users\lutha\ruralfarm-ai-advanced\services\disease-service && python main.py"
timeout /t 2 /nobreak >nul

start "Market Service" cmd /k "cd /d C:\Users\lutha\ruralfarm-ai-advanced\services\market-service && python main.py"
timeout /t 2 /nobreak >nul

start "Weather Service" cmd /k "cd /d C:\Users\lutha\ruralfarm-ai-advanced\services\weather-service && python main.py"
timeout /t 2 /nobreak >nul

start "Web App" cmd /k "cd /d C:\Users\lutha\ruralfarm-ai-advanced\frontend\web-app && python -m http.server 3000 --bind 127.0.0.1"

echo.
echo ========================================
echo ? All services launched!
echo ========================================
echo.
echo ?? Service URLs:
echo   ?? API Gateway: http://localhost:8000
echo   ?? API Docs: http://localhost:8000/docs
echo   ?? Crop Service: http://localhost:8002
echo   ?? Disease Service: http://localhost:8003
echo   ?? Market Service: http://localhost:8004
echo   ??? Weather Service: http://localhost:8005
echo   ?? Web App: http://127.0.0.1:3000
echo.
echo Press any key to close...
pause >nul
