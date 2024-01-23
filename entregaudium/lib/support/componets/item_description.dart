import 'package:flutter/material.dart';

class ItemDescription extends StatelessWidget {
  final String path;
  final String value;
  final String label;

  const ItemDescription({
    super.key,
    required this.path,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(path),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
