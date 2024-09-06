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
        color: buttonColorBasedOnWinner.mainColor,
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

  Color get mainColor {
    switch (this) {
      case ButtonColorBasedOnWinner.wala:
        return const Color(0xFFFF4500);
      case ButtonColorBasedOnWinner.meron:
        return const Color(0xFF1E90FF);
      case ButtonColorBasedOnWinner.draw:
        return const Color(0xFF808080);
      case ButtonColorBasedOnWinner.ongoing:
        return const Color(0xFF5A7394); // Updated lighter color
    }
  }

  Color get lightColor {
    switch (this) {
      case ButtonColorBasedOnWinner.wala:
        return const Color(0xFFFF7F7F); // Lighter orange-red
      case ButtonColorBasedOnWinner.meron:
        return const Color(0xFF87CEFA); // Lighter green
      case ButtonColorBasedOnWinner.draw:
        return const Color(0xFFD3D3D3); // Lighter gray
      case ButtonColorBasedOnWinner.ongoing:
        return const Color(0xFF5A7394); // Much lighter blue-gray
    }
  }
}
