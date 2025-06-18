import 'dart:developer';

import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/sign_up/domain/use_case/signup_use_case.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entity/signup_request_entity.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.useCase) : super(SignupState());

  final SignupUseCase useCase;


  void updateFirstName(String firstName) {
    emit(state.copyWith(firstName: firstName));
  }

  void updateLastName(String lastName) {
    emit(state.copyWith(lastName: lastName));
  }

  void updateEmail(String email) {
    state.toString();
    emit(state.copyWith(email: email));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void selectGender(String gender) {
    emit(state.copyWith(gender: gender));
  }

  void selectAge(int age) {
    emit(state.copyWith(age: age));
  }

  void selectHeight(int height) {
    emit(state.copyWith(height: height));
  }

  void selectWeight(int weight) {
    emit(state.copyWith(weight: weight));
  }

  void selectGoal(String goal) {
    emit(state.copyWith(selectedGoal: goal));
  }

  void selectActivity(String activity) {
    emit(state.copyWith(selectedActivity: activity));
  }



  void nextStep() {
    print("All Data");
    print(state.firstName);
    print(state.lastName);
    print(state.gender);
    print(state.age);
    print(state.height);
    print(state.weight);

    if (state.currentStep < 6) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  bool _isAllDataValid() {
    return state.isBasicInfoValid &&
        state.gender.isNotEmpty &&
        state.age >= 13 &&
        state.age <= 100 &&
        state.height >= 100 &&
        state.height <= 250 &&
        state.weight >= 30 &&
        state.weight <= 300 &&
        state.selectedGoal.isNotEmpty &&
        state.selectedActivity.isNotEmpty;
  }





  Future<void> subimt() async {
    if (!_isAllDataValid()) {
      emit(state.copyWith(error: 'Please complete all required fields'));
      return;
    }
    emit(state.copyWith(isLoading: true, error: null, isSuccess: false));

    final Result result = await useCase.call(
      SignupRequestEntity(
        firstName: state.firstName,
        lastName: state.lastName,
        email: state.email,
        password: state.password,
        rePassword: state.password,
        gender: state.gender,
        height: state.height,
        weight: state.weight,
        age: state.age,
        goal: state.selectedGoal,
        activityLevel: state.selectedActivity,
      ),
    );
    switch (result) {
      case Success():
        log("SignUp Complete Successfully ");

        emit(state.copyWith(isLoading: false, isSuccess: true, error: null,success: "Success"));

      case Error():
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: false,
            error: result.exception.toString(),
          ),
        );
    }
  }
}
