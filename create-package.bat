@echo off
title Creating IQ Test Package
echo.
echo ========================================
echo    Creating Advanced IQ Test Package
echo ========================================
echo.

echo Building application...
call npm run build
if %errorlevel% neq 0 (
    echo Build failed!
    pause
    exit /b 1
)
echo Build completed successfully!

echo.
echo Creating package directory...
if exist "IQ-Test-Package" rmdir /s /q "IQ-Test-Package"
mkdir "IQ-Test-Package"

echo Copying files...
xcopy "dist" "IQ-Test-Package\dist\" /e /i /q
xcopy "public" "IQ-Test-Package\public\" /e /i /q
copy "package.json" "IQ-Test-Package\"
copy "package-lock.json" "IQ-Test-Package\"
copy "vite.config.js" "IQ-Test-Package\"
copy "tailwind.config.js" "IQ-Test-Package\"
copy "postcss.config.js" "IQ-Test-Package\"
copy "run-iq-test.bat" "IQ-Test-Package\"
copy "run-iq-test.ps1" "IQ-Test-Package\"
copy "اختبار-الذكاء.html" "IQ-Test-Package\"
copy "README.md" "IQ-Test-Package\"
xcopy "src" "IQ-Test-Package\src\" /e /i /q
copy "index.html" "IQ-Test-Package\"

echo Creating installation script...
echo @echo off > "IQ-Test-Package\install.bat"
echo title Installing IQ Test Dependencies >> "IQ-Test-Package\install.bat"
echo echo. >> "IQ-Test-Package\install.bat"
echo echo Installing dependencies... >> "IQ-Test-Package\install.bat"
echo npm install >> "IQ-Test-Package\install.bat"
echo if %%errorlevel%% neq 0 ( >> "IQ-Test-Package\install.bat"
echo     echo Installation failed >> "IQ-Test-Package\install.bat"
echo     pause >> "IQ-Test-Package\install.bat"
echo     exit /b 1 >> "IQ-Test-Package\install.bat"
echo ^) >> "IQ-Test-Package\install.bat"
echo echo. >> "IQ-Test-Package\install.bat"
echo echo Installation completed successfully! >> "IQ-Test-Package\install.bat"
echo echo To run the application: >> "IQ-Test-Package\install.bat"
echo echo 1. Run run-iq-test.bat >> "IQ-Test-Package\install.bat"
echo echo 2. Or open the HTML file in browser >> "IQ-Test-Package\install.bat"
echo pause >> "IQ-Test-Package\install.bat"

echo Creating quick start guide...
echo # Quick Start Guide > "IQ-Test-Package\QUICK-START.md"
echo. >> "IQ-Test-Package\QUICK-START.md"
echo ## Quick Run: >> "IQ-Test-Package\QUICK-START.md"
echo 1. Run `install.bat` to install dependencies >> "IQ-Test-Package\QUICK-START.md"
echo 2. Run `run-iq-test.bat` to start the application >> "IQ-Test-Package\QUICK-START.md"
echo 3. Or open the HTML file in browser >> "IQ-Test-Package\QUICK-START.md"
echo. >> "IQ-Test-Package\QUICK-START.md"
echo ## Requirements: >> "IQ-Test-Package\QUICK-START.md"
echo - Node.js (from https://nodejs.org) >> "IQ-Test-Package\QUICK-START.md"
echo - Modern browser >> "IQ-Test-Package\QUICK-START.md"
echo. >> "IQ-Test-Package\QUICK-START.md"
echo ## Important Files: >> "IQ-Test-Package\QUICK-START.md"
echo - `install.bat` - Install dependencies >> "IQ-Test-Package\QUICK-START.md"
echo - `run-iq-test.bat` - Run application >> "IQ-Test-Package\QUICK-START.md"
echo - `اختبار-الذكاء.html` - Launch interface >> "IQ-Test-Package\QUICK-START.md"
echo - `dist/index.html` - Built application >> "IQ-Test-Package\QUICK-START.md"

echo.
echo ========================================
echo Package created successfully!
echo ========================================
echo.
echo Available files:
echo - IQ-Test-Package/ (package folder)
echo.
echo To distribute:
echo 1. Compress the IQ-Test-Package folder to ZIP
echo 2. Share the ZIP file
echo.
echo To run:
echo 1. Extract the package
echo 2. Run install.bat
echo 3. Run run-iq-test.bat
echo.
pause
