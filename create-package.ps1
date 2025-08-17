# Create deployment package for IQ Test Application
# إنشاء حزمة النشر لتطبيق اختبار الذكاء

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "    إنشاء حزمة اختبار الذكاء المتقدم" -ForegroundColor Yellow
Write-Host "    Creating IQ Test Package" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Build the application
Write-Host "🔨 بناء التطبيق..." -ForegroundColor Yellow
Write-Host "🔨 Building application..." -ForegroundColor Yellow
npm run build
if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ خطأ في بناء التطبيق" -ForegroundColor Red
    exit 1
}
Write-Host "✓ تم بناء التطبيق بنجاح" -ForegroundColor Green

# Create package directory
$packageDir = "IQ-Test-Package"
if (Test-Path $packageDir) {
    Remove-Item $packageDir -Recurse -Force
}
New-Item -ItemType Directory -Path $packageDir | Out-Null

Write-Host "📦 إنشاء الحزمة..." -ForegroundColor Yellow
Write-Host "📦 Creating package..." -ForegroundColor Yellow

# Copy essential files
Copy-Item "dist" -Destination "$packageDir/dist" -Recurse
Copy-Item "public" -Destination "$packageDir/public" -Recurse
Copy-Item "package.json" -Destination "$packageDir/"
Copy-Item "package-lock.json" -Destination "$packageDir/"
Copy-Item "vite.config.js" -Destination "$packageDir/"
Copy-Item "tailwind.config.js" -Destination "$packageDir/"
Copy-Item "postcss.config.js" -Destination "$packageDir/"
Copy-Item "run-iq-test.bat" -Destination "$packageDir/"
Copy-Item "run-iq-test.ps1" -Destination "$packageDir/"
Copy-Item "اختبار-الذكاء.html" -Destination "$packageDir/"
Copy-Item "README.md" -Destination "$packageDir/"

# Copy source files (optional, for developers)
Copy-Item "src" -Destination "$packageDir/src" -Recurse
Copy-Item "index.html" -Destination "$packageDir/"

# Create installation script
$installScript = @"
@echo off
title تثبيت اختبار الذكاء المتقدم - IQ Test Installation
echo.
echo ========================================
echo    تثبيت اختبار الذكاء المتقدم
echo    Installing Advanced IQ Test
echo ========================================
echo.

echo تثبيت المتطلبات...
echo Installing dependencies...
npm install

if %errorlevel% neq 0 (
    echo خطأ في التثبيت
    echo Installation failed
    pause
    exit /b 1
)

echo.
echo ✓ تم التثبيت بنجاح!
echo ✓ Installation completed successfully!
echo.
echo لتشغيل التطبيق:
echo To run the application:
echo 1. شغل ملف run-iq-test.bat
echo 1. Run run-iq-test.bat
echo 2. أو افتح اختبار-الذكاء.html
echo 2. Or open اختبار-الذكاء.html
echo.
pause
"@

$installScript | Out-File -FilePath "$packageDir/install.bat" -Encoding ASCII

# Create quick start guide
$quickStart = @"
# دليل البدء السريع - Quick Start Guide

## العربية

### التشغيل السريع:
1. شغل ملف `install.bat` لتثبيت المتطلبات
2. شغل ملف `run-iq-test.bat` لتشغيل التطبيق
3. أو افتح ملف `اختبار-الذكاء.html` في المتصفح

### المتطلبات:
- Node.js (من https://nodejs.org)
- متصفح حديث

### الملفات المهمة:
- `install.bat` - تثبيت المتطلبات
- `run-iq-test.bat` - تشغيل التطبيق
- `اختبار-الذكاء.html` - واجهة التشغيل
- `dist/index.html` - التطبيق المبني

## English

### Quick Run:
1. Run `install.bat` to install dependencies
2. Run `run-iq-test.bat` to start the application
3. Or open `اختبار-الذكاء.html` in browser

### Requirements:
- Node.js (from https://nodejs.org)
- Modern browser

### Important Files:
- `install.bat` - Install dependencies
- `run-iq-test.bat` - Run application
- `اختبار-الذكاء.html` - Launch interface
- `dist/index.html` - Built application
"@

$quickStart | Out-File -FilePath "$packageDir/QUICK-START.md" -Encoding UTF8

Write-Host "✓ تم إنشاء الحزمة في مجلد: $packageDir" -ForegroundColor Green
Write-Host "✓ Package created in folder: $packageDir" -ForegroundColor Green

# Create ZIP file
Write-Host "🗜️  إنشاء ملف مضغوط..." -ForegroundColor Yellow
Write-Host "🗜️  Creating ZIP file..." -ForegroundColor Yellow

$zipPath = "IQ-Test-Advanced-v1.0.zip"
if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

Compress-Archive -Path $packageDir -DestinationPath $zipPath -CompressionLevel Optimal

Write-Host "✓ تم إنشاء الملف المضغوط: $zipPath" -ForegroundColor Green
Write-Host "✓ ZIP file created: $zipPath" -ForegroundColor Green

Write-Host ""
Write-Host "🎉 تم إنشاء الحزمة بنجاح!" -ForegroundColor Green
Write-Host "🎉 Package created successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "📁 الملفات المتاحة:" -ForegroundColor Cyan
Write-Host "📁 Available files:" -ForegroundColor Cyan
Write-Host "   - $packageDir/ (مجلد الحزمة)"
Write-Host "   - $zipPath (ملف مضغوط)"
Write-Host ""
Write-Host "🚀 لتشغيل التطبيق:" -ForegroundColor Yellow
Write-Host "🚀 To run the application:" -ForegroundColor Yellow
Write-Host "   1. فك ضغط الملف المضغوط"
Write-Host "   1. Extract the ZIP file"
Write-Host "   2. شغل install.bat"
Write-Host "   2. Run install.bat"
Write-Host "   3. شغل run-iq-test.bat"
Write-Host "   3. Run run-iq-test.bat"
Write-Host ""

Read-Host "اضغط Enter للخروج - Press Enter to exit"
