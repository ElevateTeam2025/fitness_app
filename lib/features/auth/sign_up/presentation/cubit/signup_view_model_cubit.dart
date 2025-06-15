import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState());

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void selectGender(String gender) {
    emit(state.copyWith(gender: gender));
  }

  void selectAge(int age) {
    emit(state.copyWith(age: age));
  }

  void selectHeight(double height) {
    emit(state.copyWith(height: height));
  }

  void selectWeight(double weight) {
    emit(state.copyWith(weight: weight));
  }

  void selectOption(String goal) {
    emit(state.copyWith(selectedGoal: goal));
  }

  void selectActivity(String activity) {
    emit(state.copyWith(selectedActivity: activity));
  }

  void nextStep() {
    if (state.currentStep < 6) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void previousStep(){
    if(state.currentStep>0)
      {
        emit(state.copyWith(currentStep: state.currentStep-1));
      }
  }

  Future<void> submit() async {

  }
}