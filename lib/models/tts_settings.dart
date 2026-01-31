class TTSSettings {
  String apiKey;
  String voice;
  String model;
  String languageType;
  String serverUrl;

  TTSSettings({
    this.apiKey = '',
    this.voice = 'Cherry',
    this.model = 'qwen3-tts-flash',
    this.languageType = 'Auto',
    this.serverUrl = 'https://dashscope-intl.aliyuncs.com',
  });

  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
      'voice': voice,
      'model': model,
      'languageType': languageType,
      'serverUrl': serverUrl,
    };
  }

  factory TTSSettings.fromJson(Map<String, dynamic> json) {
    return TTSSettings(
      apiKey: json['apiKey'] ?? '',
      voice: json['voice'] ?? 'Cherry',
      model: json['model'] ?? 'qwen3-tts-flash',
      languageType: json['languageType'] ?? 'Auto',
      serverUrl: json['serverUrl'] ?? 'https://dashscope-intl.aliyuncs.com',
    );
  }

  // Available voices for DashScope cloud API (qwen3-tts-flash)
  static const List<String> availableVoices = [
    // Popular voices
    'Cherry', // Sunny, positive, friendly young woman
    'Serena', // Gentle young woman
    'Ethan', // Bright, warm, energetic male
    'Chelsie', // Anime-style virtual girlfriend
    'Momo', // Playful and cute female
    'Vivian', // Cool, cute, slightly feisty female
    'Moon', // Spontaneous handsome male
    'Maia', // Intelligence with gentleness
    'Kai', // Soothing voice
    'Nofish', // Male designer
    'Bella', // Petite girl
    'Jennifer', // Premium American English female
    'Ryan', // Rhythmic and dramatic
    'Katerina', // Mature female
    'Aiden', // Young American chef
    'Eldric Sage', // Calm wise old man
    'Mia', // Gentle as spring water
    'Mochi', // Clever bright "little adult"
    'Bellona', // Powerful sonorous voice
    'Vincent', // Raspy smoky voice
    'Bunny', // Extremely cute young girl
    'Neil', // Professional news anchor
    'Elias', // Academic storyteller
    'Arthur', // Rustic weathered voice
    'Nini', // Soft sticky voice
    'Ebona', // Whispery mysterious
    'Seren', // Gentle sleep voice
    'Pip', // Mischievous childlike
    'Stella', // Sweet but powerful
    // Language-specific voices
    'Bodega', // Spanish man
    'Sonrisa', // Latin American woman
    'Alek', // Russian voice
    'Dolce', // Italian man
    'Sohee', // Korean unnie
    'Ono Anna', // Japanese female
    'Lenn', // German man
    'Emilien', // French man
    'Andre', // Calm male
    'Radio Gol', // Portuguese football commentator
    // Chinese dialect voices
    'Jada', // Shanghai
    'Dylan', // Beijing
    'Li', // Nanjing
    'Marcus', // Shaanxi
    'Roy', // Minnan (Taiwanese)
    'Peter', // Tianjin
    'Sunny', // Sichuan female
    'Eric', // Sichuan male
    'Rocky', // Cantonese male
    'Kiki', // Cantonese female
  ];

  // Available language types for TTS
  static const List<String> availableLanguages = [
    'Auto', // Automatic detection (default)
    'Chinese',
    'English',
    'Japanese',
    'Korean',
    'German',
    'French',
    'Russian',
    'Italian',
    'Portuguese',
    'Spanish',
  ];

  // Available models for cloud API
  static const List<String> availableModels = [
    'qwen3-tts-flash', // Recommended: 49 voices, 600 chars max
    'qwen-tts', // Alternative: 7 voices, 512 tokens max, Chinese+English only
  ];

  // Get voices recommended for a specific language
  static List<String> getVoicesForLanguage(String language) {
    switch (language) {
      case 'Chinese':
        return [
          'Cherry',
          'Serena',
          'Chelsie',
          'Momo',
          'Vivian',
          'Maia',
          'Mia',
          'Nini',
          'Bunny',
          'Stella',
          'Ethan',
          'Moon',
          'Kai',
          'Nofish',
          'Neil',
          'Elias',
          'Jada',
          'Dylan',
          'Li',
          'Marcus',
          'Roy',
          'Peter',
          'Sunny',
          'Eric',
          'Rocky',
          'Kiki',
        ];
      case 'English':
        return [
          'Cherry',
          'Serena',
          'Ethan',
          'Jennifer',
          'Ryan',
          'Katerina',
          'Aiden',
          'Mia',
          'Bellona',
          'Vincent',
          'Neil',
          'Elias',
          'Arthur',
        ];
      case 'Japanese':
        return ['Ono Anna', 'Cherry', 'Momo', 'Vivian', 'Stella'];
      case 'Korean':
        return ['Sohee', 'Cherry', 'Momo', 'Vivian'];
      case 'Spanish':
        return ['Bodega', 'Sonrisa', 'Cherry', 'Serena', 'Ethan'];
      case 'Portuguese':
        return ['Radio Gol', 'Andre', 'Cherry', 'Serena'];
      case 'French':
        return ['Emilien', 'Cherry', 'Serena', 'Maia'];
      case 'German':
        return ['Lenn', 'Cherry', 'Serena', 'Ethan'];
      case 'Italian':
        return ['Dolce', 'Cherry', 'Serena'];
      case 'Russian':
        return ['Alek', 'Cherry', 'Serena'];
      default: // Auto
        return availableVoices;
    }
  }
}
