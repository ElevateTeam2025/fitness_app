

import 'package:injectable/injectable.dart';

import '../../entity/chat_history_entity.dart';
import '../../entity/message_entity.dart';
import '../../repository/repo/chat_repository.dart';

@injectable
class ChatUseCase{
  final ChatRepository repository;

  ChatUseCase(this.repository);

  Future<MessageEntity> sendMessage(ChatHistoryEntity chat, String message) async {
    return await repository.sendMessage(chat, message);
  }
  Future<List<ChatHistoryEntity>> getAllChats() async {
    return await repository.getAllChatHistory();
  }
  Future<ChatHistoryEntity> getChatById(String chatId) async {
    return await repository.getChatHistory(chatId);
  }
  Future<void> saveChat(ChatHistoryEntity chat) async {
    return await repository.saveChatHistory(chat);
  }
  Future<void> clearChats() async {
    return await repository.clearAllChatHistory();
  }

}