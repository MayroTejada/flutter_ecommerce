// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/token.dart';

part 'token_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TokenModel extends Token {
  const TokenModel({
    required super.accessToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  //magic method
  static Future<TokenModel> fromJsonModel(Map<String, dynamic> json) async =>
      TokenModel.fromJson(json);
}
