class SignupState {
  final String name;
  final String email;
  final String gender;
  final int age;
  final double height;
  final double weight;
  final String selectedGoal;
  final String selectedActivity;
  final int currentStep;
  final bool isLoading;
  final bool isSuccess;
  final String? error;

  SignupState({
    this.name = '',
    this.email = '',
    this.gender = '',
    this.age = 18,
    this.height = 150.0,
    this.weight = 50.0,
    this.selectedGoal = '',
    this.selectedActivity = '',
    this.currentStep = 0,
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
  });

  SignupState copyWith({
    String? name,
    String? email,
    String? gender,
    int? age,
    double? height,
    double? weight,
    String? selectedGoal,
    String? selectedActivity,
    int? currentStep,
    bool? isLoading,
    bool? isSuccess,
    String? error,
  }) {
    return SignupState(
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      selectedGoal: selectedGoal ?? this.selectedGoal,
      selectedActivity: selectedActivity ?? this.selectedActivity,
      currentStep: currentStep ?? this.currentStep,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }
}