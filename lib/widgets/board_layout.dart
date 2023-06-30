import 'package:flutter/material.dart';

class BoardLayout extends StatelessWidget {
  const BoardLayout({
    super.key,
  });

  static const indentValue = 25.0;
  static const dividerColor = Color(0xff757575);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        // horizontal lines
        SizedBox(
          height: screenHeight / 2.0,
          child: const Column(
            children: [
              Spacer(),
              Divider(
                color: dividerColor,
                indent: indentValue,
                endIndent: indentValue,
                thickness: 3.5,
              ),
              SizedBox(height: 130.0),
              Divider(
                color: dividerColor,
                indent: indentValue,
                endIndent: indentValue,
                thickness: 3.5,
              ),
              Spacer(),
            ],
          ),
        ),
        // verticle lines
        SizedBox(
          height: screenHeight / 1.9,
          child: const Row(
            children: [
              Spacer(),
              VerticalDivider(
                color: dividerColor,
                thickness: 3.5,
                width: 5.0,
              ),
              SizedBox(width: 130.0),
              VerticalDivider(
                color: dividerColor,
                thickness: 3.5,
                width: 5.0,
              ),
              Spacer(),
            ],
          ),
        )
      ],
    );
  }
}
