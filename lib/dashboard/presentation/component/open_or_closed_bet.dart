import 'package:dashboard/common/theme/theme.dart';
import 'package:dashboard/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OpenOrClosedBet extends StatelessWidget {
  const OpenOrClosedBet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DashboardBloc, DashboardState, String>(
      selector: (state) {
        return state.selectedOutput.bettingStatus;
      },
      builder: (context, status) {
        return SizedBox(
          width: 200,
          child: Center(
            child: Text(
              status,
              style: context.textStyle.headline5,
            ),
          ),
        );
      },
    );
  }
}
