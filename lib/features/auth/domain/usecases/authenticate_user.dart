import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failures/failure.dart';

import '../repositories/auth_repository.dart';

@Injectable()
class AuthenticateUser implements UseCase<void, AuthenticateUserParams> {
  final AuthRepository repository;

  AuthenticateUser({required this.repository});

  @override
  Future<Either<Failure, void>> call(AuthenticateUserParams params) async {
    return repository.authenticateUser();
  }
}

class AuthenticateUserParams extends Equatable {
  @override
  List<Object?> get props => [];
}
