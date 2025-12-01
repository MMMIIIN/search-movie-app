import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class EnvConfig {
  static String? _tmdbApiKey;

  static Future<void> load() async {
    try {
      final envContent = await rootBundle.loadString('.env.apikey');
      final lines = envContent.split('\n');
      for (final line in lines) {
        if (line.trim().startsWith('TMDB_API_KEY=')) {
          _tmdbApiKey = line.split('=')[1].trim();
          break;
        }
      }
    } catch (e) {
      debugPrint('Error loading .env.apikey: $e');
    }
  }

  static String get tmdbApiKey => _tmdbApiKey ?? '';
}
