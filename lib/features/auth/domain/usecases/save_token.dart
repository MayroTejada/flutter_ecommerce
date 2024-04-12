import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failures/failure.dart';

import '../repositories/auth_repository.dart';

@Injectable()
class SaveToken implements UseCase<void, SaveTokenParams> {
  final AuthRepository repository;

  SaveToken({required this.repository});

  @override
  Future<Either<Failure, void>> call(SaveTokenParams params) async {
    return repository.saveToken();
  }
}

class SaveTokenParams extends Equatable {
  @override
  List<Object?> get props => [];
}
