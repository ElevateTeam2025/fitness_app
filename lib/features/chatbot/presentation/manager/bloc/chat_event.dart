import 'package:equatable/equatable.dart';

import '../../../domain/entity/chat_history_entity.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends ChatEvent {
  final ChatHistoryEntity currentChat;
  final String message;

  const SendMessageEvent(this.currentChat, this.message);

  @override
  List<Object> get props => [currentChat, message];
}

class LoadAllChatsEvent extends ChatEvent {}

class LoadChatMessagesEvent extends ChatEvent {
  final String chatId;

  const LoadChatMessagesEvent(this.chatId);

  @override
  List<Object> get props => [chatId];
}

class NewChatEvent extends ChatEvent {}


class ClearAllChatsEvent extends ChatEvent {}