# Creating GitHub Releases for Qwen3-TTS v1.0.0

This guide shows how to create the v1.0.0 releases on GitHub with the APK and source code.

## Option 1: Using GitHub Web Interface (Easiest)

### For qwen-tts-app (Flutter App)

1. Go to https://github.com/guberm/qwen-tts-app
2. Click "Releases" in the right sidebar (or visit /releases)
3. Click "Create a new release"
4. Fill in:
   - **Tag version**: `v1.0.0`
   - **Release title**: `Qwen3-TTS v1.0.0 - Flutter App`
   - **Description**: Copy from RELEASE_NOTES.md
5. Click "Attach binaries by dropping them here or selecting them"
6. Upload:
   - `build/app/outputs/flutter-apk/app-release.apk` (46.8 MB)
   - `qwen-tts-app-v1.0.0.zip` (1.6 MB)
7. Click "Publish release"

### For qwen-tts-server (Python Server)

1. Go to https://github.com/guberm/qwen-tts-server
2. Click "Releases" in the right sidebar
3. Click "Create a new release"
4. Fill in:
   - **Tag version**: `v1.0.0`
   - **Release title**: `Qwen3-TTS v1.0.0 - Python Server`
   - **Description**: Copy from RELEASE_NOTES.md
5. Click "Attach binaries"
6. Upload:
   - `qwen-tts-server-v1.0.0.zip` (5.8 KB)
7. Click "Publish release"

## Option 2: Using GitHub CLI (Fastest)

### Install GitHub CLI

```bash
# Windows (using Chocolatey)
choco install gh

# macOS (using Homebrew)
brew install gh

# Linux
sudo apt install gh  # or equivalent for your distro
```

### Login to GitHub

```bash
gh auth login
# Follow prompts to authenticate
```

### Create App Release

```bash
cd qwen-tts-app

gh release create v1.0.0 \
  --title "Qwen3-TTS v1.0.0 - Flutter App" \
  --notes-file ../RELEASE_NOTES.md \
  build/app/outputs/flutter-apk/app-release.apk \
  qwen-tts-app-v1.0.0.zip
```

### Create Server Release

```bash
cd ../qwen-tts-server

gh release create v1.0.0 \
  --title "Qwen3-TTS v1.0.0 - Python Server" \
  --notes-file RELEASE_NOTES.md \
  qwen-tts-server-v1.0.0.zip
```

## Option 3: Using git and GitHub API

### Create local tags

```bash
# For app
cd qwen-tts-app
git tag -a v1.0.0 -m "Qwen3-TTS v1.0.0 - Flutter App"
git push origin v1.0.0

# For server
cd ../qwen-tts-server
git tag -a v1.0.0 -m "Qwen3-TTS v1.0.0 - Python Server"
git push origin v1.0.0
```

### Create releases via API

```bash
# Set your GitHub token
export GITHUB_TOKEN="your_personal_access_token"

# For app
curl -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Content-Type: application/json" \
  https://api.github.com/repos/guberm/qwen-tts-app/releases \
  -d '{
    "tag_name": "v1.0.0",
    "name": "Qwen3-TTS v1.0.0 - Flutter App",
    "body": "See RELEASE_NOTES.md for details",
    "draft": false,
    "prerelease": false
  }'
```

## Files to Include in Each Release

### App Release (v1.0.0)
- ✅ `app-release.apk` - Android installer (46.8 MB)
- ✅ `qwen-tts-app-v1.0.0.zip` - Complete source code (1.6 MB)

### Server Release (v1.0.0)
- ✅ `qwen-tts-server-v1.0.0.zip` - Python server with dependencies (5.8 KB)

## Release Checklist

### Before Creating Release
- ✅ Build APK: `flutter build apk --release`
- ✅ Create source zips
- ✅ Add RELEASE_NOTES.md to repositories
- ✅ Update version in README files
- ✅ Test APK installation
- ✅ Verify all files are present

### After Creating Release
- ✅ Verify release page shows correct version
- ✅ Check all download links work
- ✅ Verify APK installs correctly
- ✅ Test basic functionality
- ✅ Announce release on social media
- ✅ Create GitHub Discussions post

## Download Links After Release

### App Release
- Release page: https://github.com/guberm/qwen-tts-app/releases/tag/v1.0.0
- APK direct: https://github.com/guberm/qwen-tts-app/releases/download/v1.0.0/app-release.apk
- Source: https://github.com/guberm/qwen-tts-app/releases/download/v1.0.0/qwen-tts-app-v1.0.0.zip

### Server Release  
- Release page: https://github.com/guberm/qwen-tts-server/releases/tag/v1.0.0
- Source: https://github.com/guberm/qwen-tts-server/releases/download/v1.0.0/qwen-tts-server-v1.0.0.zip

## Troubleshooting

### "Tag already exists"
- Delete local tag: `git tag -d v1.0.0`
- Delete remote tag: `git push origin --delete v1.0.0`
- Then create new release

### "Release already exists"
- Edit existing release
- Or delete and recreate with different tag name

### APK upload fails
- Check file size (46.8 MB should be fine)
- Verify .apk extension
- Try uploading via web interface

## Next Steps

1. Create the releases using your preferred method
2. Share release links:
   - App: https://github.com/guberm/qwen-tts-app/releases/tag/v1.0.0
   - Server: https://github.com/guberm/qwen-tts-server/releases/tag/v1.0.0
3. Announce v1.0.0 release
4. Gather feedback
5. Plan v1.1.0 improvements

---

For more info on creating releases, see GitHub's official guide:
https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository
