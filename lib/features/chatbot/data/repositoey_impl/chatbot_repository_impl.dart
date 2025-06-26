import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/chatbot/data/data_source/chatbot_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/chatbot_repository.dart';
@Injectable(as: ChatbotRepository)
class ChatbotRepositoryImpl implements ChatbotRepository{
  final ChatbotRemoteDataSource _dataSource;

  ChatbotRepositoryImpl(this._dataSource);
  @override
  Future<Result<String>> sendMessage(String message) {
    var result = _dataSource.sendMessage(message);
    return result;
  }
}