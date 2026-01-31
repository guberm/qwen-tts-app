# Qwen3-TTS Flutter App

A feature-rich Flutter application for text-to-speech using **FREE** Qwen3-TTS open-source models. Works seamlessly with the companion Python server - no cloud API, no API keys, completely private!

## 🌟 Features

- ✅ **FREE & Open Source** - Use free Qwen3-TTS models from HuggingFace
- ✅ **Text-to-Speech** - Convert text to natural-sounding audio
- ✅ **Share from Apps** - Accept text from any app via share intent
- ✅ **Audio Playback** - Built-in audio player with controls
- ✅ **10+ Languages** - Chinese, English, Japanese, Korean, German, French, Russian, Portuguese, Spanish, Italian
- ✅ **Voice Selection** - 49 voices with language filtering
- ✅ **Settings Persistence** - Remember your preferences
- ✅ **Server Configuration** - Connect to your local or remote server
- ✅ **Cross-Platform** - Works on Android (iOS coming soon)

## 🚀 Quick Start

### Prerequisites

- **Flutter**: 3.0.0 or later ([Install Flutter](https://flutter.dev/docs/get-started/install))
- **Android SDK**: API level 24+ (Android 7.0+)
- **Java Development Kit (JDK)**: 17 or later
- **Android Device or Emulator**: Android 9+ recommended
- **Python Server**: [Qwen3-TTS Server](https://github.com/guberm/qwen-tts-server) running locally or on a PC

### Installation & Running

#### Option 1: Run on Emulator/Device with Flutter

1. **Clone the repository**:
```bash
git clone https://github.com/guberm/qwen-tts-app.git
cd qwen-tts-app
```

2. **Install Flutter dependencies**:
```bash
flutter pub get
```

3. **Connect device or start emulator**:
```bash
# List devices
flutter devices

# Start Android emulator (if available)
emulator -avd <emulator_name> &
```

4. **Run the app**:
```bash
flutter run
```

#### Option 2: Install APK on Device

1. **Build the APK**:
```bash
flutter build apk --release
```

2. **Install on device** (with ADB installed):
```bash
adb install -r build/app/outputs/flutter-apk/app-release.apk
```

Or transfer the APK file to your Android device and install directly.

## 🏗️ Build Instructions

### Build Release APK (Full)

**Output**: Single APK that works on all Android architectures (~47MB)

```bash
flutter build apk --release
```

**Location**: `build/app/outputs/flutter-apk/app-release.apk`

### Build Split APKs (Smaller)

**Output**: Separate APKs for each architecture (8-15MB each)

```bash
flutter build apk --split-per-abi --release
```

**Output Locations**:
- `build/app/outputs/flutter-apk/app-arm64-v8a-release.apk` (64-bit ARM)
- `build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk` (32-bit ARM)
- `build/app/outputs/flutter-apk/app-x86_64-release.apk` (Intel 64-bit)

### Build App Bundle (For Google Play)

**Output**: Single file ready for Google Play Store distribution (~15MB)

```bash
flutter build appbundle --release
```

**Location**: `build/app/outputs/bundle/release/app-release.aab`

### Build Debug APK

**For Development & Debugging**:

```bash
flutter build apk --debug
```

## 🔧 Development Setup

### Step 1: Install Flutter

**Windows**:
```bash
# Download from https://flutter.dev/docs/get-started/install
# Extract and add to PATH
echo "Add flutter/bin to your PATH environment variable"
```

**macOS/Linux**:
```bash
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"
```

**Verify installation**:
```bash
flutter doctor
```

### Step 2: Check Java Installation

```bash
java -version
```

Should show Java 17+ (or 22 recommended)

### Step 3: Configure Android SDK

```bash
# Accept Android licenses
flutter doctor --android-licenses

# Set Android SDK path (if needed)
flutter config --android-sdk /path/to/android/sdk
```

### Step 4: Verify Environment

```bash
# Run this to check everything is set up correctly
flutter doctor -v
```

Should show all green checkmarks.

## 📋 System Requirements

### Minimum
- **RAM**: 4GB
- **Disk Space**: 2GB free (for build artifacts)
- **Android API**: 24 (Android 7.0)
- **Java**: JDK 17

### Recommended
- **RAM**: 16GB+
- **Disk Space**: 10GB+ free
- **Android API**: 33+ (Android 13+)
- **Java**: JDK 21 or 22
- **SSD**: For faster builds

## 🔌 Server Connection

### Using FREE Local Server

1. **Set up [Qwen3-TTS Server](https://github.com/guberm/qwen-tts-server)**:
```bash
cd qwen-tts-server
pip install -r requirements.txt
python server.py
```

2. **Find your PC's IP**:
   - Windows: `ipconfig` (look for IPv4 Address)
   - macOS/Linux: `ifconfig` or `ip addr`
   - Example: `192.168.1.100`

3. **In the app settings**:
   - Set Server URL: `http://192.168.1.100:5000`
   - Leave API Key empty
   - Select language and voice
   - Tap Generate!

### Using Cloud API (Paid)

1. **Get API key** from [Alibaba Cloud DashScope](https://bailian.console.aliyun.com/)

2. **In the app settings**:
   - Set Server URL: `https://dashscope-intl.aliyuncs.com`
   - Set API Key: Your DashScope API key
   - Select voice and language
   - Tap Generate!

## 📦 Project Structure

```
qwen_tts_app/
├── lib/
│   ├── main.dart                 # Entry point & sharing
│   ├── models/
│   │   └── tts_settings.dart    # Settings data model
│   ├── services/
│   │   ├── tts_service.dart     # TTS API integration
│   │   └── settings_service.dart # Local storage
│   └── screens/
│       ├── home_screen.dart      # Main UI
│       └── settings_screen.dart  # Settings UI
├── android/
│   ├── app/
│   │   ├── build.gradle
│   │   └── src/main/
│   │       ├── AndroidManifest.xml
│   │       ├── kotlin/
│   │       └── res/
│   ├── build.gradle
│   ├── settings.gradle
│   └── gradle.properties
├── pubspec.yaml                  # Dependencies
└── README.md                     # This file
```

## 📱 Supported Languages & Voices

| Language | Count | Examples |
|----------|-------|----------|
| 🇨🇳 Chinese | 26 | Cherry, Serena, Dylan, Jada, Eric, Rocky, Kiki |
| 🇬🇧 English | 13 | Jennifer, Ryan, Aiden, Neil, Arthur, Vincent |
| 🇯🇵 Japanese | 5 | Ono Anna, Momo, Vivian, Stella |
| 🇰🇷 Korean | 4 | Sohee, Cherry, Momo, Vivian |
| 🇪🇸 Spanish | 5 | Bodega, Sonrisa, Cherry, Serena, Ethan |
| 🇵🇹 Portuguese | 4 | Radio Gol, Andre, Cherry, Serena |
| 🇫🇷 French | 4 | Emilien, Cherry, Serena, Maia |
| 🇩🇪 German | 4 | Lenn, Cherry, Serena, Ethan |
| 🇮🇹 Italian | 3 | Dolce, Cherry, Serena |
| 🇷🇺 Russian | 3 | Alek, Cherry, Serena |

**Total**: 49 voices across 10 languages

## 🔐 Privacy & Security

- ✅ **No cloud upload** - Audio stays on your device (with local server)
- ✅ **No tracking** - No analytics or telemetry
- ✅ **Open source** - Full source code available for inspection
- ✅ **Local storage only** - Settings stored only on your device

## 🐛 Troubleshooting

### Build Issues

**Error: "flutter: command not found"**
- Add Flutter to PATH: `export PATH="$PATH:[flutter-path]/bin"`
- Verify: `flutter doctor`

**Error: "No connected devices found"**
- Start emulator: `emulator -avd <name>`
- Connect Android device via USB with developer mode enabled
- Verify: `flutter devices`

**Error: "Java version not supported"**
- Update JDK to 17+: `java -version`
- Update gradle.properties with correct Java path

### Runtime Issues

**Connection refused error**
- Check server is running: `python server.py`
- Verify firewall allows port 5000
- Check PC IP address is correct
- Ensure PC and phone on same network

**Audio not generating**
- Verify settings are saved
- Check text is under 600 characters
- Try different voice/language combination
- Check server logs for errors

**Share not working**
- Reinstall app from APK
- Check AndroidManifest.xml has share intent
- Try sharing from different apps

## 🔗 Resources

- **Server Repository**: https://github.com/guberm/qwen-tts-server
- **Qwen3-TTS Models**: https://huggingface.co/collections/Qwen/qwen3-tts
- **Official Blog**: https://qwen.ai/blog?id=qwen3tts-0115
- **Flutter Docs**: https://flutter.dev/docs
- **Android Docs**: https://developer.android.com/docs

## 📄 License

MIT License - See LICENSE file

## 🤝 Contributing

Contributions welcome! Please:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📧 Support

For issues and questions:
1. Check troubleshooting section
2. Search existing GitHub issues
3. Create new GitHub issue with:
   - Device info (Android version, device model)
   - Error messages/logs
   - Steps to reproduce

## 🙏 Credits

- **Qwen3-TTS**: Alibaba Qwen Team
- **Flutter**: Google
- **HuggingFace**: Community & Alibaba
- **AudioPlayers**: Luan Nico
- **SharedPreferences**: Google

---

**Last Updated**: January 31, 2026

**Status**: ✅ Active Development & Maintenance
