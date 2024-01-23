class User {
  final String cargo;
  final String name;
  final String description;

  User.fromMap(Map<String, dynamic> map)
      : cargo = map['cargo'],
        name = map['nome'],
        description = map['descricao'];
}
