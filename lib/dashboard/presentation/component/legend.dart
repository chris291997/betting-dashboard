import 'package:dashboard/common/theme/theme.dart';
import 'package:dashboard/dashboard/presentation/component/fight_item.dart';
import 'package:flutter/material.dart';

class Legend extends StatelessWidget {
  const Legend({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Legend',
            style: context.textStyle.bodyText1,
          ),
          const SizedBox(height: 20),
          LegendItem(color: ButtonColorBasedOnWinner.wala.mainColor, label: 'Wala'),
          LegendItem(
              color: ButtonColorBasedOnWinner.meron.mainColor, label: 'Meron'),
          LegendItem(color: ButtonColorBasedOnWinner.draw.mainColor, label: 'Draw'),
          LegendItem(
              color: ButtonColorBasedOnWinner.ongoing.mainColor, label: 'Ongoing'),
        ],
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({
    required this.color,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: context.textStyle.caption,
        ),
      ],
    );
  }
}
