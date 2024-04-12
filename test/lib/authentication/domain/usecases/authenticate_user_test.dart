import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/core/failures/failure.dart';
import 'package:flutter_ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_ecommerce/features/auth/domain/usecases/authenticate_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthenticationRepository extends Mock implements AuthRepository {}

void main() {
  late AuthenticateUser useCase;
  late MockAuthenticationRepository mockRepository;
  late AuthenticateUserParams authenticateUserParams;
  setUp(() {
    mockRepository = MockAuthenticationRepository();
    authenticateUserParams = AuthenticateUserParams();
    useCase = AuthenticateUser(repository: mockRepository);
  });

  group('AuthenticateUser with token', () {
    test('should call the authenticateUser method in the repository', () async {
      when(mockRepository.authenticateUser())
          .thenAnswer((_) async => const Right(null));

      final result = await useCase(authenticateUserParams);

      expect(result, const Right(null));
      verify(mockRepository.authenticateUser());
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a failure when repository call fails', () async {
      final failure = Failure();
      when(mockRepository.authenticateUser())
          .thenAnswer((_) async => Left(failure));

      final result = await useCase(authenticateUserParams);

      expect(result, Left(failure));
      verify(mockRepository.authenticateUser());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
