import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../model/data.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: const Color(0xff191919),
      surfaceTintColor: Colors.black,
      content: SizedBox(
        width: screenWidth - 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10.0),
            Text(
              type == 'reset' ? 'Reset Statistics?' : 'Restart game?',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'valera',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'No',
                    style: kTextButtonStyle,
                  ),
                ),
                TextButton(
                  onPressed: type == 'reset'
                      ? () => context.read<DataModel>().resetGame(context)
                      : () => context.read<DataModel>().restartGame(context),
                  child: const Text(
                    'Yes',
                    style: kTextButtonStyle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
