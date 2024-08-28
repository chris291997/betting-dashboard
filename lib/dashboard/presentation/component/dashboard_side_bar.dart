import 'package:dashboard/dashboard/presentation/component/event_details.dart';
import 'package:dashboard/dashboard/presentation/component/fight_list_items.dart';
import 'package:dashboard/dashboard/presentation/component/fight_number.dart';
import 'package:dashboard/dashboard/presentation/component/legend.dart';
import 'package:dashboard/dashboard/presentation/component/open_or_closed_bet.dart';
import 'package:flutter/material.dart';

class DashboardSideBar extends StatelessWidget {
  const DashboardSideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EventDetails(),
          SizedBox(height: 20),
          FightNumber(),
          SizedBox(height: 10),
          OpenOrClosedBet(),
          Expanded(
            child: FightListItems(),
          ),
          SizedBox(height: 20),
          Legend(),
        ],
      ),
    );
  }
}
