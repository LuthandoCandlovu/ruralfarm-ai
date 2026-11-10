# ============================================
# MASTER LAUNCHER - RUNS ALL SERVICES
# ============================================

Write-Host "🚀 Starting all services..." -ForegroundColor Green

# Start each service as a background job
$jobs = @()

# API Gateway
$jobs += Start-Job -Name "APIGateway" -ScriptBlock {
    Set-Location "C:\Users\lutha\ruralfarm-ai-advanced\services\api-gateway"
    python main.py
}

# Crop Service
$jobs += Start-Job -Name "CropService" -ScriptBlock {
    Set-Location "C:\Users\lutha\ruralfarm-ai-advanced\services\crop-service"
    python main.py
}

# Disease Service
$jobs += Start-Job -Name "DiseaseService" -ScriptBlock {
    Set-Location "C:\Users\lutha\ruralfarm-ai-advanced\services\disease-service"
    python main.py
}

# Market Service
$jobs += Start-Job -Name "MarketService" -ScriptBlock {
    Set-Location "C:\Users\lutha\ruralfarm-ai-advanced\services\market-service"
    python main.py
}

# Weather Service
$jobs += Start-Job -Name "WeatherService" -ScriptBlock {
    Set-Location "C:\Users\lutha\ruralfarm-ai-advanced\services\weather-service"
    python main.py
}

# Web App
$jobs += Start-Job -Name "WebApp" -ScriptBlock {
    Set-Location "C:\Users\lutha\ruralfarm-ai-advanced\frontend\web-app"
    python -m http.server 3000 --bind 127.0.0.1
}

Write-Host "⏳ Waiting 15 seconds for services to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 15

# Test all services
Write-Host "`n🧪 Testing services..." -ForegroundColor Cyan

$testUrls = @(
    @{Name="API Gateway"; Url="http://127.0.0.1:8000/"},
    @{Name="Crop Service"; Url="http://127.0.0.1:8002/health"},
    @{Name="Disease Service"; Url="http://127.0.0.1:8003/health"},
    @{Name="Market Service"; Url="http://127.0.0.1:8004/health"},
    @{Name="Weather Service"; Url="http://127.0.0.1:8005/health"},
    @{Name="Web App"; Url="http://127.0.0.1:3000"}
)

$allGood = $true
foreach ($t in $testUrls) {
    try {
        $response = Invoke-RestMethod -Uri $t.Url -TimeoutSec 3 -ErrorAction Stop
        Write-Host "  ✅ $($t.Name) - RUNNING" -ForegroundColor Green
    } catch {
        Write-Host "  ❌ $($t.Name) - NOT RUNNING" -ForegroundColor Red
        $allGood = $false
    }
}

if ($allGood) {
    Write-Host "`n========================================" -ForegroundColor Green
    Write-Host "✅ ALL SERVICES ARE RUNNING!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    
    Start-Process "http://127.0.0.1:3000"
    
    Write-Host "`n📊 URLs:" -ForegroundColor Cyan
    Write-Host "  🌐 Web App: http://127.0.0.1:3000" -ForegroundColor White
    Write-Host "  📚 API Docs: http://127.0.0.1:8000/docs" -ForegroundColor White
} else {
    Write-Host "`n⚠️ Some services failed to start" -ForegroundColor Red
}

Write-Host "`n⏳ Services running. Press Ctrl+C to stop all..." -ForegroundColor Yellow
Write-Host "Keep this window open!" -ForegroundColor Yellow

# Wait for user to press Ctrl+C
try {
    while ($true) {
        Start-Sleep -Seconds 10
        Write-Host "." -NoNewline -ForegroundColor Gray
    }
} finally {
    Write-Host "`n🛑 Stopping all services..." -ForegroundColor Yellow
    Get-Job | Stop-Job
    Get-Job | Remove-Job
}
