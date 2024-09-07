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
                        fighterType: FighterType.meron,
                        totalBet: selectedOutput.totalMeronBet,
                        betMultiplier: selectedOutput.meronMultiplier,
                        isConcluded: false,
                      ),
                    ),
                    Expanded(
                      child: FighterDetailsCard(
                        fighterType: FighterType.wala,
                        totalBet: selectedOutput.totalWalaBet,
                        betMultiplier: selectedOutput.walaMultiplier,
                        fightResult: FightResult.ongoing,
                        isConcluded: false,
                      ),
                    ),
                  ] else ...[
                    if (isDraw)
                      Expanded(
                        child: Card(
                          child: Container(
                            color: ButtonColorBasedOnWinner.draw.mainColor,
                            child: Center(
                              child: Text(
                                'DRAW',
                                style: context.textStyle.headline1.copyWith(
                                  fontSize: 250,
                                ),
                              ),
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
                          isConcluded: true,
                        ),
                      )
                    else if (winner == 'Meron')
                      Expanded(
                        child: FighterDetailsCard(
                          fighterType: FighterType.meron,
                          totalBet: selectedOutput.totalMeronBet,
                          betMultiplier: selectedOutput.meronMultiplier,
                          isConcluded: true,
                        ),
                      ),
                  ],
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
