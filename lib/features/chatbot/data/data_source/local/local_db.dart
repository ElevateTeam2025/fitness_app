import 'package:fitness_app/features/chatbot/data/model/local/chat_message_model.dart';

import '../../../../../core/common/result.dart';

abstract class LocalDB {
  Future<Result<ChatMessageModel>> getChatById(String id);
  Future<Result<List<ChatMessageModel>>> getAllChats();
  Future<void> saveChatMessage(ChatMessageModel chatMessage);
  Future<Result<void>> deleteChat(String chatId);
  Future<Result<void>> clearAllChats();
}
