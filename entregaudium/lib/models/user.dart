import 'package:entregaudium/models/historic.dart';

class User {
  final String cargo;
  final String name;
  final String description;
  final List<Historic> historic;

  User.fromMap(Map<String, dynamic> map)
      : cargo = map['cargo'],
        name = map['nome'],
        historic = List<Historic>.from(
            map['historico'].map((value) => Historic.fromMap(value))),
        description = map['descricao'];
}
