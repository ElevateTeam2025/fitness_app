import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/chatbot/data/model/chat_history_model.dart';
import 'package:fitness_app/features/chatbot/domain/repository/chatbot_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatbotUseCase {
  final ChatbotRepository _repository;

  ChatbotUseCase(this._repository);

  Future<Result<String>> sendMessage(String message, String chatId) =>
      _repository.sendMessage(message, chatId);

  Future<Result<ChatHistoryModel>> createChat() => _repository.createChat();

  Future<List<ChatHistoryModel>> getAllChats() {
    return _repository.getAllChats();
  }

  Future<ChatHistoryModel?> getChatById(String id) {
    return _repository.getChatById(id);
  }
}
