import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/core/failures/failure.dart';
import 'package:flutter_ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_ecommerce/features/auth/domain/usecases/check_auth_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authenticate_user_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthRepository>()])
void main() {
  late CheckAuthUser useCase;
  late MockAuthRepository mockRepository;
  late CheckAuthUserParams checkAuthUserParams;
  setUp(() {
    mockRepository = MockAuthRepository();
    checkAuthUserParams = CheckAuthUserParams();
    useCase = CheckAuthUser(repository: mockRepository);
  });

  group('CheckAuthUser', () {
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
