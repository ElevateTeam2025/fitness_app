import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/chatbot/data/model/chat_history_model.dart';

abstract class ChatbotRepository {
  Future<Result<String>> sendMessage(String message, String chatId);

  Future<Result<ChatHistoryModel>> createChat();

  Future<List<ChatHistoryModel>> getAllChats();

  Future<ChatHistoryModel?> getChatById(String id);
}
