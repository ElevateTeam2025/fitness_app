import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/meal_details/domain/use_case/get_meal_details_use_case.dart';
import 'package:fitness_app/features/meal_details/presentation/cubits/get_meal_details_cubit/get_meal_details_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMealDetailsCubit extends Cubit<GetMealDetailsStates> {
  final GetMealDetailsUseCase _getMealDetailsUseCase;
  GetMealDetailsCubit(this._getMealDetailsUseCase)
    : super(GetMealDetailsInitialState());

  doIntents(GetMealDetailsIntent intent, {required String mealId}) async {
    switch (intent) {
      case OnClickGetMealDetailsIntent():
        await _getMealDetails(mealId);
        break;
    }
  }

  Future<void> _getMealDetails(String id) async {
    emit(GetMealDetailsInitialState());
    final result = await _getMealDetailsUseCase.execute(id);
    switch (result) {
      case Success():
        final data = result.data?.meals ?? [];
        emit(GetMealDetailsSuccessState(data[0]));
        break;
      case Error():
        emit(
          GetMealDetailsErrorState(
            message: result.exception ?? 'An error occurred',
          ),
        );
        break;
    }
  }
}

sealed class GetMealDetailsIntent {}

class OnClickGetMealDetailsIntent extends GetMealDetailsIntent {}
