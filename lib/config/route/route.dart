import 'package:dashboard/dashboard/presentation/screen/event_dashboard.dart';
import 'package:dashboard/dashboard/presentation/screen/event_selection_screen.dart';
import 'package:dashboard/event/data/di/event_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: EventSelectionScreen.routeName,
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: EventSelectionScreen.routeName,
      builder: (context, state) {
        return const EventSelectionScreen();
      },
      routes: [
        GoRoute(
          path: ':eventId',
          builder: (context, state) {
            final eventId = state.pathParameters['eventId'] as String;
            final Map<String, dynamic> extra =
                state.extra as Map<String, dynamic>? ?? {};
            final event = extra['eventName'] as EventOutput?;

            return EventDashboard(
              eventId: eventId,
              event: event ?? const EventOutput.empty(),
            );
          },
        ),
      ],
    ),
  ],
  onException: (context, state, router) {
    context.go(EventSelectionScreen.routeName);
  },
);
