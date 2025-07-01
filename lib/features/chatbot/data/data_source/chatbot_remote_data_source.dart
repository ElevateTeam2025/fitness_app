import 'package:fitness_app/core/api/api_execute.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:injectable/injectable.dart';

abstract class ChatbotRemoteDataSource {
  Future<Result<String>> sendMessage(String message);
}

@Injectable(as: ChatbotRemoteDataSource)
class ChatbotRemoteDataSourceImpl implements ChatbotRemoteDataSource {
  final Gemini _gemini;

  ChatbotRemoteDataSourceImpl(this._gemini);

  @override
  Future<Result<String>> sendMessage(String message) async {
   return executeApi(() async {
      final String promet =
          """ Please answer the following question in the same language it's written. Only respond if the question is related to fitness or gym topics. 

    If the question is not related to fitness or gym
    , politely respond that you can only answer questions in the fitness domain.$message""";
      final response = await _gemini.text(promet);
      return response!.output!;
    });
  }
}
