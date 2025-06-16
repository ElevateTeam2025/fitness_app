import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState());

  void updateFirstName(String firstName) {
    emit(state.copyWith(firstName: firstName));
  }
  void updateLastName(String lastName) {
    emit(state.copyWith(lastName: lastName));
  }
  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String password){
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

  void previousStep(){
    if(state.currentStep>0)
      {
        emit(state.copyWith(currentStep: state.currentStep-1));
      }
  }

  Future<void> submit() async {

  }
}