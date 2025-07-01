sealed class ChatbotState {}
class ChatbotLoadingState extends ChatbotState {}
class ChatbotErrorState extends ChatbotState {
  final String message;
  ChatbotErrorState(this.message);
}
class ChatbotSuccessState extends ChatbotState {
  final String message;
  ChatbotSuccessState(this.message);
}