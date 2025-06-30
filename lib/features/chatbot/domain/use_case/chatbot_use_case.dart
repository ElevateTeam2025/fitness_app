import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/chatbot/domain/repository/chatbot_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatbotUseCase {
  final ChatbotRepository _repository;

  ChatbotUseCase(this._repository);

  Future<Result<String>> sendMessage(String message) =>
      _repository.sendMessage(message);
}
