# Qwen3-TTS Flutter App

A feature-rich Flutter application for text-to-speech using **FREE** Qwen3-TTS open-source models. Works seamlessly with the companion Python server - no cloud API, no API keys, completely private!

## 🌟 Features

- ✅ **FREE & Open Source** - Use free Qwen3-TTS models from HuggingFace
- ✅ **Text-to-Speech** - Convert text to natural-sounding audio
- ✅ **Share from Apps** - Accept text from any app via share intent
- ✅ **Audio Playback** - Built-in audio player with controls
- ✅ **10+ Languages** - Chinese, English, Japanese, Korean, German, French, Russian, Portuguese, Spanish, Italian
- ✅ **Voice Selection** - 40+ voices with language filtering
- ✅ **Settings Persistence** - Remember your preferences
- ✅ **Server Configuration** - Connect to your local or remote server

## 📸 Screenshots

- **Home Screen**: Text input with voice selection and playback controls
- **Settings Screen**: Server URL, voice selection, language preferences
- **Share Integration**: Accept text from any app

## 🚀 Getting Started

### Prerequisites

- Flutter 3.0.0 or later
- Android device/emulator (tested on Android 9+)
- Python server running Qwen3-TTS models

### Installation

1. **Clone the repository**:
```bash
git clone https://github.com/guberm/qwen-tts-app.git
cd qwen-tts-app
```

2. **Install dependencies**:
```bash
flutter pub get
```

3. **Run the app**:
```bash
flutter run
```

### Build APK

```bash
flutter build apk --release
```

The APK will be at: `build/app/outputs/flutter-apk/app-release.apk`

## ⚙️ Configuration

### Connect to Local Server

The app requires a Qwen3-TTS server running. You have two options:

#### Option 1: Use Local Server (Recommended)

1. Set up the [Qwen3-TTS Server](https://github.com/guberm/qwen-tts-server)
2. Find your PC's IP address (Windows: `ipconfig`)
3. In app Settings:
   - Set **Server URL** to: `http://192.168.1.100:5000` (your actual IP)
   - Leave **API Key** empty
4. Start using!

#### Option 2: Use Cloud API (DashScope)

1. Get API key from [Alibaba Cloud DashScope](https://bailian.console.aliyun.com/)
2. In app Settings:
   - Set **API Key** to your DashScope key
   - Set **Server URL** to: `https://dashscope.aliyuncs.com/api/v1/services/aigc/text-to-speech/synthesize`
3. Start using!

## 📱 How to Use

1. **Open the app**
2. **Enter text** you want to convert to speech (max 600 chars)
3. **Select a voice** from the dropdown
4. **Choose a language** (voices filter by language)
5. **Tap Generate** to create audio
6. **Play** the generated audio or share it

### Share from Other Apps

1. Select text in any app
2. Tap "Share"
3. Select "Qwen TTS"
4. The text will be loaded in the app, ready to convert!

## 🏗️ Project Structure

```
qwen_tts_app/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── models/
│   │   └── tts_settings.dart    # Settings data model
│   ├── services/
│   │   ├── tts_service.dart     # TTS API integration
│   │   └── settings_service.dart # Local storage
│   └── screens/
│       ├── home_screen.dart      # Main TTS UI
│       └── settings_screen.dart  # Configuration UI
├── android/
│   ├── app/
│   │   ├── build.gradle
│   │   └── src/main/
│   │       ├── AndroidManifest.xml
│   │       ├── kotlin/MainActivity.kt
│   │       └── res/              # Resources
│   ├── gradle/
│   ├── build.gradle
│   └── settings.gradle
├── pubspec.yaml                 # Flutter dependencies
└── README.md                    # This file
```

## 📋 Dependencies

- **http**: HTTP requests to TTS server
- **shared_preferences**: Local storage for settings
- **receive_sharing_intent**: Accept shared text from other apps
- **audioplayers**: Audio playback functionality
- **path_provider**: File system access
- **permission_handler**: Runtime permissions
- **url_launcher**: Open URLs

## 🎯 Supported Languages & Voices

The app supports these languages with multiple voices:

| Language | Voices | Notes |
|----------|--------|-------|
| 🇨🇳 Chinese | Multiple | Mandarin, Cantonese, Shanghai dialects |
| 🇬🇧 English | Multiple | Various accents |
| 🇯🇵 Japanese | Multiple | Hiragana support |
| 🇰🇷 Korean | Multiple | Full Korean support |
| 🇩🇪 German | Multiple | Regional variations |
| 🇫🇷 French | Multiple | European and Canadian |
| 🇷🇺 Russian | Multiple | Cyrillic support |
| 🇵🇹 Portuguese | Multiple | Brazilian and European |
| 🇪🇸 Spanish | Multiple | Iberian and Latin American |
| 🇮🇹 Italian | Multiple | Native Italian |

## 🔗 API Reference

The app connects to the Qwen3-TTS server API:

### Generate Audio
```bash
POST /tts/generate
Content-Type: application/json

{
  "text": "Hello world",
  "voice": "Serena",
  "language_type": "English"
}
```

### Health Check
```bash
GET /health
```

## 🐛 Troubleshooting

### Connection Errors
- **Issue**: "Connection refused" or "No connection"
- **Solution**: 
  - Ensure server is running: `python server.py`
  - Check firewall allows port 5000
  - Verify PC and phone on same network
  - Use actual IP, not localhost

### Audio Not Generated
- **Issue**: Settings show server URL but no audio
- **Solution**:
  - Check server is running
  - Verify text is under 600 characters
  - Check server logs for errors
  - Try health check: `http://YOUR_IP:5000/health`

### Share Not Working
- **Issue**: App doesn't appear in share menu
- **Solution**:
  - Reinstall the app
  - Check Android manifest permissions
  - Try sharing from different apps

### Slow Generation
- **Issue**: Takes too long to generate audio
- **Solution**:
  - Use 0.6B model (faster, uses less RAM)
  - Use GPU if available
  - Reduce text length

## 📄 Architecture

### Data Flow
1. **User Input** → Home Screen
2. **Text + Settings** → TTS Service
3. **API Request** → Server (local or cloud)
4. **Audio File** → Audio Player
5. **Settings** → Shared Preferences

### State Management
- Uses Provider pattern for settings
- Local storage via SharedPreferences
- Stateful widgets for UI updates

## 🔐 Privacy & Security

- ✅ **No cloud upload** - Audio generated locally (with local server)
- ✅ **No tracking** - No analytics or user tracking
- ✅ **Open source** - Full source code transparency
- ✅ **Local storage** - Settings stored locally only

## 📄 License

MIT License - See LICENSE file

## 🤝 Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 🔗 Related Projects

- **Server**: https://github.com/guberm/qwen-tts-server
- **Qwen3-TTS Models**: https://huggingface.co/collections/Qwen/qwen3-tts
- **Official Blog**: https://qwen.ai/blog?id=qwen3tts-0115

## 📧 Support

For issues and questions:
1. Check the troubleshooting section
2. Search existing GitHub issues
3. Create a new GitHub issue with:
   - Device info (Android version, device model)
   - Error messages or logs
   - Steps to reproduce

## 🙏 Credits

- **Qwen3-TTS**: Alibaba Qwen Team
- **Flutter**: Google
- **HuggingFace**: Community & Alibaba

---

**Last Updated**: January 31, 2026

**Status**: ✅ Active Development
