import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart'; //Archivo que se creará y nos proporcionará el código restante

@JsonSerializable() //Necesario para generar código
class User extends Equatable {
  @JsonKey(name: 'id') //Aquí podemos especificar el nombre que deseamos de la propiedad
  final int id;       //sino el nombre es el mismo que de la variable
  final String username;

  const User({
    required this.id,
    required this.username,
  });

  factory User.fromJson(json) => _$UserFromJson(json);

 Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
        id,
        username,
      ];
}
