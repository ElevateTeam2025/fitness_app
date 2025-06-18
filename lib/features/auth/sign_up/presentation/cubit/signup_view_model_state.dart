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
  final String? success;
  final bool isPasswordValid;
  final bool isEmailValid;
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
    this.success,
    this.isEmailValid = false,
    this.isPasswordValid = false,
  });


  bool get isBasicInfoValid =>
      firstName.trim().isNotEmpty &&
          lastName.trim().isNotEmpty;
  bool get isAllDataValid =>
      isBasicInfoValid &&
          gender.isNotEmpty &&
          age >= 13 && age <= 100 &&
          height >= 100 && height <= 250 &&
          weight >= 30 && weight <= 300 &&
          selectedGoal.isNotEmpty &&
          selectedActivity.isNotEmpty;

  bool get hasError => error != null;
  bool get canProceed => !isLoading && !hasError;
  bool get isIdle => !isLoading && !isSuccess && !hasError;

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
    String? success,
    bool? isEmailValid,
    bool? isPasswordValid,
  }) {
    return SignupState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      password: password ?? this.password,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      selectedGoal: selectedGoal ?? this.selectedGoal,
      selectedActivity: selectedActivity ?? this.selectedActivity,
      currentStep: currentStep ?? this.currentStep,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
      success: success,
    );
  }

  @override
  String toString() {
    return 'SignupState('
        'currentStep: $currentStep, '
        'isLoading: $isLoading, '
        'isSuccess: $isSuccess, '
        'error: $error, '
        'firstName: $firstName, '
        'lastName: $lastName, '
        'email: $email, '
        'gender: $gender, '
        'age: $age, '
        'height: $height, '
        'weight: $weight, '
        'selectedGoal: $selectedGoal, '
        'selectedActivity: $selectedActivity'
    'isEmailValid:$isEmailValid'
    'isPassWordValid:$isPasswordValid'
        ')';
  }
}
