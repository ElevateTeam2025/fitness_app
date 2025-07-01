import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/entity/chat_history_entity.dart';
import '../../../domain/entity/message_entity.dart';
import '../../../domain/use_case/chat_use_case/chat_use_case.dart';
import 'chat_event.dart';
import 'chat_state.dart';



@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatUseCase useCase;

  ChatBloc({required this.useCase}) : super(const ChatState()) {
    on<SendMessageEvent>(_onSendMessage);
    on<LoadAllChatsEvent>(_onLoadAllChats);
    on<LoadChatMessagesEvent>(_onLoadChatMessages);
    on<NewChatEvent>(_onNewChat);
    on<ClearAllChatsEvent>(_onClearAllChats);
  }

  Future<void> _onSendMessage(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    if (event.message.trim().isEmpty) return;

    emit(state.copyWith(isSendingMessage: true, errorMessage: null));

    try {
      final userMessage = MessageEntity(
        id: const Uuid().v4(),
        content: event.message.trim(),
        role: 'user',
        timestamp: DateTime.now(),
      );

      final updatedChat = ChatHistoryEntity(
        id: event.currentChat.id,
        title: event.currentChat.title,
        messages: List.from(event.currentChat.messages)..add(userMessage),
        createdAt: event.currentChat.createdAt,
      );

      if(event.currentChat.messages.isEmpty){
        await useCase.saveChat(updatedChat);
      }
      emit(state.copyWith(currentChat: updatedChat));

      final geminiResponse = await useCase.sendMessage(updatedChat, event.message.trim());


      // add gemini response to chat
      final finalChat = ChatHistoryEntity(
        id: updatedChat.id,
        title: updatedChat.title,
        messages: List.from(updatedChat.messages)..add(geminiResponse),
        createdAt: updatedChat.createdAt,
      );

      await useCase.saveChat(finalChat);

      emit(state.copyWith(
        currentChat: finalChat,
        isSendingMessage: false,
      ));

      // Update chat history
      add(LoadAllChatsEvent());
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to send message: ${e.toString()}',
        isSendingMessage: false,
      ));
    }
  }

  Future<void> _onLoadAllChats(
      LoadAllChatsEvent event, Emitter<ChatState> emit) async {
    try {
      final chats = await useCase.getAllChats();
      emit(state.copyWith(
        chatHistory: chats,
        status: ChatStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to load chat history: ${e.toString()}',
        status: ChatStatus.error,
      ));
    }
  }

  Future<void> _onLoadChatMessages(
      LoadChatMessagesEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(status: ChatStatus.loading, errorMessage: null));
    try {
      final chat = await useCase.getChatById(event.chatId);

      emit(state.copyWith(
        currentChat: chat,
        status: ChatStatus.loaded,
      ));
    } catch (e) {

      emit(state.copyWith(
        errorMessage: 'Failed to load chat: ${e.toString()}',
        status: ChatStatus.error,
      ));
    }
  }

  Future<void> _onNewChat(NewChatEvent event, Emitter<ChatState> emit) async {
    try {
      final newChat = ChatHistoryEntity.create();
      emit(state.copyWith(
        currentChat: newChat,
        status: ChatStatus.loaded,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to create new chat: ${e.toString()}',
        status: ChatStatus.error,
      ));
    }
  }
  Future<void> _onClearAllChats(
      ClearAllChatsEvent event, Emitter<ChatState> emit) async {
    try {
      await useCase.clearChats();
      final newChat = ChatHistoryEntity.create();
      emit(state.copyWith(
        chatHistory: [],
        currentChat: newChat,
        status: ChatStatus.loaded,
        errorMessage: null
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to clear chat history: $e',
      ));
    }
  }
}