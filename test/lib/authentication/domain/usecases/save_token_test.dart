import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/core/failures/failure.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';
import 'package:flutter_ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_ecommerce/features/auth/domain/usecases/check_auth_user.dart';
import 'package:flutter_ecommerce/features/auth/domain/usecases/save_token.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authenticate_user_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthRepository>()])
void main() {
  late SaveToken useCase;
  late MockAuthRepository mockRepository;
  late SaveTokenParams caseParams;
  late Token token;
  setUp(() {
    token = const Token(accessToken: 'example');
    mockRepository = MockAuthRepository();
    caseParams = SaveTokenParams(token: token);
    useCase = SaveToken(repository: mockRepository);
  });

  group('SaveToken', () {
    test('should call the SaveToken method in the repository', () async {
      when(mockRepository.saveToken(token))
          .thenAnswer((_) async => const Right(null));

      final result = await useCase(caseParams);

      expect(result, const Right(null));
      verify(mockRepository.saveToken(token));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a failure when repository call fails', () async {
      final failure = Failure();
      when(mockRepository.saveToken(token))
          .thenAnswer((_) async => Left(failure));

      final result = await useCase(caseParams);

      expect(result, Left(failure));
      verify(mockRepository.saveToken(token));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
