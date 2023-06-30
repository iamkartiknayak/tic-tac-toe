import 'package:flutter/material.dart';

class GameStat extends StatelessWidget {
  const GameStat({
    super.key,
    required this.imagePath,
    required this.color,
    required this.count,
    this.size,
    this.type,
  });

  final String imagePath;
  final Color color;
  final int count;
  final String? type;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          color: color,
          height: size ?? 35.0,
        ),
        const SizedBox(height: 10.0),
        Text(
          '$count ${type ?? 'win'}s',
          style: TextStyle(
            color: color,
            fontSize: 15.0,
            fontFamily: 'valera',
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
