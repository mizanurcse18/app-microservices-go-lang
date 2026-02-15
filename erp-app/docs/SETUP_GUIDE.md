# Flutter & Android Setup Guide for Stitch ERP App

## ✅ Already Completed

- [x] Flutter SDK installed at `D:\flutter`
- [x] Dart SDK downloaded automatically
- [x] Flutter added to system PATH

---

## 📋 Next Steps

### Step 1: Install Android Studio

1. **Download Android Studio**
   - Go to: https://developer.android.com/studio
   - Download the latest stable version for Windows

2. **Run the Installer**
   - During installation, make sure these components are selected:
     - ✅ Android SDK
     - ✅ Android SDK Platform
     - ✅ Android SDK Build-Tools
     - ✅ Android Virtual Device (AVD)
     - ✅ Android Emulator

3. **Installation Location**
   - Default: `C:\Program Files\Android\Android Studio`
   - SDK Location: `C:\Users\<YourUsername>\AppData\Local\Android\Sdk`
   - (You can change SDK to D:\ drive if C:\ is low on space)

---

### Step 2: Accept Android Licenses

After Android Studio installation, open a **new PowerShell terminal** and run:

```powershell
D:\flutter\bin\flutter doctor --android-licenses
```

- Type `y` and press Enter for each license prompt
- This accepts all the Android SDK licenses required by Flutter

---

### Step 3: Verify Installation

Run Flutter Doctor to check everything is set up correctly:

```powershell
D:\flutter\bin\flutter doctor -v
```

**Expected Output:**
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x, on Microsoft Windows...)
[✓] Android toolchain - develop for Android devices
[✓] Chrome - develop for the web
[✓] Android Studio (version 2024.x)
[✓] VS Code (version x.x.x)
[✓] Connected device (1 available)
```

---

### Step 4: Set Up Android Emulator (Optional but Recommended)

1. Open **Android Studio**
2. Go to: **Tools** → **Device Manager**
3. Click **Create Device**
4. Select a phone (e.g., **Pixel 7**)
5. Download a system image (e.g., **API 34 - Android 14**)
6. Click **Finish**

---

### Step 5: Test Flutter Installation

Create a test Flutter app to verify everything works:

```powershell
cd D:\SourceCode\go-lang\app
D:\flutter\bin\flutter create test_app
cd test_app
D:\flutter\bin\flutter run
```

- If you have an emulator running, it should launch the app
- Press `q` to quit

---

## 🔧 Troubleshooting

### Issue: "cmdline-tools component is missing"
Run this in Android Studio:
- **Tools** → **SDK Manager** → **SDK Tools** tab
- Check ✅ **Android SDK Command-line Tools**
- Click **Apply**

### Issue: "Unable to locate Android SDK"
Run:
```powershell
D:\flutter\bin\flutter config --android-sdk "C:\Users\<YourUsername>\AppData\Local\Android\Sdk"
```

### Issue: Flutter command not found (after restart)
The PATH was added to User environment variables. You need to:
1. Close and reopen your terminal/PowerShell
2. Or restart your computer
3. Or use the full path: `D:\flutter\bin\flutter`

---

## 📞 Next Steps After Setup

Once `flutter doctor` shows all green checkmarks, let me know and I will:

1. ✅ Create the Stitch ERP Flutter project
2. ✅ Set up the complete folder structure (data/domain/presentation layers)
3. ✅ Configure dependencies (BLoC, GoRouter, Dio, etc.)
4. ✅ Build the design system (theme, colors, typography)
5. ✅ Start implementing the login screen

---

## 📚 Useful Commands Reference

```powershell
# Check Flutter installation status
D:\flutter\bin\flutter doctor -v

# List available devices (emulators/physical devices)
D:\flutter\bin\flutter devices

# Create a new Flutter project
D:\flutter\bin\flutter create <project_name>

# Run the app
D:\flutter\bin\flutter run

# Run on specific device
D:\flutter\bin\flutter run -d <device_id>

# Clean build files
D:\flutter\bin\flutter clean

# Get dependencies
D:\flutter\bin\flutter pub get

# Upgrade Flutter SDK
D:\flutter\bin\flutter upgrade
```

---

**Installation Time Estimate:**
- Android Studio download: ~5-10 minutes (depending on internet speed)
- Android Studio installation: ~10-15 minutes
- SDK components download: ~5-10 minutes
- Total: ~20-35 minutes

---

**Need Help?** Just ping me after you've completed the Android Studio installation!
