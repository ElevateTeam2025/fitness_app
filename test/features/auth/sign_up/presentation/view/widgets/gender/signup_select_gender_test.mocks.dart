// Mocks generated by Mockito 5.4.5 from annotations
// in fitness_app/test/features/auth/sign_up/presentation/view/widgets/gender/signup_select_gender_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:fitness_app/features/auth/sign_up/domain/use_case/signup_use_case.dart'
    as _i2;
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_cubit.dart'
    as _i4;
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart'
    as _i3;
import 'package:flutter_bloc/flutter_bloc.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSignupUseCase_0 extends _i1.SmartFake implements _i2.SignupUseCase {
  _FakeSignupUseCase_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSignupState_1 extends _i1.SmartFake implements _i3.SignupState {
  _FakeSignupState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SignupCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignupCubit extends _i1.Mock implements _i4.SignupCubit {
  MockSignupCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SignupUseCase get useCase => (super.noSuchMethod(
        Invocation.getter(#useCase),
        returnValue: _FakeSignupUseCase_0(
          this,
          Invocation.getter(#useCase),
        ),
      ) as _i2.SignupUseCase);

  @override
  _i3.SignupState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeSignupState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.SignupState);

  @override
  _i5.Stream<_i3.SignupState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i5.Stream<_i3.SignupState>.empty(),
      ) as _i5.Stream<_i3.SignupState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void updateFirstName(String? firstName) => super.noSuchMethod(
        Invocation.method(
          #updateFirstName,
          [firstName],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void updateLastName(String? lastName) => super.noSuchMethod(
        Invocation.method(
          #updateLastName,
          [lastName],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void updateEmail(String? email) => super.noSuchMethod(
        Invocation.method(
          #updateEmail,
          [email],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void updatePassword(String? password) => super.noSuchMethod(
        Invocation.method(
          #updatePassword,
          [password],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void selectGender(String? gender) => super.noSuchMethod(
        Invocation.method(
          #selectGender,
          [gender],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void selectAge(int? age) => super.noSuchMethod(
        Invocation.method(
          #selectAge,
          [age],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void selectHeight(int? height) => super.noSuchMethod(
        Invocation.method(
          #selectHeight,
          [height],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void selectWeight(int? weight) => super.noSuchMethod(
        Invocation.method(
          #selectWeight,
          [weight],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void selectGoal(String? goal) => super.noSuchMethod(
        Invocation.method(
          #selectGoal,
          [goal],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void selectActivity(String? activity) => super.noSuchMethod(
        Invocation.method(
          #selectActivity,
          [activity],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void nextStep() => super.noSuchMethod(
        Invocation.method(
          #nextStep,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void previousStep() => super.noSuchMethod(
        Invocation.method(
          #previousStep,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<void> subimt() => (super.noSuchMethod(
        Invocation.method(
          #subimt,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  void emit(_i3.SignupState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i6.Change<_i3.SignupState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}
