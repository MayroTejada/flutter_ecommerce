import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/features/auth/domain/usecases/authenticate_user.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticateUser authenticateUser;
  AuthBloc({required this.authenticateUser}) : super(AuthInitial()) {
    on<AuthenticateUserEvent>(authenticateUserEvent);
  }
  FutureOr<void> authenticateUserEvent(
      AuthenticateUserEvent event, Emitter<AuthState> emit) async {
    var res = await authenticateUser.call(AuthenticateUserParams());
    res.fold((failure) {}, (succes) {});
  }
}
