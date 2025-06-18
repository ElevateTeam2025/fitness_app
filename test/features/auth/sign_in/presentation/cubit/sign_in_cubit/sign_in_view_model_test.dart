import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/features/auth/sign_in/domain/entity/sign_in_entity.dart';
import 'package:fitness_app/features/auth/sign_in/domain/entity/sign_in_request.dart';
import 'package:fitness_app/features/auth/sign_in/domain/use_case/sign_in_use_case.dart';
import 'package:fitness_app/features/auth/sign_in/presentation/cubit/sign_in_cubit/sign_in_state.dart';
import 'package:fitness_app/features/auth/sign_in/presentation/cubit/sign_in_cubit/sign_in_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/common/result.dart';

import 'sign_in_view_model_test.mocks.dart';

@GenerateMocks([SignInUseCase])
void main() {
  late MockSignInUseCase mockSignInUseCase;
  late SignInViewModel viewModel;

  final request = SignInRequest(email: 'test@example.com', password: 'Test#123');
  final entity = SignInEntity(
    message: 'success',
    token: 'fatenabc123',
    user: UserInfo(
      id: '1',
      firstName: 'Test',
      lastName: 'User',
      email: 'test@example.com',
    ),
  );

  provideDummy<Result<SignInEntity>>(Success(entity));

  setUp(() {
    mockSignInUseCase = MockSignInUseCase();
    viewModel = SignInViewModel(mockSignInUseCase);
  });

  tearDown(() => viewModel.close());

  group('SignInViewModel', () {
    blocTest<SignInViewModel, SignInState>(
      'emits [LoadingSignInState, SuccessSignInState] when signIn succeeds',
      build: () {
        when(mockSignInUseCase.execute(request)).thenAnswer((_) async => Success(entity));
        return viewModel;
      },
      act: (vm) => vm.doIntent(SignInClickedIntent(request)),
      expect: () => [
        isA<LoadingSignInState>(),
        isA<SuccessSignInState>().having((s) => s.data.token, 'token', 'fatenabc123'),
      ],
    );

    blocTest<SignInViewModel, SignInState>(
      'emits [LoadingSignInState, ErrorSignInState] when signIn fails',
      build: () {
        when(mockSignInUseCase.execute(request)).thenAnswer((_) async => Error<SignInEntity>('Wrong password'));
        return viewModel;
      },
      act: (vm) => vm.doIntent(SignInClickedIntent(request)),
      expect: () => [
        isA<LoadingSignInState>(),
        isA<ErrorSignInState>().having((s) => s.message, 'message', 'Wrong password'),
      ],
    );
  });
}
