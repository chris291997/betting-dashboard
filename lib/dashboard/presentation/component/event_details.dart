import 'package:dashboard/common/theme/theme.dart';
import 'package:dashboard/dashboard/presentation/component/fight_item.dart';
import 'package:dashboard/event/data/di/event_service_locator.dart';
import 'package:dashboard/event/presentation/bloc/event_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EventListBloc, EventListState, EventOutput>(
      selector: (state) {
        return state.selectedEvent;
      },
      builder: (context, event) {
        return Container(
          height: 80,
          width: double.infinity,
          color: ButtonColorBasedOnWinner.ongoing.mainColor,
          child: Center(
            child: Text(
              '${event.eventName}, ${event.location}',
              style: context.textStyle.headline4,
            ),
          ),
        );
      },
    );
  }
}
