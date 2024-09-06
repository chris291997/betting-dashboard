import 'dart:async';

import 'package:dashboard/dashboard/data/di/dashboard_service_locator.dart';
import 'package:dashboard/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:dashboard/dashboard/presentation/component/event_details.dart';
import 'package:dashboard/dashboard/presentation/component/fight_list_items.dart';
import 'package:dashboard/dashboard/presentation/component/fight_number.dart';
import 'package:dashboard/dashboard/presentation/component/fighter_wala_and_meron.dart';
import 'package:dashboard/dashboard/presentation/component/legend.dart';
import 'package:dashboard/dashboard/presentation/component/open_or_closed_bet.dart';
import 'package:dashboard/dashboard/presentation/screen/event_selection_screen.dart';
import 'package:dashboard/event/data/di/event_service_locator.dart';
import 'package:dashboard/event/presentation/bloc/event_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class EventDashboard extends StatelessWidget {
  const EventDashboard({
    super.key,
    required this.eventId,
    this.event = const EventOutput(),
  });

  final String eventId;
  final EventOutput event;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventListBloc(
        eventRepository,
      ),
      child: _Dashboard(
        eventId: eventId,
        event: event,
      ),
    );
  }
}

class _Dashboard extends HookWidget {
  const _Dashboard({
    required this.eventId,
    required this.event,
  });

  final String eventId;
  final EventOutput event;

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        if (event.isEmpty) {
          context.read<EventListBloc>().add(EventListEventFetched());
        } else {
          context.read<EventListBloc>().add(EventSelected(event));
        }
        return null;
      },
      [],
    );
    return BlocConsumer<EventListBloc, EventListState>(
      listener: (context, state) {
        final status = state.status;
        if (status.isError ||
            (status.isLoaded && !state.events.any((e) => e.id == eventId))) {
          context.go(EventSelectionScreen.routeName);
        } else if (status.isLoaded &&
            state.events.any((e) => e.id == eventId)) {
          final event = state.events.firstWhere((e) => e.id == eventId);
          context.read<EventListBloc>().add(EventSelected(event));
        }
      },
      builder: (context, state) {
        if ((state.status.isLoading) ||
            (state.status.isInitial && event.isEmpty)) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return BlocProvider(
          lazy: false,
          create: (context) => DashboardBloc(
            eventId,
            dashboardRepository,
          )..add(DashboardFightFetched()),
          child: const Scaffold(
            body: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FightNumber(),
                                OpenOrClosedBet(),
                              ],
                            ),
                          ),
                          Expanded(
                            child: FighterWalaAndMeron(),
                          ),
                          EventDetails(),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FightListItems(),
                        ),
                        Legend(),
                      ],
                    ),
                  ],
                ),
                _TimerWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TimerWidget extends HookWidget {
  const _TimerWidget();

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        // Create a timer that triggers every minute
        final timer = Timer.periodic(const Duration(seconds: 5), (timer) {
          context.read<DashboardBloc>().add(DashboardFightFetched());
        });

        // Cleanup the timer when the widget is disposed
        return () => timer.cancel();
      },
      [],
    );

    return const SizedBox();
  }
}
