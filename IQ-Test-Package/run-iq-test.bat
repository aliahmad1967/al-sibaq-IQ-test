@echo off
title اختبار الذكاء المتقدم - Advanced IQ Test
echo.
echo ========================================
echo    اختبار الذكاء المتقدم
echo    Advanced IQ Test
echo ========================================
echo.
echo جاري تشغيل التطبيق...
echo Starting the application...
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo خطأ: Node.js غير مثبت على النظام
    echo Error: Node.js is not installed
    echo يرجى تثبيت Node.js من: https://nodejs.org
    echo Please install Node.js from: https://nodejs.org
    pause
    exit /b 1
)

REM Check if npm dependencies are installed
if not exist "node_modules" (
    echo تثبيت المتطلبات...
    echo Installing dependencies...
    npm install
    if %errorlevel% neq 0 (
        echo خطأ في تثبيت المتطلبات
        echo Error installing dependencies
        pause
        exit /b 1
    )
)

REM Build the application
echo بناء التطبيق...
echo Building application...
npm run build
if %errorlevel% neq 0 (
    echo خطأ في بناء التطبيق
    echo Error building application
    pause
    exit /b 1
)

REM Start the application
echo تشغيل التطبيق...
echo Starting application...
echo.
echo التطبيق يعمل الآن على: http://localhost:3000
echo Application is running at: http://localhost:3000
echo.
echo لإيقاف التطبيق اضغط Ctrl+C
echo To stop the application press Ctrl+C
echo.

npm run preview

pause
