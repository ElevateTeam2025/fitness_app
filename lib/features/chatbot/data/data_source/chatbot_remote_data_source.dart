import 'package:fitness_app/core/api/api_execute.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

abstract class ChatbotRemoteDataSource {
  Future<Result<String>> sendMessage(String message);
}

@Injectable(as: ChatbotRemoteDataSource)
class ChatbotRemoteDataSourceImpl implements ChatbotRemoteDataSource {
  late final GenerativeModel _model;

  ChatbotRemoteDataSourceImpl() {
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

  @override
  Future<Result<String>> sendMessage(String message) async {
    return executeApi(() async {
      const int maxRetries = 3;
      int retryCount = 0;

      while (retryCount < maxRetries) {
        try {
          const String instruction = """
Please answer the following question in the same language it's written. Only respond if the question is related to fitness or gym topics.

If the question is not related to fitness or gym, politely respond that you can only answer questions in the fitness domain.

""";
          final String fullPrompt = instruction + message;

          final response = await _model.generateContent([
            Content.text(fullPrompt),
          ]);
          return response.text ?? 'No response generated';
        } on GenerativeAIException catch (e) {
          retryCount++;
          if (e.message.contains('503') || e.message.contains('overloaded')) {
            if (retryCount >= maxRetries) {
              return 'عذراً، الخادم مشغول حالياً. يرجى المحاولة مرة أخرى بعد قليل.';
            }
            // Wait before retrying
            await Future.delayed(Duration(seconds: retryCount * 2));
            continue;
          } else if (e.message.contains('429') || e.message.contains('quota')) {
            return 'تم تجاوز حد الاستخدام المسموح. يرجى المحاولة لاحقاً.';
          } else {
            return 'حدث خطأ في الاتصال. يرجى المحاولة مرة أخرى.';
          }
        } catch (e) {
          return 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.';
        }
      }

      return 'عذراً، الخادم مشغول حالياً. يرجى المحاولة مرة أخرى بعد قليل.';
    });
  }
}
