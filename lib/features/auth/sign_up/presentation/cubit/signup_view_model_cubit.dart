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

  // Validation helper methods
  bool _validateFirstName(String firstName) {
    return firstName.trim().isNotEmpty && firstName.trim().length >= 2;
  }

  String? _getFirstNameError(String firstName) {
    if (firstName.trim().isEmpty) {
      return 'First name is required';
    }
    if (firstName.trim().length < 2) {
      return 'First name must be at least 2 characters';
    }
    return null;
  }

  bool _validateLastName(String lastName) {
    return lastName.trim().isNotEmpty && lastName.trim().length >= 2;
  }

  String? _getLastNameError(String lastName) {
    if (lastName.trim().isEmpty) {
      return 'Last name is required';
    }
    if (lastName.trim().length < 2) {
      return 'Last name must be at least 2 characters';
    }
    return null;
  }

  bool _validateEmail(String email) {
    if (email.trim().isEmpty) return false;
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email.trim());
  }

  String? _getEmailError(String email) {
    if (email.trim().isEmpty) {
      return 'Email is required';
    }
    if (!_validateEmail(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  bool _validatePassword(String password) {
    return password.isNotEmpty && password.length >= 6;
  }

  String? _getPasswordError(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void updateFirstName(String firstName) {
    final isValid = _validateFirstName(firstName);
    final error = _getFirstNameError(firstName);

    emit(state.copyWith(
      firstName: firstName,
      isFirstNameValid: isValid,
      firstNameError: error,
    ));
  }

  void updateLastName(String lastName) {
    final isValid = _validateLastName(lastName);
    final error = _getLastNameError(lastName);

    emit(state.copyWith(
      lastName: lastName,
      isLastNameValid: isValid,
      lastNameError: error,
    ));
  }

  void updateEmail(String email) {
    final isValid = _validateEmail(email);
    final error = _getEmailError(email);

    emit(state.copyWith(
      email: email,
      isEmailValid: isValid,
      emailError: error,
    ));
  }

  void updatePassword(String password) {
    final isValid = _validatePassword(password);
    final error = _getPasswordError(password);

    emit(state.copyWith(
      password: password,
      isPasswordValid: isValid,
      passwordError: error,
    ));
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
        emit(state.copyWith(isLoading: false, isSuccess: true, error: null, success: "Success"));

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