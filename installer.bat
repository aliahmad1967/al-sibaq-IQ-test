@echo off
setlocal enabledelayedexpansion
title اختبار الذكاء المتقدم - مثبت التطبيق
color 0B

:: Set console to UTF-8 for Arabic support
chcp 65001 >nul

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                    اختبار الذكاء المتقدم                     ║
echo ║                   Advanced IQ Test Installer                ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo 🧠 مرحباً بك في مثبت اختبار الذكاء المتقدم
echo 🧠 Welcome to Advanced IQ Test Installer
echo.

:: Check if running as administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    echo ✅ تم تشغيل المثبت بصلاحيات المدير
    echo ✅ Running with administrator privileges
) else (
    echo ⚠️  تحذير: يُنصح بتشغيل المثبت كمدير
    echo ⚠️  Warning: Recommended to run as administrator
)
echo.

:: Set installation directory
set "INSTALL_DIR=%USERPROFILE%\Desktop\اختبار الذكاء المتقدم"
echo 📁 مجلد التثبيت: %INSTALL_DIR%
echo 📁 Installation directory: %INSTALL_DIR%
echo.

:: Ask user for confirmation
echo هل تريد المتابعة مع التثبيت؟ (Y/N)
echo Do you want to continue with installation? (Y/N)
set /p "choice=اختر / Choose: "
if /i not "%choice%"=="Y" if /i not "%choice%"=="y" (
    echo تم إلغاء التثبيت
    echo Installation cancelled
    pause
    exit /b 0
)

echo.
echo 🔄 بدء عملية التثبيت...
echo 🔄 Starting installation process...
echo.

:: Create installation directory
if exist "%INSTALL_DIR%" (
    echo 🗑️  إزالة التثبيت السابق...
    echo 🗑️  Removing previous installation...
    rmdir /s /q "%INSTALL_DIR%" 2>nul
)

echo 📁 إنشاء مجلد التثبيت...
echo 📁 Creating installation directory...
mkdir "%INSTALL_DIR%" 2>nul
if not exist "%INSTALL_DIR%" (
    echo ❌ فشل في إنشاء مجلد التثبيت
    echo ❌ Failed to create installation directory
    pause
    exit /b 1
)

:: Copy application files
echo 📋 نسخ ملفات التطبيق...
echo 📋 Copying application files...

if exist "IQ-Test-Package" (
    xcopy "IQ-Test-Package\*" "%INSTALL_DIR%\" /e /i /q /y >nul 2>&1
) else if exist "dist" (
    xcopy "dist\*" "%INSTALL_DIR%\dist\" /e /i /q /y >nul 2>&1
    copy "package.json" "%INSTALL_DIR%\" >nul 2>&1
    copy "run-iq-test.bat" "%INSTALL_DIR%\" >nul 2>&1 || (
        echo Creating run script...
        call :CreateRunScript "%INSTALL_DIR%"
    )
) else (
    echo ❌ لم يتم العثور على ملفات التطبيق
    echo ❌ Application files not found
    pause
    exit /b 1
)

:: Check if Node.js is installed
echo 🔍 فحص Node.js...
echo 🔍 Checking Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ⚠️  Node.js غير مثبت على النظام
    echo ⚠️  Node.js is not installed on the system
    echo.
    echo 📥 هل تريد تحميل Node.js الآن؟ (Y/N)
    echo 📥 Do you want to download Node.js now? (Y/N)
    set /p "download=اختر / Choose: "
    if /i "!download!"=="Y" if /i "!download!"=="y" (
        echo 🌐 فتح صفحة تحميل Node.js...
        echo 🌐 Opening Node.js download page...
        start https://nodejs.org/
        echo.
        echo 📝 يرجى تثبيت Node.js ثم تشغيل المثبت مرة أخرى
        echo 📝 Please install Node.js and run the installer again
        pause
        exit /b 1
    )
) else (
    for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
    echo ✅ Node.js مثبت: !NODE_VERSION!
    echo ✅ Node.js installed: !NODE_VERSION!
)

:: Install dependencies if package.json exists
if exist "%INSTALL_DIR%\package.json" (
    echo.
    echo 📦 تثبيت المتطلبات...
    echo 📦 Installing dependencies...
    cd /d "%INSTALL_DIR%"
    npm install --silent --no-progress >nul 2>&1
    if !errorlevel! neq 0 (
        echo ⚠️  تحذير: فشل في تثبيت بعض المتطلبات
        echo ⚠️  Warning: Failed to install some dependencies
    ) else (
        echo ✅ تم تثبيت المتطلبات بنجاح
        echo ✅ Dependencies installed successfully
    )
)

