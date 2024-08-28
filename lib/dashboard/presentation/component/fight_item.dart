import 'package:dashboard/common/theme/theme.dart';
import 'package:flutter/material.dart';

class FightItem extends StatelessWidget {
  const FightItem({
    required this.fightNumber,
    required this.onTap,
    required this.isSelected,
    required this.buttonColorBasedOnWinner,
    super.key,
  });

  final String fightNumber;
  final void Function() onTap;
  final bool isSelected;
  final ButtonColorBasedOnWinner buttonColorBasedOnWinner;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isSelected ? 90 : 60,
        height: isSelected ? 90 : 60,
        color: buttonColorBasedOnWinner.color,
        child: Center(
          child: Text(
            fightNumber,
            style: isSelected
                ? context.textStyle.headline3
                : context.textStyle.headline4,
          ),
        ),
      ),
    );
  }
}

enum ButtonColorBasedOnWinner {
  wala,
  meron,
  draw,
  ongoing;

  Color get color {
    switch (this) {
      case ButtonColorBasedOnWinner.wala:
        return const Color(0xFFFF4500);
      case ButtonColorBasedOnWinner.meron:
        return const Color(0xFF32CD32);
      case ButtonColorBasedOnWinner.draw:
        return Color.lerp(Colors.green, Colors.red, 0.5) ?? Colors.black;
      case ButtonColorBasedOnWinner.ongoing:
        return AppColors.dark().surface;
    }
  }
}
