import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/core/usecases/usecase.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/user.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failures/failure.dart';

import '../repositories/auth_repository.dart';

@Injectable()
class SignUpUser implements UseCase<User, SignUpUserParams> {
  final AuthRepository repository;

  SignUpUser({required this.repository});

  @override
  Future<Either<Failure, User>> call(SignUpUserParams params) async {
    return repository.signUpUser(
        params.email, params.password, params.username);
  }
}

class SignUpUserParams extends Equatable {
  final String email;
  final String username;
  final String password;

  SignUpUserParams(
      {required this.email, required this.username, required this.password});
  @override
  List<Object?> get props => [email, username, password];
}
