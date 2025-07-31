sealed class ChatbotState {}
class SendMessageLoadingState extends ChatbotState {}
class SendMessageErrorState extends ChatbotState {
  final String message;
  SendMessageErrorState(this.message);
}
class SendMessageSuccessState extends ChatbotState {
  final List<String> message;
  SendMessageSuccessState(this.message);
}
class ChangeScreenState extends ChatbotState {}
class CreateChatSuccessState extends ChatbotState{
  final String chatId;
  CreateChatSuccessState(this.chatId);
}
class CreateChatErrorState extends ChatbotState{
  final String message;
  CreateChatErrorState(this.message);
}
class CreateChatLoadingState extends ChatbotState{}