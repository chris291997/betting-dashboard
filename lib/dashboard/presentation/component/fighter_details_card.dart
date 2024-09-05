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
  });

  final double totalBet;
  final double betMultiplier;
  final FighterType fighterType;
  final FightResult fightResult;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: fighterType.isMeron
            ? ButtonColorBasedOnWinner.meron.color
            : ButtonColorBasedOnWinner.wala.color,
        // color: fighterType.isMeron
        //     ? const Color(0xFF98FB98)
        //     : const Color(0xFFFFA07A),
        // constraints: const BoxConstraints(
        //   maxHeight: 800,
        // ),
        child: Column(
          children: [
            Container(
              // color: fighterType.isMeron
              //     ? const Color(0xFF32CD32)
              //     : const Color(0xFFFF4500),
              color: fighterType.isMeron
                  ? const Color(0xFF228B22)
                  : const Color(0xFFCC3700),
              height: 80,
              child: Center(
                child: Text(
                  fighterType.name.toUpperCase(),
                  style: context.textStyle.headline2,
                ),
              ),
            ),
            // _Avatar(
            //   fighterType: fighterType,
            //   fightResult: fightResult,
            // ),
            Expanded(
              child: Center(
                child: _Details(
                  totalBet: totalBet,
                  fighterType: fighterType,
                  betMultiplier: betMultiplier,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _Avatar extends StatelessWidget {
//   const _Avatar({
//     required this.fighterType,
//     required this.fightResult,
//   });

//   final FighterType fighterType;
//   final FightResult fightResult;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(30.0),
//       child: Container(
//         width: 400,
//         height: 400,
//         padding: const EdgeInsets.all(30),
//         decoration: BoxDecoration(
//           color: fighterType.isMeron
//               ? const Color(0xFF98FB98)
//               : const Color(0xFFFFA07A),
//           borderRadius: BorderRadius.circular(30), // Rounded corners
//         ),
//         child: Stack(
//           children: [
//             AnimatedOpacity(
//               duration: const Duration(milliseconds: 500),
//               opacity: fightResult.isOngoing ? 1.0 : 0.4,
//               child: SvgPicture.asset(
//                 fighterType.icon,
//                 fit: BoxFit.contain,
//               ),
//             ),
//             if (!fightResult.isOngoing)
//               Center(
//                 child: ColorFiltered(
//                   colorFilter: const ColorFilter.mode(
//                     Colors.black,
//                     BlendMode.srcIn,
//                   ),
//                   child: Image.asset(
//                     fightResult.iconUrl,
//                     fit: BoxFit.contain,
//                     width: fightResult.isDraw ? 300 : 400,
//                     height: fightResult.isDraw ? 150 : 200,
//                   ),
//                 ),
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }

class _Details extends StatelessWidget {
  const _Details({
    required this.fighterType,
    required this.totalBet,
    required this.betMultiplier,
  });

  final FighterType fighterType;
  final double totalBet;
  final double betMultiplier;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text(
        //   fighterType.name.toUpperCase(),
        //   style: context.textStyle.headline2,
        // ),
        Text(
          '₱ ${totalBet.toString()}',
          style: context.textStyle.headline1,
        ),
        Text(
          betMultiplier.toStringAsFixed(2),
          style: context.textStyle.headline2,
        ),
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
