# Qwen3-TTS v1.0.0 Release

**Release Date**: January 31, 2026

First production release of Qwen3-TTS - A complete free, open-source text-to-speech solution!

## 🎉 What's Included

### ✅ Flutter Android App (v1.0.0)
- Complete Flutter application for Android
- Support for 10 languages and 49 voices
- Free local server integration
- Cloud API support (Alibaba DashScope)
- Text sharing from other apps
- Built-in audio player
- Local settings persistence
- Beautiful Material Design UI

### ✅ Python TTS Server (v1.0.0)
- Flask-based REST API server
- Support for 4 Qwen3-TTS models (0.6B and 1.7B)
- GPU acceleration (CUDA support)
- Free open-source models from HuggingFace
- No API key required
- Fully local processing
- Multi-language support

## 📥 Downloads

### Android App
- **app-release.apk** (46.8 MB) - Ready to install on Android 7.0+
- **qwen-tts-app-v1.0.0.zip** - Complete source code

### Server
- **qwen-tts-server-v1.0.0.zip** - Complete Python server with dependencies

## 🚀 Quick Start

### Install Android App

1. Download `app-release.apk`
2. Transfer to Android device
3. Enable "Unknown Sources" in Settings
4. Install the APK
5. Open Qwen TTS app

### Set Up Server

```bash
# Extract server zip
unzip qwen-tts-server-v1.0.0.zip
cd qwen-tts-server-v1.0.0

# Install Python dependencies
pip install -r requirements.txt

# Install PyTorch
pip install torch torchvision torchaudio

# Run server
python server.py
```

### Connect App to Server

1. Find your PC's IP: `ipconfig` (Windows)
2. In app Settings:
   - Server URL: `http://192.168.1.100:5000` (use your IP)
   - Leave API Key empty
3. Select language and voice
4. Start generating speech!

## 📋 Features

### App Features
- ✅ 49 professional voices
- ✅ 10 language support
- ✅ Real-time audio playback
- ✅ Text import from other apps
- ✅ Configurable server/cloud API
- ✅ Language-based voice filtering
- ✅ Character counter with limits
- ✅ Error handling and user feedback
- ✅ Settings persistence
- ✅ Material Design 3 UI

### Server Features
- ✅ Multiple model options (0.6B, 1.7B)
- ✅ GPU acceleration support
- ✅ REST API endpoints
- ✅ Voice cloning capability
- ✅ Streaming support
- ✅ Automatic model download
- ✅ Health checks
- ✅ Flask with CORS support
- ✅ Error handling
- ✅ Device detection (GPU/CPU)

## 🌟 Supported Languages

- 🇨🇳 Chinese (26 voices including dialects)
- 🇬🇧 English (13 voices)
- 🇯🇵 Japanese (5 voices)
- 🇰🇷 Korean (4 voices)
- 🇪🇸 Spanish (5 voices)
- 🇵🇹 Portuguese (4 voices)
- 🇫🇷 French (4 voices)
- 🇩🇪 German (4 voices)
- 🇮🇹 Italian (3 voices)
- 🇷🇺 Russian (3 voices)

## 📊 System Requirements

### Android App
- Android 7.0+ (API 24)
- 50 MB free space
- Network connection for API calls
- Optional: 4GB RAM for smooth operation

### Server
- Python 3.9+
- 8GB RAM (for 0.6B model)
- 2-5GB disk space
- Optional: NVIDIA GPU with CUDA for faster inference
- Windows, macOS, or Linux

## 🔧 Technical Details

### Stack
- **Frontend**: Flutter 3.0+ (Dart)
- **Backend**: Flask (Python)
- **Models**: Qwen3-TTS from HuggingFace
- **Dependencies**: PyTorch, Transformers
- **Platform**: Android 7.0+

### Architecture
- RESTful API communication
- Local settings storage (SharedPreferences)
- Async/await for non-blocking operations
- GPU acceleration with CUDA
- Automatic model caching

## 📝 Release Notes

### v1.0.0 - Initial Release

#### Added
- Complete Flutter app for Android TTS
- Python server with multiple model support
- Support for 10 languages and 49 voices
- Text sharing integration
- Audio playback controls
- Settings persistence
- Error handling and user feedback
- Comprehensive documentation
- GitHub releases with APK and source code

#### Features
- Free and open-source
- No API key required for local server
- Cloud API support for paid tier
- Language-based voice filtering
- Real-time audio generation
- Cross-platform support

## 🆘 Troubleshooting

### Can't connect to server
- Verify server is running: `python server.py`
- Check PC IP address is correct
- Ensure phone and PC on same network
- Check firewall allows port 5000

### Audio not generating
- Check text is under 600 characters
- Verify API key (if using cloud)
- Try different voice/language
- Check server logs for errors

### Installation issues
- Enable "Unknown Sources" for APK
- Check Android version is 7.0+
- Ensure 50MB free space
- Try reinstalling app

### Server won't start
- Check Python 3.9+ installed
- Verify dependencies: `pip install -r requirements.txt`
- Check port 5000 not in use
- Ensure internet for model download

## 📚 Documentation

Comprehensive documentation available in:
- **app/README.md** - Flutter app setup and usage
- **server/README.md** - Server installation and API reference
- **GitHub Wiki** - Detailed guides and examples

## 🔗 Resources

- **Flutter App**: https://github.com/guberm/qwen-tts-app
- **Server**: https://github.com/guberm/qwen-tts-server
- **Qwen Models**: https://huggingface.co/collections/Qwen/qwen3-tts
- **Official Blog**: https://qwen.ai/blog?id=qwen3tts-0115

## 📄 License

MIT License - Free to use and modify

## 🤝 Contributing

Contributions welcome! Areas of interest:
- Performance optimization
- Additional language support
- Web UI
- Docker deployment
- iOS support

## ✨ Credits

- **Qwen3-TTS Models**: Alibaba Qwen Team
- **Flutter Framework**: Google
- **HuggingFace**: Community & Alibaba
- **Community Contributors**: Your support!

## 🗓️ What's Next?

### Planned Features
- iOS app support
- Web UI for testing
- Batch processing
- Voice cloning UI
- Advanced voice design
- Docker containerization
- Performance optimizations
- Additional language support

---

**Thank you for using Qwen3-TTS!**

For feedback, issues, or contributions, please visit:
- App Issues: https://github.com/guberm/qwen-tts-app/issues
- Server Issues: https://github.com/guberm/qwen-tts-server/issues
