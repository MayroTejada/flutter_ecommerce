import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failures/failure.dart';

import '../repositories/auth_repository.dart';

@Injectable()
class CheckAuthUser implements UseCase<void, CheckAuthUserParams> {
  final AuthRepository repository;

  CheckAuthUser({required this.repository});

  @override
  Future<Either<Failure, void>> call(CheckAuthUserParams params) async {
    return repository.checkAuthUser();
  }
}

class CheckAuthUserParams extends Equatable {
  @override
  List<Object?> get props => [];
}
