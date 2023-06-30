import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

import '../model/data.dart';
import '../widgets/game_stat.dart';
import '../widgets/build_values.dart';
import '../widgets/round_button.dart';
import '../widgets/settings_dialog.dart';
import '../widgets/reset_stats_dialog.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0f0f0f),
      body: Column(
        children: [
          const SizedBox(height: 70.0),
          Consumer<DataModel>(
            builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GameStat(
                    imagePath: 'assets/images/o.png',
                    color: const Color(0xff37bbd3),
                    count: value.playerTwoPoints,
                  ),
                  GameStat(
                    imagePath: 'assets/images/x.png',
                    color: const Color(0xff3a89d3),
                    count: value.playerOnePoints,
                    size: 28,
                  ),
                  GameStat(
                    imagePath: 'assets/images/balance.png',
                    color: Colors.grey,
                    count: value.drawCount,
                    type: 'draw',
                  ),
                ],
              );
            },
          ),
          const BuildValues(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRoundButton(
                onTap: () => showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return const CommonDialog(type: 'restart');
                  },
                ),
                icon: FluentSystemIcons.ic_fluent_arrow_sync_regular,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: const Color(0xff575757),
                    width: 2.0,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 10.0),
                child: Consumer<DataModel>(
                  builder: (context, value, child) {
                    return Text(
                      'PLAYER ${value.activeValue == 'o' ? 1 : 2}',
                      style: TextStyle(
                        color: value.isReadOnly
                            ? Colors.grey
                            : value.activeValue == 'o'
                                ? const Color(0xff3a89d3)
                                : const Color(0xff37bbd3),
                        fontSize: 16.0,
                        fontFamily: 'valera',
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              CustomRoundButton(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const SettingsDialog();
                    },
                  );
                },
                icon: FluentSystemIcons.ic_fluent_settings_regular,
              ),
            ],
          ),
          const SizedBox(height: 50.0)
        ],
      ),
    );
  }
}
