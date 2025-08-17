@echo off
setlocal enabledelayedexpansion
title 🔧 إصلاح التشغيل المباشر - Fix Direct Run
color 0B
chcp 65001 >nul

cls
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                🔧 إصلاح التشغيل المباشر                     ║
echo ║                🔧 Fix Direct Run Issues                     ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

echo 🔍 فحص ملفات التطبيق...
echo 🔍 Checking application files...
echo.

set "ISSUES_FOUND=0"
set "FILES_CHECKED=0"

:: فحص standalone.html
set /a FILES_CHECKED+=1
if exist "standalone.html" (
    echo ✅ [%FILES_CHECKED%] standalone.html موجود
    echo ✅ [%FILES_CHECKED%] standalone.html exists
    
    :: فحص حجم الملف
    for %%A in ("standalone.html") do (
        if %%~zA LSS 1000 (
            echo ⚠️  تحذير: حجم الملف صغير جداً
            echo ⚠️  Warning: File size too small
            set /a ISSUES_FOUND+=1
        )
    )
) else (
    echo ❌ [%FILES_CHECKED%] standalone.html مفقود
    echo ❌ [%FILES_CHECKED%] standalone.html missing
    set /a ISSUES_FOUND+=1
)

:: فحص dist/index.html
set /a FILES_CHECKED+=1
if exist "dist\index.html" (
    echo ✅ [%FILES_CHECKED%] dist\index.html موجود
    echo ✅ [%FILES_CHECKED%] dist\index.html exists
) else (
    echo ❌ [%FILES_CHECKED%] dist\index.html مفقود
    echo ❌ [%FILES_CHECKED%] dist\index.html missing
    set /a ISSUES_FOUND+=1
)

:: فحص ملفات JavaScript
set /a FILES_CHECKED+=1
if exist "dist\assets\*.js" (
    echo ✅ [%FILES_CHECKED%] ملفات JavaScript موجودة
    echo ✅ [%FILES_CHECKED%] JavaScript files exist
) else (
    echo ❌ [%FILES_CHECKED%] ملفات JavaScript مفقودة
    echo ❌ [%FILES_CHECKED%] JavaScript files missing
    set /a ISSUES_FOUND+=1
)

:: فحص ملفات CSS
set /a FILES_CHECKED+=1
if exist "dist\assets\*.css" (
    echo ✅ [%FILES_CHECKED%] ملفات CSS موجودة
    echo ✅ [%FILES_CHECKED%] CSS files exist
) else (
    echo ❌ [%FILES_CHECKED%] ملفات CSS مفقودة
    echo ❌ [%FILES_CHECKED%] CSS files missing
    set /a ISSUES_FOUND+=1
)

echo.
echo ═══════════════════════════════════════════════════════════════
echo 📊 نتائج الفحص - Scan Results:
echo    ملفات مفحوصة: %FILES_CHECKED%
echo    مشاكل موجودة: %ISSUES_FOUND%
echo    Files checked: %FILES_CHECKED%
echo    Issues found: %ISSUES_FOUND%
echo ═══════════════════════════════════════════════════════════════

if %ISSUES_FOUND% GTR 0 (
    echo.
    echo 🔧 جاري إصلاح المشاكل...
    echo 🔧 Fixing issues...
    echo.
    
    :: إعادة بناء standalone.html إذا كان مفقود أو تالف
    if not exist "standalone.html" (
        echo 📝 إنشاء standalone.html جديد...
        echo 📝 Creating new standalone.html...
        call :CreateStandaloneHTML
    )
    
    :: إعادة بناء dist إذا كان مفقود
    if not exist "dist\index.html" (
        echo 🔨 إعادة بناء التطبيق...
        echo 🔨 Rebuilding application...
        if exist "package.json" (
            npm run build >nul 2>&1
            if !errorlevel! equ 0 (
                echo ✅ تم إعادة البناء بنجاح
                echo ✅ Rebuild successful
            ) else (
                echo ⚠️  فشل في إعادة البناء - استخدم standalone.html
                echo ⚠️  Rebuild failed - use standalone.html
            )
        )
    )
    
    echo.
    echo ✅ تم الانتهاء من الإصلاح
    echo ✅ Repair completed
) else (
    echo.
    echo 🎉 لا توجد مشاكل! الملفات سليمة
    echo 🎉 No issues found! Files are OK
)

