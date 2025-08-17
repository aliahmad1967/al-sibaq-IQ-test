# Advanced IQ Test Installer with GUI
# مثبت اختبار الذكاء المتقدم مع واجهة رسومية

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Set console encoding for Arabic
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

function Show-InstallationDialog {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "🧠 اختبار الذكاء المتقدم - Advanced IQ Test Installer"
    $form.Size = New-Object System.Drawing.Size(600, 500)
    $form.StartPosition = "CenterScreen"
    $form.FormBorderStyle = "FixedDialog"
    $form.MaximizeBox = $false
    $form.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 50)
    $form.ForeColor = [System.Drawing.Color]::White

    # Title Label
    $titleLabel = New-Object System.Windows.Forms.Label
    $titleLabel.Text = "🧠 اختبار الذكاء المتقدم`nAdvanced IQ Test"
    $titleLabel.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
    $titleLabel.ForeColor = [System.Drawing.Color]::FromArgb(100, 200, 255)
    $titleLabel.TextAlign = "MiddleCenter"
    $titleLabel.Size = New-Object System.Drawing.Size(560, 80)
    $titleLabel.Location = New-Object System.Drawing.Point(20, 20)
    $form.Controls.Add($titleLabel)

    # Description Label
    $descLabel = New-Object System.Windows.Forms.Label
    $descLabel.Text = "اختبر قدراتك العقلية مع 15 سؤال متنوع`nTest your mental abilities with 15 diverse questions"
    $descLabel.Font = New-Object System.Drawing.Font("Arial", 10)
    $descLabel.ForeColor = [System.Drawing.Color]::LightGray
    $descLabel.TextAlign = "MiddleCenter"
    $descLabel.Size = New-Object System.Drawing.Size(560, 50)
    $descLabel.Location = New-Object System.Drawing.Point(20, 100)
    $form.Controls.Add($descLabel)

    # Installation Options GroupBox
    $optionsGroup = New-Object System.Windows.Forms.GroupBox
    $optionsGroup.Text = "خيارات التثبيت - Installation Options"
    $optionsGroup.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
    $optionsGroup.ForeColor = [System.Drawing.Color]::White
    $optionsGroup.Size = New-Object System.Drawing.Size(560, 200)
    $optionsGroup.Location = New-Object System.Drawing.Point(20, 160)
    $form.Controls.Add($optionsGroup)

    # Quick Install Radio Button
    $quickRadio = New-Object System.Windows.Forms.RadioButton
    $quickRadio.Text = "🚀 تثبيت سريع (مستحسن) - Quick Install (Recommended)"
    $quickRadio.Font = New-Object System.Drawing.Font("Arial", 10)
    $quickRadio.ForeColor = [System.Drawing.Color]::LightGreen
    $quickRadio.Size = New-Object System.Drawing.Size(520, 30)
    $quickRadio.Location = New-Object System.Drawing.Point(20, 30)
    $quickRadio.Checked = $true
    $optionsGroup.Controls.Add($quickRadio)

    $quickDesc = New-Object System.Windows.Forms.Label
    $quickDesc.Text = "تثبيت سريع بدون متطلبات إضافية - يعمل في المتصفح مباشرة"
    $quickDesc.Font = New-Object System.Drawing.Font("Arial", 8)
    $quickDesc.ForeColor = [System.Drawing.Color]::LightGray
    $quickDesc.Size = New-Object System.Drawing.Size(500, 20)
    $quickDesc.Location = New-Object System.Drawing.Point(40, 55)
    $optionsGroup.Controls.Add($quickDesc)

    # Advanced Install Radio Button
    $advancedRadio = New-Object System.Windows.Forms.RadioButton
    $advancedRadio.Text = "🔧 تثبيت متقدم - Advanced Install (with Node.js)"
    $advancedRadio.Font = New-Object System.Drawing.Font("Arial", 10)
    $advancedRadio.ForeColor = [System.Drawing.Color]::Orange
    $advancedRadio.Size = New-Object System.Drawing.Size(520, 30)
    $advancedRadio.Location = New-Object System.Drawing.Point(20, 85)
    $optionsGroup.Controls.Add($advancedRadio)

    $advancedDesc = New-Object System.Windows.Forms.Label
    $advancedDesc.Text = "تثبيت كامل مع إمكانيات التطوير - يتطلب Node.js"
    $advancedDesc.Font = New-Object System.Drawing.Font("Arial", 8)
    $advancedDesc.ForeColor = [System.Drawing.Color]::LightGray
    $advancedDesc.Size = New-Object System.Drawing.Size(500, 20)
    $advancedDesc.Location = New-Object System.Drawing.Point(40, 110)
    $optionsGroup.Controls.Add($advancedDesc)

    # Direct Run Radio Button
    $directRadio = New-Object System.Windows.Forms.RadioButton
    $directRadio.Text = "🌐 تشغيل مباشر - Run Directly (No Installation)"
    $directRadio.Font = New-Object System.Drawing.Font("Arial", 10)
    $directRadio.ForeColor = [System.Drawing.Color]::Cyan
    $directRadio.Size = New-Object System.Drawing.Size(520, 30)
    $directRadio.Location = New-Object System.Drawing.Point(20, 140)
    $optionsGroup.Controls.Add($directRadio)

    $directDesc = New-Object System.Windows.Forms.Label
    $directDesc.Text = "تشغيل فوري بدون تثبيت - مؤقت"
    $directDesc.Font = New-Object System.Drawing.Font("Arial", 8)
    $directDesc.ForeColor = [System.Drawing.Color]::LightGray
    $directDesc.Size = New-Object System.Drawing.Size(500, 20)
    $directDesc.Location = New-Object System.Drawing.Point(40, 165)
    $optionsGroup.Controls.Add($directDesc)

    # Install Button
    $installButton = New-Object System.Windows.Forms.Button
    $installButton.Text = "🚀 ابدأ التثبيت - Start Installation"
    $installButton.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
    $installButton.BackColor = [System.Drawing.Color]::FromArgb(50, 150, 250)
    $installButton.ForeColor = [System.Drawing.Color]::White
    $installButton.FlatStyle = "Flat"
    $installButton.Size = New-Object System.Drawing.Size(200, 50)
    $installButton.Location = New-Object System.Drawing.Point(100, 380)
    $form.Controls.Add($installButton)

    # Cancel Button
    $cancelButton = New-Object System.Windows.Forms.Button
    $cancelButton.Text = "❌ إلغاء - Cancel"
    $cancelButton.Font = New-Object System.Drawing.Font("Arial", 12)
    $cancelButton.BackColor = [System.Drawing.Color]::FromArgb(200, 50, 50)
    $cancelButton.ForeColor = [System.Drawing.Color]::White
    $cancelButton.FlatStyle = "Flat"
    $cancelButton.Size = New-Object System.Drawing.Size(150, 50)
    $cancelButton.Location = New-Object System.Drawing.Point(320, 380)
    $form.Controls.Add($cancelButton)

    # Event Handlers
    $installButton.Add_Click({
        $form.Hide()
        if ($quickRadio.Checked) {
            Start-QuickInstall
        } elseif ($advancedRadio.Checked) {
            Start-AdvancedInstall
        } else {
            Start-DirectRun
        }
        $form.Close()
    })

    $cancelButton.Add_Click({
        $form.Close()
    })

    # Show the form
    $form.ShowDialog()
}

