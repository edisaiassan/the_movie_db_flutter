class User {
  final int id;
  final String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(json) => User(
        id: json['id'],
        name: json['name'],
      );

  toJson() => {
        'id': id,
        'name': name,
      };
}
