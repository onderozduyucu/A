import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_request_model.g.dart';

@immutable
@JsonSerializable(createFactory: false)
final class LoginRequestModel extends INetworkModel<LoginRequestModel> with EquatableMixin {
  LoginRequestModel({this.email,this.password});

  final String? email;
  final String? password;

  @override
  LoginRequestModel fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson() => _$LoginRequestModelToJson(this);

  @override
  List<Object?> get props => [email, password];

  LoginRequestModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