function Start-QuickInstall {
    Write-Host "🚀 بدء التثبيت السريع..." -ForegroundColor Green
    Write-Host "🚀 Starting Quick Installation..." -ForegroundColor Green

    $installDir = "$env:USERPROFILE\Desktop\اختبار الذكاء"
    
    # Remove existing installation
    if (Test-Path $installDir) {
        Write-Host "🗑️ إزالة التثبيت السابق..." -ForegroundColor Yellow
        Remove-Item $installDir -Recurse -Force -ErrorAction SilentlyContinue
    }

    # Create installation directory
    Write-Host "📁 إنشاء مجلد التثبيت..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null

    # Copy application files
    Write-Host "📋 نسخ ملفات التطبيق..." -ForegroundColor Yellow
    if (Test-Path "IQ-Test-Package\dist") {
        Copy-Item "IQ-Test-Package\dist\*" $installDir -Recurse -Force
    } elseif (Test-Path "dist") {
        Copy-Item "dist\*" $installDir -Recurse -Force
    } else {
        Write-Host "❌ لم يتم العثور على ملفات التطبيق" -ForegroundColor Red
        Read-Host "اضغط Enter للخروج"
        return
    }

    # Create launcher script
    $launcherContent = @"
@echo off
title 🧠 اختبار الذكاء المتقدم
cd /d "$installDir"
echo 🚀 تشغيل اختبار الذكاء المتقدم...
echo 🚀 Starting Advanced IQ Test...
start "" "index.html"
timeout /t 2 /nobreak >nul
exit
"@
    $launcherContent | Out-File "$installDir\🧠 تشغيل الاختبار.bat" -Encoding ASCII

    # Create desktop shortcut
    Write-Host "🔗 إنشاء اختصار سطح المكتب..." -ForegroundColor Yellow
    $WshShell = New-Object -comObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut("$env:USERPROFILE\Desktop\🧠 اختبار الذكاء.lnk")
    $Shortcut.TargetPath = "$installDir\🧠 تشغيل الاختبار.bat"
    $Shortcut.WorkingDirectory = $installDir
    $Shortcut.Description = "اختبار الذكاء المتقدم - Advanced IQ Test"
    $Shortcut.Save()

    Write-Host ""
    Write-Host "✅ تم التثبيت بنجاح!" -ForegroundColor Green
    Write-Host "✅ Installation completed successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📍 مكان التثبيت: $installDir" -ForegroundColor Cyan
    Write-Host "🔗 اختصار سطح المكتب: 🧠 اختبار الذكاء" -ForegroundColor Cyan
    Write-Host ""

    $run = Read-Host "🚀 هل تريد تشغيل الاختبار الآن؟ (Y/N) - Do you want to run the test now?"
    if ($run -eq "Y" -or $run -eq "y") {
        Start-Process "$installDir\🧠 تشغيل الاختبار.bat"
    }
}

