@echo off
echo ========================================
echo ?? Starting ALL RuralFarm AI Services
echo ========================================
echo.

start "API Gateway" cmd /k "cd /d C:\Users\lutha\ruralfarm-ai-advanced\launch_scripts && start_api_gateway.bat"
timeout /t 2 /nobreak >nul

start "Crop Service" cmd /k "cd /d C:\Users\lutha\ruralfarm-ai-advanced\launch_scripts && start_crop_service.bat"
timeout /t 2 /nobreak >nul

start "Disease Service" cmd /k "cd /d C:\Users\lutha\ruralfarm-ai-advanced\launch_scripts && start_disease_service.bat"
timeout /t 2 /nobreak >nul

start "Market Service" cmd /k "cd /d C:\Users\lutha\ruralfarm-ai-advanced\launch_scripts && start_market_service.bat"
timeout /t 2 /nobreak >nul

start "Weather Service" cmd /k "cd /d C:\Users\lutha\ruralfarm-ai-advanced\launch_scripts && start_weather_service.bat"

echo.
echo ========================================
echo ? All services launched!
echo ========================================
echo.
echo ?? Service URLs:
echo   ?? API Gateway: http://localhost:8000
echo   ?? Crop Service: http://localhost:8002
echo   ?? Disease Service: http://localhost:8003
echo   ?? Market Service: http://localhost:8004
echo   ??? Weather Service: http://localhost:8005
echo.
echo ?? API Docs: http://localhost:8000/docs
echo.
echo Press any key to close this window...
pause >nul
