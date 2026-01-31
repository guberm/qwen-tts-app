import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/tts_settings.dart';
import '../services/settings_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _apiKeyController;
  late TextEditingController _serverUrlController;
  late TTSSettings _settings;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _settings = TTSSettings.fromJson(
      SettingsService.instance.settings.toJson(),
    );
    _apiKeyController = TextEditingController(text: _settings.apiKey);
    _serverUrlController = TextEditingController(text: _settings.serverUrl);
  }

  @override
  void dispose() {
    _apiKeyController.dispose();
    _serverUrlController.dispose();
    super.dispose();
  }

  Future<void> _saveSettings() async {
    setState(() {
      _isSaving = true;
    });

    _settings.apiKey = _apiKeyController.text;
    _settings.serverUrl = _serverUrlController.text;
    await SettingsService.instance.saveSettings(_settings);

    setState(() {
      _isSaving = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Settings saved successfully')),
      );
    }
  }

  Future<void> _openApiKeyUrl() async {
    final Uri url = Uri.parse(
      'https://bailian.console.aliyun.com/?apiKey=1#/api-key',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Could not open browser')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: _isSaving
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.save),
            onPressed: _isSaving ? null : _saveSettings,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Server URL Section
          const Text(
            'Server URL',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _serverUrlController,
            decoration: const InputDecoration(
              hintText:
                  'http://192.168.1.100:5000 or https://dashscope-intl.aliyuncs.com',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.cloud),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'For FREE models: http://YOUR_PC_IP:5000 (see README)\n'
            'For paid cloud API: https://dashscope-intl.aliyuncs.com',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),

          // API Key Section
          const Text(
            'API Key',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _apiKeyController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Only needed for cloud API (not free models)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.key),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.open_in_new),
                onPressed: _openApiKeyUrl,
                tooltip: 'Get API Key',
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Leave empty if using free local server',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),

          // Model Selection
          const Text(
            'Model',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: _settings.model,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.memory),
            ),
            items: TTSSettings.availableModels.map((model) {
              return DropdownMenuItem(value: model, child: Text(model));
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _settings.model = value;
                });
              }
            },
          ),
          const SizedBox(height: 8),
          Text(
            'Qwen3-TTS-Flash: 49 voices, 600 chars (recommended)\n'
            'Qwen-TTS: 7 voices, 512 tokens, Chinese+English only',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),

          // Voice Selection
          const Text(
            'Voice',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: _settings.voice,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.record_voice_over),
            ),
            items: TTSSettings.availableVoices.map((voice) {
              return DropdownMenuItem(value: voice, child: Text(voice));
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _settings.voice = value;
                });
              }
            },
          ),
          const SizedBox(height: 24),

          // Language Selection
          const Text(
            'Language',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: _settings.languageType,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.language),
            ),
            items: TTSSettings.availableLanguages.map((language) {
              return DropdownMenuItem(value: language, child: Text(language));
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _settings.languageType = value;
                });
              }
            },
          ),
          const SizedBox(height: 8),
          Text(
            'Auto detects language automatically. Choose a specific language for better quality.',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),

          // Information Card
          Card(
            color: Colors.blue.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.blue.shade700),
                      const SizedBox(width: 8),
                      Text(
                        'About Qwen3 TTS',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Qwen3-TTS supports 10 languages: '
                    'Chinese, English, Japanese, Korean, German, French, Russian, '
                    'Portuguese, Spanish, and Italian.',
                    style: TextStyle(color: Colors.blue.shade900),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Character Limit:\n'
                    '• Qwen3-TTS-Flash: 600 characters\n'
                    '• Qwen-TTS: 512 tokens',
                    style: TextStyle(fontSize: 12, color: Colors.blue.shade800),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
