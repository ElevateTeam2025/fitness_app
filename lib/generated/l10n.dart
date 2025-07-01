// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `No exercises available`
  String get noExercisesAvailable {
    return Intl.message(
      'No exercises available',
      name: 'noExercisesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Confirm Logout`
  String get confirmLogout {
    return Intl.message(
      'Confirm Logout',
      name: 'confirmLogout',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get security {
    return Intl.message('Security', name: 'security', desc: '', args: []);
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `No user Data`
  String get noUserData {
    return Intl.message('No user Data', name: 'noUserData', desc: '', args: []);
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create New Password`
  String get createNewPassword {
    return Intl.message(
      'Create New Password',
      name: 'createNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Make Sure Its 8 Characters Or More`
  String get sureCharacters {
    return Intl.message(
      'Make Sure Its 8 Characters Or More',
      name: 'sureCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Please enter email`
  String get pleaseEnterEmail {
    return Intl.message(
      'Please enter email',
      name: 'pleaseEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email`
  String get pleaseEnterValidEmail {
    return Intl.message(
      'Please enter valid email',
      name: 'pleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Send OTP`
  String get sendOTP {
    return Intl.message('Send OTP', name: 'sendOTP', desc: '', args: []);
  }

  /// `Enter Your Email`
  String get enterYourEmail {
    return Intl.message(
      'Enter Your Email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter 6 digit code`
  String get pleaseEnter6DigitCode {
    return Intl.message(
      'Please enter 6 digit code',
      name: 'pleaseEnter6DigitCode',
      desc: '',
      args: [],
    );
  }

  /// `didnt receive verification code?`
  String get didNotReceiveVerificationCode {
    return Intl.message(
      'didnt receive verification code?',
      name: 'didNotReceiveVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `code sent successfully to your email`
  String get codeSentSuccessfullyToYourEmail {
    return Intl.message(
      'code sent successfully to your email',
      name: 'codeSentSuccessfullyToYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `ResendCode?`
  String get resendCode {
    return Intl.message('ResendCode?', name: 'resendCode', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `OTP CODE`
  String get otpCode {
    return Intl.message('OTP CODE', name: 'otpCode', desc: '', args: []);
  }

  /// `Enter Your OTP Check Your Email`
  String get enterYourOTPCheckYourEmail {
    return Intl.message(
      'Enter Your OTP Check Your Email',
      name: 'enterYourOTPCheckYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get forgetPassword {
    return Intl.message(
      'Forget password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account yet ? `
  String get DoNotHaveAccountYet {
    return Intl.message(
      'Don\'t have an account yet ? ',
      name: 'DoNotHaveAccountYet',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Hey There`
  String get heyThere {
    return Intl.message('Hey There', name: 'heyThere', desc: '', args: []);
  }

  /// `WELCOME BACK`
  String get welcomeBack {
    return Intl.message(
      'WELCOME BACK',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Success Login _>`
  String get successLogin {
    return Intl.message(
      'Success Login _>',
      name: 'successLogin',
      desc: '',
      args: [],
    );
  }

  /// `CREATE AN ACCOUNT`
  String get createAccount {
    return Intl.message(
      'CREATE AN ACCOUNT',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Already Have an account ?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already Have an account ?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `TELL US ABOUT YOURSELF`
  String get tellAboutYourself {
    return Intl.message(
      'TELL US ABOUT YOURSELF',
      name: 'tellAboutYourself',
      desc: '',
      args: [],
    );
  }

  /// `We need to know your gender`
  String get needKnowYourGender {
    return Intl.message(
      'We need to know your gender',
      name: 'needKnowYourGender',
      desc: '',
      args: [],
    );
  }

  /// `female`
  String get female {
    return Intl.message('female', name: 'female', desc: '', args: []);
  }

  /// `male`
  String get male {
    return Intl.message('male', name: 'male', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `HOW OLD ARE YOU ?`
  String get howOldAreYou {
    return Intl.message(
      'HOW OLD ARE YOU ?',
      name: 'howOldAreYou',
      desc: '',
      args: [],
    );
  }

  /// `This Helps Us Create Your Personalized Plan`
  String get helpsCreatePersonalizedPlan {
    return Intl.message(
      'This Helps Us Create Your Personalized Plan',
      name: 'helpsCreatePersonalizedPlan',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message('Age', name: 'age', desc: '', args: []);
  }

  /// `WHAT IS YOUR HEIGHT ?`
  String get whatYourHeight {
    return Intl.message(
      'WHAT IS YOUR HEIGHT ?',
      name: 'whatYourHeight',
      desc: '',
      args: [],
    );
  }

  /// `WHAT IS YOU WEIGHT ?`
  String get whatYourWeight {
    return Intl.message(
      'WHAT IS YOU WEIGHT ?',
      name: 'whatYourWeight',
      desc: '',
      args: [],
    );
  }

  /// `WHAT IS YOUR GOAL?`
  String get whatYourGoal {
    return Intl.message(
      'WHAT IS YOUR GOAL?',
      name: 'whatYourGoal',
      desc: '',
      args: [],
    );
  }

  /// `CM`
  String get cm {
    return Intl.message('CM', name: 'cm', desc: '', args: []);
  }

  /// `Kg`
  String get kg {
    return Intl.message('Kg', name: 'kg', desc: '', args: []);
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Workouts`
  String get workouts {
    return Intl.message('Workouts', name: 'workouts', desc: '', args: []);
  }

  /// `Muscle not found`
  String get muscleNotFound {
    return Intl.message(
      'Muscle not found',
      name: 'muscleNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Food Recommendation`
  String get foodRecommendation {
    return Intl.message(
      'Food Recommendation',
      name: 'foodRecommendation',
      desc: '',
      args: [],
    );
  }

  /// `100 k`
  String get hondredK {
    return Intl.message('100 k', name: 'hondredK', desc: '', args: []);
  }

  /// `Energy`
  String get energy {
    return Intl.message('Energy', name: 'energy', desc: '', args: []);
  }

  /// `Ingredients`
  String get ingredients {
    return Intl.message('Ingredients', name: 'ingredients', desc: '', args: []);
  }

  /// `Recommendation`
  String get recommendation {
    return Intl.message(
      'Recommendation',
      name: 'recommendation',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get hi {
    return Intl.message('Hi', name: 'hi', desc: '', args: []);
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Recommendation to day`
  String get recommendationToDay {
    return Intl.message(
      'Recommendation to day',
      name: 'recommendationToDay',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Workouts`
  String get upcomingWorkouts {
    return Intl.message(
      'Upcoming Workouts',
      name: 'upcomingWorkouts',
      desc: '',
      args: [],
    );
  }

  /// `view all`
  String get viewAll {
    return Intl.message('view all', name: 'viewAll', desc: '', args: []);
  }

  /// `Recommendation For You`
  String get recommendationForYou {
    return Intl.message(
      'Recommendation For You',
      name: 'recommendationForYou',
      desc: '',
      args: [],
    );
  }

  /// `Let’s start your day`
  String get LetStartDay {
    return Intl.message(
      'Let’s start your day',
      name: 'LetStartDay',
      desc: '',
      args: [],
    );
  }

  /// `YOUR REGULAR PHYSICAL ACTIVITY LEVEL`
  String get yourRegularPhysicalActivityLevel {
    return Intl.message(
      'YOUR REGULAR PHYSICAL ACTIVITY LEVEL',
      name: 'yourRegularPhysicalActivityLevel',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Gain weight`
  String get goalGainWeight {
    return Intl.message(
      'Gain weight',
      name: 'goalGainWeight',
      desc: '',
      args: [],
    );
  }

  /// `Lose weight`
  String get goalLoseWeight {
    return Intl.message(
      'Lose weight',
      name: 'goalLoseWeight',
      desc: '',
      args: [],
    );
  }

  /// `Get fitter`
  String get goalGetFitter {
    return Intl.message(
      'Get fitter',
      name: 'goalGetFitter',
      desc: '',
      args: [],
    );
  }

  /// `Gain more flexible`
  String get goalGainFlexible {
    return Intl.message(
      'Gain more flexible',
      name: 'goalGainFlexible',
      desc: '',
      args: [],
    );
  }

  /// `Learn the basics`
  String get goalLearnBasic {
    return Intl.message(
      'Learn the basics',
      name: 'goalLearnBasic',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Chat`
  String get chat {
    return Intl.message('Chat', name: 'chat', desc: '', args: []);
  }

  /// `Workout`
  String get workout {
    return Intl.message('Workout', name: 'workout', desc: '', args: []);
  }

  /// `Please enter an email`
  String get enterEmail {
    return Intl.message(
      'Please enter an email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password`
  String get enterPassword {
    return Intl.message(
      'Please enter a password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password should be at least 8 characters long`
  String get invalidPasswordLength {
    return Intl.message(
      'Password should be at least 8 characters long',
      name: 'invalidPasswordLength',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain uppercase, lowercase, and number`
  String get invalidPasswordPattern {
    return Intl.message(
      'Password must contain uppercase, lowercase, and number',
      name: 'invalidPasswordPattern',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your first name`
  String get enterFirstName {
    return Intl.message(
      'Please enter your first name',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid first name`
  String get invalidFirstName {
    return Intl.message(
      'Please enter a valid first name',
      name: 'invalidFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get enterLastName {
    return Intl.message(
      'Please enter your last name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid last name`
  String get invalidLastName {
    return Intl.message(
      'Please enter a valid last name',
      name: 'invalidLastName',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get requiredField {
    return Intl.message(
      'This field is required',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid username`
  String get invalidUserName {
    return Intl.message(
      'Please enter a valid username',
      name: 'invalidUserName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a mobile number`
  String get enterMobileNumber {
    return Intl.message(
      'Please enter a mobile number',
      name: 'enterMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid mobile number (e.g., +201010700999)`
  String get invalidMobileNumber {
    return Intl.message(
      'Enter a valid mobile number (e.g., +201010700999)',
      name: 'invalidMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phoneRequired {
    return Intl.message(
      'Phone number is required',
      name: 'phoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Enter a valid phone number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
