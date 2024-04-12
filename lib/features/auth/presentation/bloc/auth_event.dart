part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckAuthUserEvent extends AuthEvent {}

class SaveTokenEvent extends AuthEvent {
  final Token token;

  const SaveTokenEvent({required this.token});
}

class FetchTokenEvent extends AuthEvent {}

class RegisterUserEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {
  final String password;
  final String username;

  SignInEvent({required this.password, required this.username});
}
