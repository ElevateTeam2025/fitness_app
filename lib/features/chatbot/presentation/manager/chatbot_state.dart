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