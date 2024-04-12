import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/user.dart';
import 'package:flutter_ecommerce/features/auth/domain/usecases/check_auth_user.dart';
import 'package:flutter_ecommerce/features/auth/domain/usecases/save_token.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckAuthUser checkAuthUser;
  final SaveToken saveToken;
  AuthBloc({required this.checkAuthUser, required this.saveToken})
      : super(const AuthState().initialState()) {
    on<CheckAuthUserEvent>(checkAuthUserEvent);
    on<SaveTokenEvent>(saveTokenEvent);
  }
  FutureOr<void> checkAuthUserEvent(
      CheckAuthUserEvent event, Emitter<AuthState> emit) async {
    var res = await checkAuthUser.call(CheckAuthUserParams());
    res.fold((failure) {
      emit(state.failedState('error'));
    }, (succes) {
      emit(state.successState(User(username: 'name', id: '')));
    });
  }

  FutureOr<void> saveTokenEvent(
      SaveTokenEvent event, Emitter<AuthState> emit) async {
    var res = await saveToken.call(SaveTokenParams(token: event.token));
    res.fold((failure) {
      emit(state.failedState('error'));
    }, (succes) {
      emit(state.successState(User(username: 'name', id: '')));
    });
  }
}
