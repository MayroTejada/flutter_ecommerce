import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';
import 'package:flutter_ecommerce/features/auth/domain/usecases/authenticate_user.dart';
import 'package:flutter_ecommerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'authentication_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthenticateUser>()])
void main() async {
  late AuthenticateUser mockAuthenticateUser;
  late AuthBloc authBloc;

  setUp(() {
    mockAuthenticateUser = MockAuthenticateUser();

    authBloc = AuthBloc(authenticateUser: mockAuthenticateUser);
  });

  tearDown(() {
    authBloc.close();
  });

  group('AuthenticationBloc', () {
    const token = Token(accessToken: 'test_token');

    test('initial state should be AuthenticationState', () {
      expect(authBloc.state, isA<AuthState>());
    });
  });
}
