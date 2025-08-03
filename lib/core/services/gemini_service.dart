
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

@injectable
class GeminiService {
  late final GenerativeModel _model;

  GeminiService() {
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: "AIzaSyCTUhP55Yw4EY5OSgWSA1-sieIUK4wCaOU",
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


      const String instruction = """
Please answer the following question in the same language it's written. Only respond if the question is related to fitness or gym topics.

If the question is not related to fitness or gym, politely respond that you can only answer questions in the fitness domain.

""";
      final String fullPrompt = instruction + prompt;

      final response = await chat.sendMessage(Content.text(fullPrompt));
      return response.text ?? 'No response generated';
    } catch (e) {
      throw Exception('Gemini API call failed: ');
    }
  }
}