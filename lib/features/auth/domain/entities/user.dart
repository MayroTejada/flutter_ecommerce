import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? username;
  final String? email;
  final String? password;

  const User({this.username, this.email, required this.id, this.password});

  @override
  List<Object?> get props => [username, email, id, password];
}
