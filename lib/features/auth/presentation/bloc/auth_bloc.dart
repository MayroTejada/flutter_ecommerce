import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/user.dart';
import 'package:flutter_ecommerce/features/auth/domain/usecases/check_auth_user.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckAuthUser checkAuthUser;
  AuthBloc({required this.checkAuthUser})
      : super(const AuthState().initialState()) {
    on<CheckAuthUserEvent>(checkAuthUserEvent);
  }
  FutureOr<void> checkAuthUserEvent(
      CheckAuthUserEvent event, Emitter<AuthState> emit) async {
    var res = await checkAuthUser.call(CheckAuthUserParams());
    res.fold((failure) {
      emit(state.failedState('error'));
    }, (succes) {
      emit(state.successState(User(name: 'name')));
    });
  }
}
