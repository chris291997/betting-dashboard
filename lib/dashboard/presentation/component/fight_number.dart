import 'package:dashboard/common/theme/theme.dart';
import 'package:dashboard/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FightNumber extends StatelessWidget {
  const FightNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DashboardBloc, DashboardState, int>(
      selector: (state) {
        return state.selectedOutput.fightNumber;
      },
      builder: (context, fightNumber) {
        return Container(
          width: 300,
          height: 120,
          color: context.colors.primary,
          child: Center(
            child: Text(
              'Fight # ${fightNumber.toString()}',
              overflow: TextOverflow.ellipsis,
              style: context.textStyle.headline2,
            ),
          ),
        );
      },
    );
  }
}
