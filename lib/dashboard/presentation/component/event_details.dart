import 'package:dashboard/common/theme/theme.dart';
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
          width: double.infinity,
          height: 175,
          color: const Color(0xFF3A5374),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                event.eventName,
                style: context.textStyle.headline2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 30),
              Text(
                event.location,
                style: context.textStyle.headline5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
