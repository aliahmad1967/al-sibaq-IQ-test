@echo off
setlocal enabledelayedexpansion
title 🧠 اختبار الذكاء المتقدم - مثبت سهل
color 0B
chcp 65001 >nul

cls
echo.
echo    ██████╗ ██████╗      ████████╗███████╗███████╗████████╗
echo    ██╔══██╗██╔══██╗     ╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝
echo    ██║  ██║██████╔╝        ██║   █████╗  ███████╗   ██║   
echo    ██║  ██║██╔══██╗        ██║   ██╔══╝  ╚════██║   ██║   
echo    ██████╔╝██║  ██║        ██║   ███████╗███████║   ██║   
echo    ╚═════╝ ╚═╝  ╚═╝        ╚═╝   ╚══════╝╚══════╝   ╚═╝   
echo.
echo                    🧠 اختبار الذكاء المتقدم 🧠
echo                     Advanced IQ Test
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

:: Check for application files
set "APP_FOUND=0"
if exist "dist\index.html" set "APP_FOUND=1"
if exist "IQ-Test-Package\dist\index.html" set "APP_FOUND=1"

if "%APP_FOUND%"=="0" (
    echo ❌ خطأ: لم يتم العثور على ملفات التطبيق
    echo ❌ Error: Application files not found
    echo.
    echo 📁 يجب وضع هذا الملف في نفس مجلد التطبيق
    echo 📁 This file must be in the same folder as the application
    echo.
    pause
    exit /b 1
)

echo 🎯 تم العثور على ملفات التطبيق
echo 🎯 Application files found
echo.

:: Simple installation choice
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                        اختر طريقة التثبيت                    ║
echo ║                      Choose Installation Method              ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo [1] 🚀 تثبيت سريع (مستحسن)
echo     Quick Install (Recommended)
echo.
echo [2] 🔧 تثبيت متقدم مع Node.js
echo     Advanced Install with Node.js
echo.
echo [3] 🌐 تشغيل مباشر في المتصفح
echo     Run directly in browser
echo.
echo [4] ❌ إلغاء
echo     Cancel
echo.
set /p "choice=اختر رقم / Choose number (1-4): "

if "%choice%"=="1" goto :QuickInstall
if "%choice%"=="2" goto :AdvancedInstall
if "%choice%"=="3" goto :DirectRun
if "%choice%"=="4" goto :Cancel
goto :InvalidChoice

:QuickInstall
cls
echo.
echo 🚀 التثبيت السريع
echo 🚀 Quick Installation
echo.

set "INSTALL_DIR=%USERPROFILE%\Desktop\اختبار الذكاء"
echo 📁 سيتم التثبيت في: %INSTALL_DIR%
echo 📁 Will install to: %INSTALL_DIR%
echo.

if exist "%INSTALL_DIR%" (
    echo 🗑️  إزالة التثبيت السابق...
    rmdir /s /q "%INSTALL_DIR%" 2>nul
)

echo 📋 نسخ الملفات...
echo 📋 Copying files...
mkdir "%INSTALL_DIR%" 2>nul

if exist "IQ-Test-Package" (
    xcopy "IQ-Test-Package\dist\*" "%INSTALL_DIR%\" /e /i /q /y >nul
) else (
    xcopy "dist\*" "%INSTALL_DIR%\" /e /i /q /y >nul
)

:: Create simple launcher
(
echo @echo off
echo title 🧠 اختبار الذكاء المتقدم
echo cd /d "%INSTALL_DIR%"
echo echo 🚀 تشغيل اختبار الذكاء المتقدم...
echo echo 🚀 Starting Advanced IQ Test...
echo start "" "index.html"
echo timeout /t 2 /nobreak ^>nul
echo exit
) > "%INSTALL_DIR%\🧠 تشغيل الاختبار.bat"

:: Create desktop shortcut
echo 🔗 إنشاء اختصار سطح المكتب...
powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%USERPROFILE%\Desktop\🧠 اختبار الذكاء.lnk'); $Shortcut.TargetPath = '%INSTALL_DIR%\🧠 تشغيل الاختبار.bat'; $Shortcut.WorkingDirectory = '%INSTALL_DIR%'; $Shortcut.Description = 'اختبار الذكاء المتقدم'; $Shortcut.Save()" >nul 2>&1

echo.
echo ✅ تم التثبيت بنجاح!
echo ✅ Installation completed successfully!
echo.
echo 🎯 تم إنشاء:
echo 🎯 Created:
echo    📁 مجلد: %INSTALL_DIR%
echo    📁 Folder: %INSTALL_DIR%
echo    🔗 اختصار سطح المكتب: 🧠 اختبار الذكاء
echo    🔗 Desktop shortcut: 🧠 اختبار الذكاء
echo.
echo 🚀 هل تريد تشغيل الاختبار الآن؟ (Y/N)
echo 🚀 Do you want to run the test now? (Y/N)
set /p "run=اختر / Choose: "
if /i "%run%"=="Y" (
    start "" "%INSTALL_DIR%\🧠 تشغيل الاختبار.bat"
)
goto :Success

:AdvancedInstall
cls
echo.
echo 🔧 التثبيت المتقدم
echo 🔧 Advanced Installation
echo.

:: Check Node.js
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js غير مثبت
    echo ❌ Node.js not installed
    echo.
    echo 📥 تحميل Node.js من: https://nodejs.org
    echo 📥 Download Node.js from: https://nodejs.org
    start https://nodejs.org/
    pause
    exit /b 1
)

call installer.bat
goto :Success

:DirectRun
cls
echo.
echo 🌐 تشغيل مباشر
echo 🌐 Direct Run
echo.

if exist "dist\index.html" (
    echo 🚀 تشغيل التطبيق...
    echo 🚀 Starting application...
    start "" "dist\index.html"
) else if exist "IQ-Test-Package\dist\index.html" (
    echo 🚀 تشغيل التطبيق...
    echo 🚀 Starting application...
    start "" "IQ-Test-Package\dist\index.html"
) else (
    echo ❌ لم يتم العثور على ملف التطبيق
    echo ❌ Application file not found
    pause
    exit /b 1
)
goto :Success

:InvalidChoice
echo ❌ اختيار غير صحيح
echo ❌ Invalid choice
timeout /t 2 /nobreak >nul
goto :QuickInstall

:Cancel
echo ❌ تم إلغاء التثبيت
echo ❌ Installation cancelled
pause
exit /b 0

:Success
echo.
echo 🎉 شكراً لاستخدام اختبار الذكاء المتقدم!
echo 🎉 Thank you for using Advanced IQ Test!
echo.
echo 💡 نصائح:
echo 💡 Tips:
echo    • استخدم متصفح حديث للحصول على أفضل تجربة
echo    • Use a modern browser for the best experience
echo    • يمكنك تشغيل الاختبار بدون إنترنت
echo    • You can run the test without internet
echo.
pause
exit /b 0
