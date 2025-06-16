class SignupState {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String gender;
  int age;
  int height;
  int weight;
  final String selectedGoal;
  final String selectedActivity;
  final int currentStep;
  final bool isLoading;
  final bool isSuccess;
  final String? error;

  SignupState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.gender = '',
    this.age = 18,
    this.height = 150,
    this.weight = 50,
    this.selectedGoal = '',
    this.selectedActivity = '',
    this.currentStep = 0,
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
  });
  bool get isBasicInfoValid =>
      firstName.trim().isNotEmpty &&
          lastName.trim().isNotEmpty &&
          email.contains(RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")) &&
          password.length >= 6;



  SignupState copyWith({
    String? firstName,
    String? lastName,
    String? password,
    String? email,
    String? gender,
    int? age,
    int? height,
    int? weight,
    String? selectedGoal,
    String? selectedActivity,
    int? currentStep,
    bool? isLoading,
    bool? isSuccess,
    String? error,

  }) {
    return SignupState(
      firstName: firstName   ?? this.firstName,
      lastName: lastName   ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
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