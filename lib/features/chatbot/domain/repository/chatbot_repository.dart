import 'package:fitness_app/core/common/result.dart';

abstract  class ChatbotRepository {
  Future<Result<String>> sendMessage(String message);
}