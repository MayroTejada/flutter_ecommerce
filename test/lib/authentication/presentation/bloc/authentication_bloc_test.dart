import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/core/failures/failure.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';
import 'package:flutter_ecommerce/features/auth/domain/usecases/check_auth_user.dart';
import 'package:flutter_ecommerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'authentication_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CheckAuthUser>()])
void main() async {
  late CheckAuthUser mockAuthenticateUser;
  late AuthBloc authBloc;
  late CheckAuthUserParams checkAuthUserParams;

  setUp(() {
    checkAuthUserParams = CheckAuthUserParams();
    mockAuthenticateUser = MockCheckAuthUser();
    authBloc = AuthBloc(checkAuthUser: mockAuthenticateUser);
  });

  tearDown(() {
    authBloc.close();
  });

  group('AuthenticationBloc', () {
    const token = Token(accessToken: 'test_token');

    test('initial state should be AuthenticationState', () {
      expect(
          authBloc.state,
          isA<AuthState>().having(
              (state) => state.authStateEnum, 'enum', AuthStateEnum.initial));
    });
  });
  group('CheckAuthUserEvent', () {
    blocTest<AuthBloc, AuthState>(
      'stateEnum should be success when return Right',
      build: () {
        when(mockAuthenticateUser(checkAuthUserParams))
            .thenAnswer((_) async => Right(null));
        return authBloc;
      },
      act: (bloc) => bloc.add(CheckAuthUserEvent()),
      expect: () => [
        isA<AuthState>().having(
            (state) => state.authStateEnum, 'enum', AuthStateEnum.success)
      ],
    );
    blocTest<AuthBloc, AuthState>(
      'stateEnum should be failed when return Left',
      build: () {
        when(mockAuthenticateUser(checkAuthUserParams))
            .thenAnswer((_) async => Left(Failure()));
        return authBloc;
      },
      act: (bloc) => bloc.add(CheckAuthUserEvent()),
      expect: () => [
        isA<AuthState>().having(
            (state) => state.authStateEnum, 'enum', AuthStateEnum.failed)
      ],
    );
  });
}
