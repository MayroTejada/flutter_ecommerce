import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/core/usecases/usecase.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/user.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failures/failure.dart';

import '../repositories/auth_repository.dart';

@Injectable()
class SignInUser implements UseCase<User, SignInUserParams> {
  final AuthRepository repository;

  SignInUser({required this.repository});

  @override
  Future<Either<Failure, User>> call(SignInUserParams params) async {
    return repository.signInUser(
      params.email,
      params.password,
    );
  }
}

class SignInUserParams extends Equatable {
  final String email;
  final String password;

  SignInUserParams({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}
