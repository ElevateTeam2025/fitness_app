import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get apiKey => dotenv.env['API_KEY'] ?? 'KEY_NOT_FOUND';
}
