
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/home/domain/use_case/home_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entity/meals_categories_entity.dart';

part 'get_meals_categories_states.dart';

@injectable
class GetHomeMealsCategoriesCubit extends Cubit<GetHomeMealsCategoriesStates> {

  GetHomeMealsCategoriesCubit( this.useCase): super(GetHomeMealsCategoriesInitialState());
  final HomeUseCase useCase;

  Future<void> getHomeMealsCategories() async {
    if(isClosed) {
      return;
    }    emit(GetHomeMealsCategoriesLoadingState());

    final  result = await useCase.getHomeMealsCategories();
    switch (result) {
      case Success():
        if(result.data != null)
        {
          if(isClosed) {
            return;
          }
          emit(GetHomeMealsCategoriesSuccessState(result.data!));

        }

        break;
      case Error():
        if(isClosed) {
          return;
        }        emit(
          GetHomeMealsCategoriesErrorState(message: result.exception.toString()),
        );
        break;
    }
  }
}

