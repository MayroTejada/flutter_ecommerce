import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/core/failures/failure.dart';
import 'package:flutter_ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_ecommerce/features/auth/domain/usecases/check_auth_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthenticationRepository extends Mock implements AuthRepository {}

void main() {
  late CheckAuthUser useCase;
  late MockAuthenticationRepository mockRepository;
  late CheckAuthUserParams checkAuthUserParams;
  setUp(() {
    mockRepository = MockAuthenticationRepository();
    checkAuthUserParams = CheckAuthUserParams();
    useCase = CheckAuthUser(repository: mockRepository);
  });

  group('CheckAuthUser with token', () {
    test('should call the CheckAuthUser method in the repository', () async {
      when(mockRepository.checkAuthUser())
          .thenAnswer((_) async => const Right(null));

      final result = await useCase(checkAuthUserParams);

      expect(result, const Right(null));
      verify(mockRepository.checkAuthUser());
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a failure when repository call fails', () async {
      final failure = Failure();
      when(mockRepository.checkAuthUser())
          .thenAnswer((_) async => Left(failure));

      final result = await useCase(checkAuthUserParams);

      expect(result, Left(failure));
      verify(mockRepository.checkAuthUser());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
