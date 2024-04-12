import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final String accessToken;

  const Token({required this.accessToken});
  @override
  List<Object?> get props => [accessToken];
}
