import 'package:dashboard/common/theme/theme.dart';
import 'package:dashboard/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:dashboard/dashboard/presentation/component/fight_item.dart';
import 'package:dashboard/dashboard/presentation/component/fighter_details_card.dart';
import 'package:dashboard/fighter/data/di/fighter_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FighterWalaAndMeron extends StatelessWidget {
  const FighterWalaAndMeron({
    super.key,
  });

  // static const _vsIcon = 'assets/images/dashboard/vs.png';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final selectedOutput = state.selectedOutput;
        final winner = state.selectedOutput.winner;
        final isDraw = state.selectedOutput.isDraw;
        final isOngoing = state.selectedOutput.winner.isEmpty && !isDraw;

        return Center(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isOngoing) ...[
                    Expanded(
                      child: FighterDetailsCard(
                        fighterType: FighterType.wala,
                        totalBet: selectedOutput.totalWalaBet,
                        betMultiplier: selectedOutput.walaMultiplier,
                        fightResult: FightResult.ongoing,
                        // fightResult: isDraw
                        //     ? FightResult.draw
                        //     : winner == 'Wala'
                        //         ? FightResult.winner
                        //         : winner == 'Meron'
                        //             ? FightResult.loser
                        //             : FightResult.ongoing,
                      ),
                    ),
                    Expanded(
                      child: FighterDetailsCard(
                        fighterType: FighterType.meron,
                        totalBet: selectedOutput.totalMeronBet,
                        betMultiplier: selectedOutput.meronMultiplier,
                        // fightResult: isDraw
                        //     ? FightResult.draw
                        //     : winner == 'Meron'
                        //         ? FightResult.winner
                        //         : winner == 'Wala'
                        //             ? FightResult.loser
                        //             : FightResult.ongoing,
                      ),
                    ),
                  ] else ...[
                    if (isDraw)
                      Expanded(
                        child: Card(
                          child: Container(
                            color: ButtonColorBasedOnWinner.draw.color,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  color: const Color(0xFF505050),
                                  height: 80,
                                  child: Center(
                                    child: Text(
                                      'Draw',
                                      style: context.textStyle.headline2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    else if (winner == 'Wala')
                      Expanded(
                        child: FighterDetailsCard(
                          fighterType: FighterType.wala,
                          totalBet: selectedOutput.totalWalaBet,
                          betMultiplier: selectedOutput.walaMultiplier,
                        ),
                      )
                    else if (winner == 'Meron')
                      Expanded(
                        child: FighterDetailsCard(
                          fighterType: FighterType.meron,
                          totalBet: selectedOutput.totalMeronBet,
                          betMultiplier: selectedOutput.meronMultiplier,
                        ),
                      ),
                  ],
                ],
              ),
              // Center(
              //   child: Image.asset(
              //     _vsIcon,
              //     fit: BoxFit.contain,
              //     height: 100,
              //   ),
              // )
            ],
          ),
        );
      },
    );
  }
}