function Start-AdvancedInstall {
    Write-Host "🔧 بدء التثبيت المتقدم..." -ForegroundColor Yellow
    
    # Check Node.js
    try {
        $nodeVersion = node --version
        Write-Host "✅ Node.js detected: $nodeVersion" -ForegroundColor Green
        
        # Run the advanced installer
        if (Test-Path "installer.bat") {
            Start-Process "installer.bat" -Wait
        } else {
            Write-Host "❌ ملف المثبت المتقدم غير موجود" -ForegroundColor Red
        }
    } catch {
        Write-Host "❌ Node.js غير مثبت" -ForegroundColor Red
        Write-Host "📥 فتح صفحة تحميل Node.js..." -ForegroundColor Yellow
        Start-Process "https://nodejs.org/"
        Read-Host "يرجى تثبيت Node.js ثم إعادة تشغيل المثبت"
    }
}

function Start-DirectRun {
    Write-Host "🌐 تشغيل مباشر..." -ForegroundColor Cyan
    
    if (Test-Path "dist\index.html") {
        Start-Process "dist\index.html"
    } elseif (Test-Path "IQ-Test-Package\dist\index.html") {
        Start-Process "IQ-Test-Package\dist\index.html"
    } else {
        Write-Host "❌ لم يتم العثور على ملف التطبيق" -ForegroundColor Red
        Read-Host "اضغط Enter للخروج"
    }
}

# Main execution
Clear-Host
Write-Host "🧠 مرحباً بك في مثبت اختبار الذكاء المتقدم" -ForegroundColor Cyan
Write-Host "🧠 Welcome to Advanced IQ Test Installer" -ForegroundColor Cyan
Write-Host ""

# Check if application files exist
if (-not (Test-Path "dist\index.html") -and -not (Test-Path "IQ-Test-Package\dist\index.html")) {
    Write-Host "❌ خطأ: لم يتم العثور على ملفات التطبيق" -ForegroundColor Red
    Write-Host "❌ Error: Application files not found" -ForegroundColor Red
    Write-Host ""
    Write-Host "📁 يجب وضع هذا الملف في نفس مجلد التطبيق" -ForegroundColor Yellow
    Write-Host "📁 This file must be in the same folder as the application" -ForegroundColor Yellow
    Read-Host "اضغط Enter للخروج"
    exit 1
}

# Show installation dialog
Show-InstallationDialog

Write-Host ""
Write-Host "🎉 شكراً لاستخدام اختبار الذكاء المتقدم!" -ForegroundColor Green
Write-Host "🎉 Thank you for using Advanced IQ Test!" -ForegroundColor Green
