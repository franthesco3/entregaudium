class Historic {
  final double value;
  final int? delivery;
  final int? assesment;

  Historic.fromMap(Map<String, dynamic> map)
      : assesment = map['avaliacao'],
        delivery = map['qtd'],
        value = map['valor'].toDouble();
}
