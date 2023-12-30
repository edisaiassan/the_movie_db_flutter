import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  final String username;
  
  final String? avatarPath;

  const User({
    required this.id,
    required this.username,
    this.avatarPath,
  });

  //factory User.fromJson(json) => _$UserFromJson(json);
  factory User.fromJson(json) {
    final avatarPath = json['avatar']['tmdb']?['avatar_path'] as String?;
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      avatarPath: avatarPath,
    );
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
        id,
        username,
        avatarPath,
      ];
}
