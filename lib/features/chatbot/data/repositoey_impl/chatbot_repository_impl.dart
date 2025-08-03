
import 'package:fitness_app/core/common/result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/chatbot_repository.dart';
import '../data_source/local_data_source/chatbot_local_data_source.dart';
import '../data_source/remote_data_source/chatbot_remote_data_source.dart';
import '../model/chat_history_model.dart';
import '../model/message_model.dart';

@Injectable(as: ChatbotRepository)
class ChatbotRepositoryImpl implements ChatbotRepository {
  final ChatbotRemoteDataSource _dataSource;
  final ChatbotLocalDataSource _localDataSource;

  ChatbotRepositoryImpl(this._dataSource, this._localDataSource);

  @override
  Future<Result<String>> sendMessage(String message, String chatId) async {
    final result = await _dataSource.sendMessage(message);
    final chat = await _localDataSource.getChatById(chatId);

    if (chat != null && result is Success<String>) {
      // Set title to first message if this is the first message
      if (chat.messages.isEmpty) {
        chat.title = message;
      }
      chat.messages.add(
        MessageModel(content: message, isUser: true, timestamp: DateTime.now()),
      );
      chat.messages.add(
        MessageModel(
          content: result.data!,
          isUser: false,
          timestamp: DateTime.now(),
        ),
      );
      await _localDataSource.saveChat(chat);
    }

    return result;
  }

  @override
  Future<Result<ChatHistoryModel>> createChat() {
    return _localDataSource.createChat();
  }

  @override
  Future<List<ChatHistoryModel>> getAllChats() {
    return _localDataSource.getAllChats();
  }

  @override
  Future<ChatHistoryModel?> getChatById(String id) {
    return _localDataSource.getChatById(id);
  }
}
