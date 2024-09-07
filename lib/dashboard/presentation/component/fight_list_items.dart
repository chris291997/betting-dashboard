import 'package:dashboard/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:dashboard/dashboard/presentation/component/fight_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class FightListItems extends StatelessWidget {
  const FightListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final fights = state.outputs;
        final selectedFight = state.selectedOutput;

        return SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              child: SuperListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: fights.length,
                itemBuilder: (context, index) {
                  final fight = fights[index];

                  ButtonColorBasedOnWinner getButtonColor() {
                    if (fight.isDraw) {
                      return ButtonColorBasedOnWinner.draw;
                    } else if (fight.winner == 'Wala') {
                      return ButtonColorBasedOnWinner.wala;
                    } else if (fight.winner == 'Meron') {
                      return ButtonColorBasedOnWinner.meron;
                    } else {
                      return ButtonColorBasedOnWinner.ongoing;
                    }
                  }

                  return Padding(
                    padding: EdgeInsets.only(
                      top: index == 0 ? 10 : 00,
                      bottom: 10,
                    ),
                    child: Center(
                      child: FightItem(
                        fightNumber: fight.fightNumber.toString(),
                        isSelected: selectedFight.id == fight.id,
                        buttonColorBasedOnWinner: getButtonColor(),
                        onTap: () => context.read<DashboardBloc>().add(
                              DashboardFightSelected(fight.id),
                            ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
