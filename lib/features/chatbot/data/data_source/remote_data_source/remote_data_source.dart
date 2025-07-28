


import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/services/gemini_service.dart';

abstract interface class RemoteDataSource{

  Future<String> getGeminiResponse(List<Content> history, String prompt);
}


@Injectable(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource{
  final GeminiService _geminiService;

  RemoteDataSourceImpl(this._geminiService);
  @override
  Future<String> getGeminiResponse(List<Content> history, String prompt) async{
    try {
      return await _geminiService.generateResponse(history, prompt);
    } catch (e) {

      rethrow;
    }
  }
  
}