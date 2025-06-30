import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/entity/chat_history_entity.dart';
import '../../../domain/entity/message_entity.dart';
import '../../../domain/repository/repo/chat_repository.dart';
import '../../data_source/local_data_source/local_data_source.dart';
import '../../data_source/remote_data_source/remote_data_source.dart';
import '../../model/local_db/chat_history_model.dart';
import '../../model/local_db/message_model.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final LocalDataDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ChatRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<List<ChatHistoryEntity>> getAllChatHistory() async {
    try {
      final chatModels = await localDataSource.getAllChats();
      return chatModels.map((model) => ChatHistoryEntity.fromModel(model)).toList();
    } catch (e) {
      throw Exception('Failed to load chat history: $e');
    }
  }

  @override
  Future<ChatHistoryEntity> getChatHistory(String chatId) async {
    try {

      final chatModel = await localDataSource.getChatById(chatId);
      if (chatModel == null) {
        print('Chat not found in local storage');
        throw Exception('Chat not found');
      }
      print('Found chat with ${chatModel.messages.length} messages');
      final entity = ChatHistoryEntity.fromModel(chatModel);
      print('Converted to entity with ${entity.messages.length} messages');
      return entity;
    } catch (e) {
      print('Error in getChatHistory: $e');
      throw Exception('Failed to load chat: $e');
    }
  }

  @override
  Future<void> saveChatHistory(ChatHistoryEntity chat) async {
    try {
      final chatModel = _entityToModel(chat);
      await localDataSource.saveChatHistory(chatModel);
    } catch (e) {
      throw Exception('Failed to save chat: $e');
    }
  }

  @override
  Future<void> updateChatHistory(ChatHistoryEntity chat) async {
    try {
      final chatModel = _entityToModel(chat);
      await localDataSource.updateChatHistory(chatModel);
    } catch (e) {
      throw Exception('Failed to update chat: $e');
    }
  }

  @override
  Future<MessageEntity> sendMessage(
      ChatHistoryEntity chat, String userMessage) async {
    try {
      final history = chat.messages
          .where((msg) => msg.content.trim().isNotEmpty)
          .map((msg) => Content(msg.role, [TextPart(msg.content)]))
          .toList();

      final response = await remoteDataSource.getGeminiResponse(history, userMessage);

      final geminiMessageEntity = MessageEntity(
        id: const Uuid().v4(),
        content: response,
        role: 'model',
        timestamp: DateTime.now(),
      );

      if (chat.messages.length == 1 && chat.title == 'New Chat') {
        final formattedDate = DateFormat('MMM d, yyyy').format(DateTime.now());
        final truncatedMessage = userMessage.length > 30
            ? '${userMessage.substring(0, 30)}...'
            : userMessage;
        chat.title = '$truncatedMessage - $formattedDate';
      }

      chat.messages.add(geminiMessageEntity);

      await updateChatHistory(chat);

      return geminiMessageEntity;
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }

  ChatHistoryModel _entityToModel(ChatHistoryEntity entity) {
    return ChatHistoryModel(
      id: entity.id,
      title: entity.title,
      messages: entity.messages
          .map((e) => MessageModel(
        id: e.id,
        content: e.content,
        role: e.role,
        timestamp: e.timestamp,
      ))
          .toList(),
      createdAt: entity.createdAt,
    );
  }

  @override
  Future<void> clearAllChatHistory() async {
    await localDataSource.clearAllChatHistory();
  }
}