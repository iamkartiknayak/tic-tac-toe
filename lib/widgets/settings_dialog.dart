import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../model/data.dart';
import 'reset_stats_dialog.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: const Color(0xff191919),
      surfaceTintColor: Colors.black,
      content: SizedBox(
        width: screenWidth - 40,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Settings',
                  style: kDialogTitleStyle,
                ),
                IconButton(
                  color: Colors.grey.shade300,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.shade900,
                  ),
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            const SizedBox(height: 15.0),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return const CommonDialog(
                      type: 'reset',
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                margin: const EdgeInsets.only(bottom: 13.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Text(
                  'Reset Statistics',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'valera',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'SFX',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'valera',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Consumer<DataModel>(
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: 0.8,
                        child: SizedBox(
                          height: 35.0,
                          child: Switch(
                            thumbColor:
                                const MaterialStatePropertyAll(Colors.white),
                            activeColor: const Color(0xff3ab8d0),
                            inactiveTrackColor: Colors.grey.shade900,
                            value: value.isSFXEnabled,
                            onChanged: (p0) => value.toggleSFX(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
