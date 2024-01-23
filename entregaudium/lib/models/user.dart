class User {
  final String cargo;
  final String name;
  final String description;

  User.fromMap(Map<String, dynamic> map)
      : cargo = map['cargo'],
        name = map['name'],
        description = map['description'];
}
