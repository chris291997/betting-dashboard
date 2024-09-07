import 'package:dashboard/common/helper/extension/data_type.dart';
import 'package:dashboard/common/theme/theme.dart';
import 'package:dashboard/dashboard/presentation/component/fight_item.dart';
import 'package:dashboard/fighter/data/di/fighter_service_locator.dart';
import 'package:flutter/material.dart';

class FighterDetailsCard extends StatelessWidget {
  const FighterDetailsCard({
    super.key,
    required this.fighterType,
    required this.totalBet,
    required this.betMultiplier,
    this.fightResult = FightResult.draw,
    required this.isConcluded,
  });

  final double totalBet;
  final double betMultiplier;
  final FighterType fighterType;
  final FightResult fightResult;
  final bool isConcluded;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: fighterType.isMeron
            ? ButtonColorBasedOnWinner.meron.mainColor
            : ButtonColorBasedOnWinner.wala.mainColor,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: _Details(
                  totalBet: totalBet,
                  fighterType: fighterType,
                  betMultiplier: betMultiplier,
                  isConcluded: isConcluded,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({
    required this.fighterType,
    required this.totalBet,
    required this.betMultiplier,
    required this.isConcluded,
  });

  final FighterType fighterType;
  final double totalBet;
  final double betMultiplier;
  final bool isConcluded;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          fighterType.name.toUpperCase(),
          style: context.textStyle.headline1.copyWith(
            fontSize: isConcluded ? 300 : 200,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        if (!isConcluded) ...[
          Text(
            '₱ ${totalBet.toCurrency().toString()}',
            style: context.textStyle.headline1,
          ),
          Text(
            betMultiplier.toStringAsFixed(2),
            style: context.textStyle.headline2,
          ),
        ]
      ],
    );
  }
}

enum FightResult {
  winner,
  loser,
  draw,
  ongoing;

  bool get isWinner => this == FightResult.winner;
  bool get isLoser => this == FightResult.loser;
  bool get isDraw => this == FightResult.draw;
  bool get isOngoing => this == FightResult.ongoing;

  String get iconUrl {
    switch (this) {
      case FightResult.winner:
        return 'assets/images/dashboard/winner.png';
      case FightResult.loser:
        return 'assets/images/dashboard/loser.png';
      case FightResult.draw:
        return 'assets/images/dashboard/draw.png';
      case FightResult.ongoing:
        return '';
    }
  }
}
