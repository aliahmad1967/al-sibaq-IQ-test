@echo off 
title Installing IQ Test Dependencies 
echo. 
echo Installing dependencies... 
npm install 
if %errorlevel% neq 0 ( 
    echo Installation failed 
    pause 
    exit /b 1 
) 
echo. 
echo Installation completed successfully! 
echo To run the application: 
echo 1. Run run-iq-test.bat 
echo 2. Or open the HTML file in browser 
pause 
