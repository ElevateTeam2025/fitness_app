import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/chatbot/data/model/chatbot_response_model.dart';
import 'package:fitness_app/features/chatbot/domain/use_case/chatbot_use_case.dart';
import 'package:fitness_app/features/chatbot/presentation/manager/chatbot_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';

@injectable
class ChatbotViewModel extends Cubit<ChatbotState> {
  ChatbotViewModel(this._useCase) : super(SendMessageLoadingState());
  final ChatbotUseCase _useCase;
  final ValueNotifier<String> inputText = ValueNotifier<String>('');
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isShowChat = false;
  List<ChatbotResponseModel> messages = [];
 final TextEditingController textEditingController=TextEditingController();
  void doIntent(ChatbotIntent intent) {
    switch (intent) {
      case GetStartedClickedIntent():
        _changeScreen();
        break;
      case SendMessageIntent():
        _sendMessage();
        break;
    }
  }

  Future<void> _sendMessage() async {
    emit(SendMessageLoadingState());
    final result = await _useCase.sendMessage(inputText.value.trim());
    messages.add(
      ChatbotResponseModel(message: inputText.value.trim(), isUser: true),
    );
    switch (result) {
      case Success():
        var data = result.data;
        messages.add(ChatbotResponseModel(message: data!, isUser: false));
        emit(SendMessageSuccessState([data]));
        break;
      case Error():
        emit(SendMessageErrorState(result.exception!));
        break;
    }
  }
  void _changeScreen(){
   isShowChat=true;
   emit(ChangeScreenState());
   log(isShowChat.toString());
  }
}

sealed class ChatbotIntent {}
class GetStartedClickedIntent extends ChatbotIntent {}
class SendMessageIntent extends ChatbotIntent {}
