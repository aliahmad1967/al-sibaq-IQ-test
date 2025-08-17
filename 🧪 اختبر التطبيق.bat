@echo off
title 🧪 اختبار التطبيق - Test Application
color 0A
chcp 65001 >nul

cls
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                    🧪 اختبار التطبيق                        ║
echo ║                    🧪 Test Application                      ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

echo 🔍 فحص ملفات التطبيق...
echo 🔍 Checking application files...
echo.

set "TESTS_PASSED=0"
set "TOTAL_TESTS=0"

:: Test 1: Check standalone.html
set /a TOTAL_TESTS+=1
if exist "standalone.html" (
    echo ✅ [%TOTAL_TESTS%] standalone.html موجود
    echo ✅ [%TOTAL_TESTS%] standalone.html exists
    set /a TESTS_PASSED+=1
) else (
    echo ❌ [%TOTAL_TESTS%] standalone.html مفقود
    echo ❌ [%TOTAL_TESTS%] standalone.html missing
)

:: Test 2: Check dist/index.html
set /a TOTAL_TESTS+=1
if exist "dist\index.html" (
    echo ✅ [%TOTAL_TESTS%] dist\index.html موجود
    echo ✅ [%TOTAL_TESTS%] dist\index.html exists
    set /a TESTS_PASSED+=1
) else (
    echo ❌ [%TOTAL_TESTS%] dist\index.html مفقود
    echo ❌ [%TOTAL_TESTS%] dist\index.html missing
)

:: Test 3: Check IQ-Test-Package
set /a TOTAL_TESTS+=1
if exist "IQ-Test-Package" (
    echo ✅ [%TOTAL_TESTS%] IQ-Test-Package موجود
    echo ✅ [%TOTAL_TESTS%] IQ-Test-Package exists
    set /a TESTS_PASSED+=1
) else (
    echo ❌ [%TOTAL_TESTS%] IQ-Test-Package مفقود
    echo ❌ [%TOTAL_TESTS%] IQ-Test-Package missing
)

:: Test 4: Check installer files
set /a TOTAL_TESTS+=1
if exist "🧠 تثبيت اختبار الذكاء.bat" (
    echo ✅ [%TOTAL_TESTS%] المثبت السريع موجود
    echo ✅ [%TOTAL_TESTS%] Quick installer exists
    set /a TESTS_PASSED+=1
) else (
    echo ❌ [%TOTAL_TESTS%] المثبت السريع مفقود
    echo ❌ [%TOTAL_TESTS%] Quick installer missing
)

echo.
echo ═══════════════════════════════════════════════════════════════
echo 📊 نتائج الاختبار - Test Results:
echo    ✅ نجح: %TESTS_PASSED% / %TOTAL_TESTS%
echo    ✅ Passed: %TESTS_PASSED% / %TOTAL_TESTS%

if %TESTS_PASSED% == %TOTAL_TESTS% (
    echo.
    echo 🎉 جميع الاختبارات نجحت!
    echo 🎉 All tests passed!
    echo.
    echo 🚀 اختر طريقة التشغيل:
    echo 🚀 Choose how to run:
    echo.
    echo [1] 🌐 تشغيل standalone.html
    echo     Run standalone.html
    echo.
    echo [2] 🔧 تشغيل dist\index.html
    echo     Run dist\index.html
    echo.
    echo [3] 📦 تشغيل من الحزمة
    echo     Run from package
    echo.
    echo [4] ❌ خروج
    echo     Exit
    echo.
    set /p "choice=اختر رقم / Choose number (1-4): "
    
    if "!choice!"=="1" (
        echo 🚀 تشغيل standalone.html...
        start "" "standalone.html"
    ) else if "!choice!"=="2" (
        echo 🚀 تشغيل dist\index.html...
        start "" "dist\index.html"
    ) else if "!choice!"=="3" (
        if exist "IQ-Test-Package\standalone.html" (
            echo 🚀 تشغيل من الحزمة...
            start "" "IQ-Test-Package\standalone.html"
        ) else if exist "IQ-Test-Package\dist\index.html" (
            echo 🚀 تشغيل من الحزمة...
            start "" "IQ-Test-Package\dist\index.html"
        ) else (
            echo ❌ لم يتم العثور على ملفات في الحزمة
        )
    ) else (
        echo 👋 وداعاً!
        echo 👋 Goodbye!
    )
) else (
    echo.
    echo ⚠️  بعض الملفات مفقودة!
    echo ⚠️  Some files are missing!
    echo.
    echo 💡 تأكد من وجود جميع الملفات المطلوبة
    echo 💡 Make sure all required files exist
)

echo.
pause
