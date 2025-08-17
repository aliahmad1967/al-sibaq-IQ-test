# اختبار الذكاء المتقدم - Advanced IQ Test
# PowerShell Script to run the application

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "    اختبار الذكاء المتقدم" -ForegroundColor Yellow
Write-Host "    Advanced IQ Test" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Node.js is installed
try {
    $nodeVersion = node --version
    Write-Host "✓ Node.js detected: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ خطأ: Node.js غير مثبت على النظام" -ForegroundColor Red
    Write-Host "✗ Error: Node.js is not installed" -ForegroundColor Red
    Write-Host "يرجى تثبيت Node.js من: https://nodejs.org" -ForegroundColor Yellow
    Write-Host "Please install Node.js from: https://nodejs.org" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

# Check if npm dependencies are installed
if (-not (Test-Path "node_modules")) {
    Write-Host "📦 تثبيت المتطلبات..." -ForegroundColor Yellow
    Write-Host "📦 Installing dependencies..." -ForegroundColor Yellow
    npm install
    if ($LASTEXITCODE -ne 0) {
        Write-Host "✗ خطأ في تثبيت المتطلبات" -ForegroundColor Red
        Write-Host "✗ Error installing dependencies" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
    Write-Host "✓ تم تثبيت المتطلبات بنجاح" -ForegroundColor Green
    Write-Host "✓ Dependencies installed successfully" -ForegroundColor Green
}

# Build the application
Write-Host "🔨 بناء التطبيق..." -ForegroundColor Yellow
Write-Host "🔨 Building application..." -ForegroundColor Yellow
npm run build
if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ خطأ في بناء التطبيق" -ForegroundColor Red
    Write-Host "✗ Error building application" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}
Write-Host "✓ تم بناء التطبيق بنجاح" -ForegroundColor Green
Write-Host "✓ Application built successfully" -ForegroundColor Green

# Start the application
Write-Host ""
Write-Host "🚀 تشغيل التطبيق..." -ForegroundColor Yellow
Write-Host "🚀 Starting application..." -ForegroundColor Yellow
Write-Host ""
Write-Host "🌐 التطبيق يعمل الآن على: http://localhost:4173" -ForegroundColor Green
Write-Host "🌐 Application is running at: http://localhost:4173" -ForegroundColor Green
Write-Host ""
Write-Host "⚠️  لإيقاف التطبيق اضغط Ctrl+C" -ForegroundColor Yellow
Write-Host "⚠️  To stop the application press Ctrl+C" -ForegroundColor Yellow
Write-Host ""

# Open browser automatically
Start-Process "http://localhost:4173"

# Start the preview server
npm run preview
