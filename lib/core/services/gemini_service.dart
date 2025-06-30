import 'package:fitness_app/core/utils/end_points.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

@injectable
class GeminiService {
  late final GenerativeModel _model;

  GeminiService() {
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: ApiEndPoints.apiKey,
      generationConfig: GenerationConfig(
        temperature: 0.7,
        topK: 40,
        topP: 0.95,
        maxOutputTokens: 1024,
      ),
    );
  }

  Future<String> generateResponse(List<Content> history, String prompt) async {
    try {
      final chat = _model.startChat(history: history);
      final response = await chat.sendMessage(Content.text(prompt));
      return response.text ?? 'No response generated';
    } catch (e) {
      throw Exception('Gemini API call failed: ');
    }
  }
}