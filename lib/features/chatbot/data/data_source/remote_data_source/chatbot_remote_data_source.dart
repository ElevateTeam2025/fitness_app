import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/core/api/api_execute.dart';

import '../../../../../core/services/env_config.dart';

abstract class ChatbotRemoteDataSource {
  Future<Result<String>> sendMessage(String message);
}

@Injectable(as: ChatbotRemoteDataSource)
class ChatbotRemoteDataSourceImpl implements ChatbotRemoteDataSource {
  final GenerativeModel _model;

  ChatbotRemoteDataSourceImpl()
    : _model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: EnvConfig.apiKey,
      );

  @override
  Future<Result<String>> sendMessage(String message) async {
    return executeApi(() async {
      final prompt =
          '''
Answer only fitness and gym questions. Suggest workouts and healthy meals if asked. Reply in the same language used in the question (Arabic or English).
"
$message
''';

      final response = await _model.generateContent([Content.text(prompt)]);

      return response.text ?? 'No response generated';
    });
  }
}