echo.
echo 🚀 اختبار التشغيل:
echo 🚀 Testing execution:
echo.
echo [1] 🧠 اختبار standalone.html
echo     Test standalone.html
echo.
echo [2] ⚛️ اختبار dist\index.html  
echo     Test dist\index.html
echo.
echo [3] 🔍 فتح أداة التشخيص
echo     Open diagnostic tool
echo.
echo [4] 🌐 اختبار في متصفحات مختلفة
echo     Test in different browsers
echo.
echo [5] ❌ خروج
echo     Exit
echo.
set /p "choice=اختر رقم / Choose number (1-5): "

if "%choice%"=="1" (
    echo 🧠 فتح standalone.html...
    start "" "standalone.html"
    echo ✅ تم فتح الملف. تحقق من المتصفح.
    echo ✅ File opened. Check your browser.
) else if "%choice%"=="2" (
    echo ⚛️ فتح dist\index.html...
    start "" "dist\index.html"
    echo ✅ تم فتح التطبيق. تحقق من المتصفح.
    echo ✅ App opened. Check your browser.
) else if "%choice%"=="3" (
    echo 🔍 فتح أداة التشخيص...
    start "" "🔍 اختبار التشغيل.html"
    echo ✅ تم فتح أداة التشخيص.
    echo ✅ Diagnostic tool opened.
) else if "%choice%"=="4" (
    echo 🌐 اختبار المتصفحات...
    echo.
    echo جاري فتح الملف في متصفحات مختلفة...
    echo Opening file in different browsers...
    
    :: Chrome
    start chrome "standalone.html" 2>nul
    timeout /t 2 /nobreak >nul
    
    :: Firefox  
    start firefox "standalone.html" 2>nul
    timeout /t 2 /nobreak >nul
    
    :: Edge
    start msedge "standalone.html" 2>nul
    timeout /t 2 /nobreak >nul
    
    echo ✅ تم فتح الملف في المتصفحات المتاحة
    echo ✅ File opened in available browsers
) else (
    echo 👋 وداعاً!
    echo 👋 Goodbye!
)

echo.
echo 💡 نصائح إضافية:
echo 💡 Additional tips:
echo    • استخدم متصفح حديث (Chrome مستحسن)
echo    • Use a modern browser (Chrome recommended)
echo    • تأكد من تفعيل JavaScript
echo    • Make sure JavaScript is enabled
echo    • إذا ظهرت صفحة فارغة، انتظر قليلاً أو اضغط F5
echo    • If blank page appears, wait or press F5
echo.
pause
exit /b 0

:CreateStandaloneHTML
echo إنشاء ملف standalone.html احتياطي...
(
echo ^<!DOCTYPE html^>
echo ^<html lang="ar" dir="rtl"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<title^>اختبار الذكاء المتقدم^</title^>
echo     ^<style^>
echo         body { font-family: Arial; background: #1a1a2e; color: white; text-align: center; padding: 50px; }
echo         .title { font-size: 3rem; margin-bottom: 2rem; }
echo         .button { padding: 15px 30px; background: #3b82f6; color: white; border: none; border-radius: 10px; font-size: 1.2rem; cursor: pointer; }
echo     ^</style^>
echo ^</head^>
echo ^<body^>
echo     ^<div class="title"^>🧠 اختبار الذكاء المتقدم^</div^>
echo     ^<p^>الملف الأصلي تالف. يرجى استخدام dist/index.html أو إعادة تحميل التطبيق.^</p^>
echo     ^<button class="button" onclick="window.location.href='dist/index.html'"^>فتح التطبيق الكامل^</button^>
echo ^</body^>
echo ^</html^>
) > "standalone.html"
goto :eof
