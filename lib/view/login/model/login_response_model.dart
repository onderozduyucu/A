import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_response_model.g.dart';

@immutable
@JsonSerializable(createToJson: false)
final class LoginResponseModel extends INetworkModel<LoginResponseModel> with EquatableMixin {
  LoginResponseModel({
    this.access_token,
    this.refresh_token,
  });
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
  final String? access_token;
  final String? refresh_token;

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) => LoginResponseModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => null;

  @override
  List<Object?> get props => [access_token, refresh_token];

  LoginResponseModel copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return LoginResponseModel(
      access_token: accessToken ?? access_token,
      refresh_token: refreshToken ?? refresh_token,
    );
  }
}
