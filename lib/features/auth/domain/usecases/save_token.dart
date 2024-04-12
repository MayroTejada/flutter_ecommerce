import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/core/usecases/usecase.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failures/failure.dart';

import '../repositories/auth_repository.dart';

@Injectable()
class SaveToken implements UseCase<void, SaveTokenParams> {
  final AuthRepository repository;

  SaveToken({required this.repository});

  @override
  Future<Either<Failure, void>> call(SaveTokenParams params) async {
    return repository.saveToken(params.token);
  }
}

class SaveTokenParams extends Equatable {
  final Token token;

  const SaveTokenParams({required this.token});
  @override
  List<Object?> get props => [token];
}