:: Create desktop shortcut
echo 🔗 إنشاء اختصار على سطح المكتب...
echo 🔗 Creating desktop shortcut...
call :CreateDesktopShortcut

:: Create start menu shortcut
echo 📋 إنشاء اختصار في قائمة ابدأ...
echo 📋 Creating start menu shortcut...
call :CreateStartMenuShortcut

:: Create uninstaller
echo 🗑️  إنشاء أداة إلغاء التثبيت...
echo 🗑️  Creating uninstaller...
call :CreateUninstaller "%INSTALL_DIR%"

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                      ✅ تم التثبيت بنجاح!                    ║
echo ║                   ✅ Installation Successful!                ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo 🎉 تم تثبيت اختبار الذكاء المتقدم بنجاح!
echo 🎉 Advanced IQ Test installed successfully!
echo.
echo 📍 مكان التثبيت: %INSTALL_DIR%
echo 📍 Installation location: %INSTALL_DIR%
echo.
echo 🚀 طرق تشغيل التطبيق:
echo 🚀 Ways to run the application:
echo    1. اختصار سطح المكتب / Desktop shortcut
echo    2. قائمة ابدأ / Start menu
echo    3. مجلد التثبيت / Installation folder
echo.
echo 🔄 هل تريد تشغيل التطبيق الآن؟ (Y/N)
echo 🔄 Do you want to run the application now? (Y/N)
set /p "run=اختر / Choose: "
if /i "%run%"=="Y" if /i "%run%"=="y" (
    echo 🚀 تشغيل التطبيق...
    echo 🚀 Starting application...
    call "%INSTALL_DIR%\run-iq-test.bat"
)

echo.
echo شكراً لاستخدام اختبار الذكاء المتقدم!
echo Thank you for using Advanced IQ Test!
pause
exit /b 0

:: Function to create run script
:CreateRunScript
set "TARGET_DIR=%~1"
(
echo @echo off
echo title اختبار الذكاء المتقدم - Advanced IQ Test
echo cd /d "%TARGET_DIR%"
echo if exist "dist\index.html" ^(
echo     echo Starting Advanced IQ Test...
echo     start "" "dist\index.html"
echo ^) else ^(
echo     echo Building and starting application...
echo     npm run build
echo     npm run preview
echo ^)
) > "%TARGET_DIR%\run-iq-test.bat"
goto :eof

:: Function to create desktop shortcut
:CreateDesktopShortcut
set "SHORTCUT_PATH=%USERPROFILE%\Desktop\اختبار الذكاء المتقدم.lnk"
powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%SHORTCUT_PATH%'); $Shortcut.TargetPath = '%INSTALL_DIR%\run-iq-test.bat'; $Shortcut.WorkingDirectory = '%INSTALL_DIR%'; $Shortcut.Description = 'اختبار الذكاء المتقدم - Advanced IQ Test'; $Shortcut.Save()" >nul 2>&1
goto :eof

:: Function to create start menu shortcut
:CreateStartMenuShortcut
set "START_MENU_DIR=%APPDATA%\Microsoft\Windows\Start Menu\Programs\اختبار الذكاء المتقدم"
mkdir "%START_MENU_DIR%" 2>nul
set "START_SHORTCUT_PATH=%START_MENU_DIR%\اختبار الذكاء المتقدم.lnk"
powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%START_SHORTCUT_PATH%'); $Shortcut.TargetPath = '%INSTALL_DIR%\run-iq-test.bat'; $Shortcut.WorkingDirectory = '%INSTALL_DIR%'; $Shortcut.Description = 'اختبار الذكاء المتقدم - Advanced IQ Test'; $Shortcut.Save()" >nul 2>&1
goto :eof

:: Function to create uninstaller
:CreateUninstaller
set "TARGET_DIR=%~1"
(
echo @echo off
echo title إلغاء تثبيت اختبار الذكاء المتقدم
echo echo.
echo echo هل أنت متأكد من إلغاء تثبيت اختبار الذكاء المتقدم؟ ^(Y/N^)
echo set /p "confirm=اختر: "
echo if /i not "%%confirm%%"=="Y" if /i not "%%confirm%%"=="y" exit /b 0
echo echo.
echo echo جاري إلغاء التثبيت...
echo del "%%USERPROFILE%%\Desktop\اختبار الذكاء المتقدم.lnk" 2^>nul
echo rmdir /s /q "%%APPDATA%%\Microsoft\Windows\Start Menu\Programs\اختبار الذكاء المتقدم" 2^>nul
echo cd /d "%%USERPROFILE%%"
echo rmdir /s /q "%TARGET_DIR%" 2^>nul
echo echo تم إلغاء التثبيت بنجاح
echo pause
) > "%TARGET_DIR%\uninstall.bat"
goto :eof
