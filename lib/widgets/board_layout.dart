import 'package:flutter/material.dart';

class BoardLayout extends StatelessWidget {
  const BoardLayout({
    super.key,
  });

  static const indentValue = 25.0;
  // static  dividerColor = Colors.grey.shade700;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        // horizontal lines
        SizedBox(
          height: screenHeight / 2.0,
          child: Column(
            children: [
              const Spacer(),
              Divider(
                color: Colors.grey.shade600,
                indent: indentValue,
                endIndent: indentValue,
                thickness: 3.5,
              ),
              const SizedBox(height: 130.0),
              Divider(
                color: Colors.grey.shade600,
                indent: indentValue,
                endIndent: indentValue,
                thickness: 3.5,
              ),
              const Spacer(),
            ],
          ),
        ),
        // verticle lines
        SizedBox(
          height: screenHeight / 1.9,
          child: Row(
            children: [
              const Spacer(),
              VerticalDivider(
                color: Colors.grey.shade600,
                thickness: 3.5,
                width: 5.0,
              ),
              const SizedBox(width: 130.0),
              VerticalDivider(
                color: Colors.grey.shade600,
                thickness: 3.5,
                width: 5.0,
              ),
              const Spacer(),
            ],
          ),
        )
      ],
    );
  }
}
