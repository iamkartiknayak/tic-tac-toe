import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/model/data.dart';

class ResultDialog extends StatelessWidget {
  const ResultDialog({
    super.key,
    required this.result,
    required this.playerNumber,
  });

  final String result;
  final String playerNumber;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      surfaceTintColor: Colors.black,
      content: SizedBox(
        width: screenWidth - 40,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              result == 'draw' ? 'Game Over' : 'Congratulations  🎊',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 23.0,
                fontFamily: 'valera',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25.0),
            Text(
              result == 'draw'
                  ? 'Oops! Game is a draw 😶'
                  : 'Player $playerNumber won!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontFamily: 'valera',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DialogButton(
                  title: 'Restart',
                  icon: FluentSystemIcons.ic_fluent_arrow_sync_regular,
                  onTap: () {
                    context.read<DataModel>().restartGame(context);
                    Navigator.pop(context);
                  },
                ),
                DialogButton(
                  title: 'View board',
                  icon: FluentSystemIcons.ic_fluent_eye_show_regular,
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(backgroundColor: Colors.black),
      onPressed: onTap,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xffe0e0e0),
              fontSize: 15.0,
              fontFamily: 'valera',
            ),
          ),
          const SizedBox(width: 10.0),
          Icon(
            icon,
            size: 20.0,
            color: const Color(0xffe0e0e0),
          ),
        ],
      ),
    );
  }
}
