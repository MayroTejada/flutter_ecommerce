part of 'auth_bloc.dart';

enum AuthStateEnum { loading, initial, failed, success }

class AuthState extends Equatable {
  final AuthStateEnum? authStateEnum;
  final User? user;
  const AuthState({this.authStateEnum, this.user});
  AuthState copyWith({User? user, AuthStateEnum? authStateEnum}) {
    return AuthState(
        authStateEnum: authStateEnum ?? this.authStateEnum,
        user: user ?? this.user);
  }

  AuthState initialState() {
    return copyWith(authStateEnum: AuthStateEnum.initial);
  }

  AuthState successState(User user) {
    return copyWith(authStateEnum: AuthStateEnum.success, user: user);
  }

  AuthState failedState(String error) {
    return copyWith(authStateEnum: AuthStateEnum.failed);
  }

  @override
  List<Object?> get props => [authStateEnum];
}
