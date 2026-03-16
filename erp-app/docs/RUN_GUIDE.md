# How to Run the Stitch ERP App

This guide explains how to build and run the Stitch ERP Flutter application locally.

## Prerequisites

- Flutter SDK installed and available via `D:\flutter\bin\flutter.bat`
- An active Android Emulator, physical Android device, or Chrome browser for web testing.

---

## Step 1: Navigate to the Project Directory

Open your PowerShell or terminal and navigate to the `erp-app` folder:

```powershell
cd d:\SourceCode\go-lang\app\erp-app
```

## Step 2: Install Dependencies

Before running the app for the first time or after pulling new changes, fetch all required packages:

```powershell
D:\flutter\bin\flutter.bat pub get
```

## Step 3: Run the Application

### Option A: Default Run
If you only have one device/emulator connected, simply run:

```powershell
D:\flutter\bin\flutter.bat run
```

### Option B: Run in Chrome (Web)
To test the app quickly in your web browser:

```powershell
D:\flutter\bin\flutter.bat run -d chrome
```

### Option C: Target a Specific Device or Emulator
If multiple devices are connected (e.g., Web and Android Emulator), you can specify the target:

First, list all available devices:
```powershell
D:\flutter\bin\flutter.bat devices
```

Then, use the device ID (e.g., `emulator-5554`) to run the app:
```powershell
D:\flutter\bin\flutter.bat run -d emulator-5554
```

---

## 🔧 Troubleshooting Build Issues

If you encounter unexpected build errors, Gradle issues, or stale cache problems, perform a clean build:

```powershell
D:\flutter\bin\flutter.bat clean
D:\flutter\bin\flutter.bat pub get
D:\flutter\bin\flutter.bat run
```

## ⚡ Development Hotkeys

While the app is running in the terminal, you can use these shortcuts:

- `r` - **Hot Reload**: Instantly updates UI changes in the app without losing your current state.
- `R` - **Hot Restart**: Restarts the app entirely (resets state back to the initial screen).
- `c` - **Clear Screen**: Clears the console output.
- `q` - **Quit**: Stops the application and ends the debug session.
