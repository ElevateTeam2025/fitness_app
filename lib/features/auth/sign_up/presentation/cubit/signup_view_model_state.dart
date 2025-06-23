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

  // Individual field validation flags
  final bool isFirstNameValid;
  final bool isLastNameValid;
  final bool isEmailValid;
  final bool isPasswordValid;

  // Error messages for each field
  final String? firstNameError;
  final String? lastNameError;
  final String? emailError;
  final String? passwordError;

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
    this.isFirstNameValid = false,
    this.isLastNameValid = false,
    this.isEmailValid = false,
    this.isPasswordValid = false,
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.passwordError,
  });

  // Individual field validation getters
  bool get isBasicInfoValid =>
      isFirstNameValid &&
          isLastNameValid &&
          isEmailValid &&
          isPasswordValid;

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
    bool? isFirstNameValid,
    bool? isLastNameValid,
    bool? isEmailValid,
    bool? isPasswordValid,
    String? firstNameError,
    String? lastNameError,
    String? emailError,
    String? passwordError,
  }) {
    return SignupState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
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
      error: error,
      success: success,
      isFirstNameValid: isFirstNameValid ?? this.isFirstNameValid,
      isLastNameValid: isLastNameValid ?? this.isLastNameValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      firstNameError: firstNameError,
      lastNameError: lastNameError,
      emailError: emailError,
      passwordError: passwordError,
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
        'selectedActivity: $selectedActivity, '
        'isFirstNameValid: $isFirstNameValid, '
        'isLastNameValid: $isLastNameValid, '
        'isEmailValid: $isEmailValid, '
        'isPasswordValid: $isPasswordValid'
        ')';
  }
}