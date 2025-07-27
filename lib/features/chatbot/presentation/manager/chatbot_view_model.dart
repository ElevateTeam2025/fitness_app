import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/chatbot/data/model/chat_history_model.dart';
import 'package:fitness_app/features/chatbot/data/model/chatbot_response_model.dart';
import 'package:fitness_app/features/chatbot/domain/use_case/chatbot_use_case.dart';
import 'package:fitness_app/features/chatbot/presentation/manager/chatbot_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';

@injectable
class ChatbotViewModel extends Cubit<ChatbotState> {
  ChatbotViewModel(this._useCase) : super(SendMessageLoadingState());
  final ChatbotUseCase _useCase;
  final ValueNotifier<String> inputText = ValueNotifier<String>('');
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String? chatId;

  bool isShowChat = false;
  List<ChatbotResponseModel> messages = [];
  final TextEditingController textEditingController = TextEditingController();

  void doIntent(ChatbotIntent intent) {
    switch (intent) {
      case GetStartedClickedIntent():
        _changeScreen();
        break;
      case SendMessageIntent():
        _sendMessage();
        break;
      case CreateChatIntent():
        _createChat();
        break;
    }
  }

  final List<ChatHistoryModel> chatHistory = [];
  Future<void> getAllChats() async {
    final result = await _useCase.getAllChats();
    chatHistory.clear();
    chatHistory.addAll(
        result..sort((a, b) => b.createdAt.compareTo(a.createdAt))
    );
  }

  Future<void> _sendMessage() async {
    messages.add(
      ChatbotResponseModel(message: inputText.value.trim(), isUser: true),
    );
    messages.add(ChatbotResponseModel(isUser: false, isSkeleton: true));
    emit(ChangeScreenState());

    final result = await _useCase.sendMessage(
      inputText.value.trim(),
      chatId ?? "",
    );
    inputText.value = '';
    if (result is Success<String>) {
      final index = messages.indexWhere((m) => m.isSkeleton);
      if (index != -1) {
        messages[index] = ChatbotResponseModel(
          message: result.data,
          isUser: false,
        );
      }

      emit(SendMessageSuccessState([result.data!]));
    } else if (result is Error) {
      messages.removeWhere((m) => m.isSkeleton);
      emit(SendMessageErrorState(result.toString()));
    }
  }

  void _changeScreen() {
    isShowChat = true;
    _createChat();
    emit(ChangeScreenState());
    log(isShowChat.toString());
  }

  Future<String> _createChat() async {
    emit(CreateChatLoadingState());
    final result = await _useCase.createChat();
    messages.clear();
    switch (result) {
      case Success():
        var data = result.data;
        log("Chat id ${data!.id}");
        chatId = data.id.toString();
        emit(CreateChatSuccessState(data.id));
        return data.id;
      case Error():
        emit(CreateChatErrorState("Something went wrong"));
        return 'something went wrong';
    }
  }

  void loadChat(ChatHistoryModel chat) {
    final sortedMessages = List.of(chat.messages)
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
    messages = sortedMessages
        .map(
          (msg) =>
              ChatbotResponseModel(message: msg.content, isUser: msg.isUser),
        )
        .toList();
    isShowChat = true;
    emit(ChangeScreenState());
  }
}

sealed class ChatbotIntent {}

class GetStartedClickedIntent extends ChatbotIntent {}

class SendMessageIntent extends ChatbotIntent {}

class CreateChatIntent extends ChatbotIntent {}
