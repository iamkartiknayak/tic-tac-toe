import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/model/data.dart';

import 'board_layout.dart';

class BuildValues extends StatelessWidget {
  const BuildValues({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<DataModel>(
      builder: (context, value, child) {
        return Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    const BoardLayout(),
                    GridView.builder(
                      padding:
                          EdgeInsets.only(top: screenHeight > 800 ? 20 : 0),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: value.boardValues.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1 / 1.2,
                        crossAxisSpacing: 12.0,
                      ),
                      itemBuilder: (context, index) {
                        final currentValue = value.boardValues[index];

                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            value.setValue(index, context);
                            debugPrint('PRESSED INDEX : $index');
                          },
                          child: currentValue.isNotEmpty
                              ? Image.asset(
                                  'assets/images/$currentValue.png',
                                )
                              : const SizedBox.shrink(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
