import 'package:dashboard/common/component/button/primary_button.dart';
import 'package:dashboard/common/component/drop_down/base_drop_down.dart';
import 'package:dashboard/common/theme/screen_size/screen_breakpoint.dart';
import 'package:dashboard/common/theme/theme.dart';
import 'package:dashboard/event/data/di/event_service_locator.dart';
import 'package:dashboard/event/presentation/bloc/event_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EventSelectionScreen extends StatelessWidget {
  const EventSelectionScreen({super.key});

  static const routeName = '/event';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: ScreenBreakpoint.tabletMaxWidth,
          ),
          padding: EdgeInsets.all(context.layout.mediumPadding),
          child: BlocProvider(
            lazy: false,
            create: (context) => EventListBloc(eventRepository)
              ..add(
                EventListEventFetched(),
              ),
            child: BlocBuilder<EventListBloc, EventListState>(
              builder: (context, state) {
                final dropdownStatus = switch (state.status) {
                  EventListStatus.loading => BaseDropdownStatus.loading,
                  EventListStatus.loaded => BaseDropdownStatus.enabled,
                  _ => BaseDropdownStatus.disabled,
                };

                final events = state.events;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseDropDown(
                      status: dropdownStatus,
                      header: 'Event',
                      hint: dropdownStatus.isEnabled && events.isEmpty
                          ? 'No Available Events'
                          : 'Select Event',
                      value: null,
                      dropdownItems: events
                          .map((EventOutput event) =>
                              DropdownMenuItem<EventOutput>(
                                value: event,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    event.eventName,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: context.textStyle.button,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (event) {
                        if (event != null) {
                          context.read<EventListBloc>().add(
                                EventSelected(event),
                              );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      labelText: 'Go',
                      onPressed: () {
                        if (state.selectedEvent.isNotEmpty) {
                          context.push(
                            '${EventSelectionScreen.routeName}/${state.selectedEvent.id}',
                            extra: {
                              'eventName': state.selectedEvent,
                            },
                          );
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
