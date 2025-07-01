import 'package:equatable/equatable.dart';

import '../../../domain/entity/chat_history_entity.dart';

enum ChatStatus { initial, loading, loaded, error }

class ChatState extends Equatable {
  final ChatStatus status;
  final ChatHistoryEntity? currentChat;
  final List<ChatHistoryEntity> chatHistory;
  final bool isSendingMessage;
  final String? errorMessage;

  const ChatState({
    this.status = ChatStatus.initial,
    this.currentChat,
    this.chatHistory = const [],
    this.isSendingMessage = false,
    this.errorMessage,
  });

  ChatState copyWith({
    ChatStatus? status,
    ChatHistoryEntity? currentChat,
    List<ChatHistoryEntity>? chatHistory,
    bool? isSendingMessage,
    String? errorMessage,
  }) {
    return ChatState(
      status: status ?? this.status,
      currentChat: currentChat ?? this.currentChat,
      chatHistory: chatHistory ?? this.chatHistory,
      isSendingMessage: isSendingMessage ?? this.isSendingMessage,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    currentChat,
    chatHistory,
    isSendingMessage,
    errorMessage,
  ];
}