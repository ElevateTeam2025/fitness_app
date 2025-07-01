import '../../entity/chat_history_entity.dart';
import '../../entity/message_entity.dart';

abstract class ChatRepository {
  Future<List<ChatHistoryEntity>> getAllChatHistory();
  Future<ChatHistoryEntity> getChatHistory(String chatId);
  Future<void> saveChatHistory(ChatHistoryEntity chat);
  Future<void> updateChatHistory(ChatHistoryEntity chat);
  Future<MessageEntity> sendMessage(ChatHistoryEntity chat, String userMessage);
  Future<void> clearAllChatHistory();

}