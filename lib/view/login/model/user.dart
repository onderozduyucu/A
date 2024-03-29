import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User with EquatableMixin {
  User({
    this.name,
    this.imageUrl,
  });
  factory User.fake(){
    return  User(name: 'önder özduyucu', imageUrl: 'https://avatars.githubusercontent.com/u/149434617?v=4');
  }
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  String? name;
  String? imageUrl;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [name, imageUrl];

  User copyWith({
    String? name,
    String? imageUrl,
  }) {
    return User(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
