import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../models/tts_settings.dart';

class TTSService {
  Future<File> generateTTS(String text, TTSSettings settings) async {
    if (settings.apiKey.isEmpty) {
      throw Exception('API Key is not set. Please add it in Settings.');
    }

    if (text.length > 600) {
      throw Exception('Text is too long. Maximum 600 characters per request.');
    }

    // Determine if using free local server or cloud API
    final isLocalServer =
        settings.serverUrl.contains('localhost') ||
        settings.serverUrl.contains('127.0.0.1') ||
        settings.serverUrl.startsWith('http://192.168.') ||
        settings.serverUrl.startsWith('http://10.');

    final apiUrl = isLocalServer
        ? '${settings.serverUrl}/tts/generate'
        : '${settings.serverUrl}/api/v1/services/audio/tts/generation';

    final headers = isLocalServer
        ? {'Content-Type': 'application/json'}
        : {
            'Authorization': 'Bearer ${settings.apiKey}',
            'Content-Type': 'application/json',
            'X-DashScope-Async': 'enable',
          };

    final Map<String, dynamic> payload = isLocalServer
        ? {
            'text': text,
            'voice': settings.voice,
            'language_type': settings.languageType,
          }
        : {
            'model': settings.model,
            'input': {'text': text},
            'parameters': {
              'voice': settings.voice,
              'language_type': settings.languageType,
            },
          };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(payload),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to generate TTS: ${response.statusCode} - ${response.body}',
      );
    }

    final result = jsonDecode(response.body);

    // Check if there's an error
    if (result['error'] != null) {
      throw Exception('API Error: ${result['error']}');
    }
    if (result['code'] != null && result['code'] != '') {
      throw Exception('API Error: ${result['message'] ?? result['code']}');
    }

    // Get the audio URL from the response (different for local vs cloud)
    final audioUrl = isLocalServer
        ? result['url']
        : result['output']?['audio']?['url'];

    if (audioUrl == null) {
      throw Exception('No audio URL in response. Response: ${response.body}');
    }

    // Download the audio file
    final audioResponse = await http.get(Uri.parse(audioUrl));

    if (audioResponse.statusCode != 200) {
      throw Exception('Failed to download audio: ${audioResponse.statusCode}');
    }

    // Save to file
    final directory = await getApplicationDocumentsDirectory();
    final file = File(
      '${directory.path}/output_${DateTime.now().millisecondsSinceEpoch}.wav',
    );
    await file.writeAsBytes(audioResponse.bodyBytes);

    return file;
  }
}
