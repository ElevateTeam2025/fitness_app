import 'package:fitness_app/features/auth/sign_in/domain/entity/sign_in_entity.dart';
import 'package:fitness_app/features/auth/sign_in/domain/entity/sign_in_request.dart';
import 'package:fitness_app/features/auth/sign_in/domain/repository/auth_repository.dart';
import 'package:fitness_app/features/auth/sign_in/domain/use_case/sign_in_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/common/result.dart';

import 'sign_in_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late SignInUseCase useCase;
  late AuthRepository repo;

  setUp(() {
    repo = MockAuthRepository();
    useCase = SignInUseCase(repo);
  });

  group('SignInUseCase test', () {
    final request = SignInRequest(email: 'faten@example.com', password: 'Faten123#');

    test('should call signIn from repository and return Success', () async {
      final expected = Success<SignInEntity>(SignInEntity(token: 'FatenToken', message: 'success'));
      provideDummy<Result<SignInEntity>>(expected);

      when(repo.signIn(request)).thenAnswer((_) async => expected);

      final result = await useCase.execute(request);

      verify(repo.signIn(request)).called(1);
      expect(result, equals(expected));
    });

    test('should return Error when repository fails', () async {
      final error = Error<SignInEntity>('Invalid credentials');
      provideDummy<Result<SignInEntity>>(error);

      when(repo.signIn(request)).thenAnswer((_) async => error);

      final result = await useCase.execute(request);

      verify(repo.signIn(request)).called(1);
      expect(result, equals(error));
    });
  });
}
