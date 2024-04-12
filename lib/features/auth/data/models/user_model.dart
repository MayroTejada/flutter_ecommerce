// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class UserModel extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'id')
  final String id;
  @HiveField(1)
  @JsonKey(name: 'username')
  final String username;
  @HiveField(2)
  @JsonKey(name: 'email')
  final String email;
  @HiveField(3)
  @JsonKey(name: 'password')
  final String password;

  UserModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  //magic method
  static Future<UserModel> fromJsonModel(Map<String, dynamic> json) async =>
      UserModel.fromJson(json);
}
