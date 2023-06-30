import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  const CustomRoundButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade800,
            width: 2.0,
          ),
        ),
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff212121),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            icon,
            color: const Color(0xffe0e0e0),
            size: 35.0,
          ),
        ),
      ),
    );
  }
}
