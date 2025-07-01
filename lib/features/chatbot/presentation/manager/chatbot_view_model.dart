import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/chatbot/domain/use_case/chatbot_use_case.dart';
import 'package:fitness_app/features/chatbot/presentation/manager/chatbot_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';
@injectable
class ChatbotViewModel extends Cubit<ChatbotState> {
  ChatbotViewModel(this._useCase) : super( ChatbotLoadingState());
  final ChatbotUseCase _useCase;

  Future<void> sendMessage(String message) async {
    emit(ChatbotLoadingState());
    final result = await _useCase.sendMessage(message);
    switch (result) {
      case Success():
        var data = result.data;
        emit(ChatbotSuccessState(data!));
        break;
      case Error():
        emit(ChatbotErrorState(result.exception!));
        break;
    }
  }
}