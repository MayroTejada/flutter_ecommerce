// ignore_for_file: overridden_fields

import 'package:equatable/equatable.dart';

class Failure extends Equatable implements Exception {
  final int code;
  final String message;

  const Failure({
    this.code = 400,
    this.message = 'unknown error',
  });

  @override
  List<Object?> get props => [code, message];
}

class CacheFailure extends Failure {}

class NoConectionFailure extends Failure {}
