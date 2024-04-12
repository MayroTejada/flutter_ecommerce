// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class TokenModel extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'token')
  final String accessToken;

  TokenModel({required this.accessToken});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  //magic method
  static Future<TokenModel> fromJsonModel(Map<String, dynamic> json) async =>
      TokenModel.fromJson(json);
}
