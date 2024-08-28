part of '../bloc/event_list_bloc.dart';

class EventListState extends Equatable {
  const EventListState({
    this.status = EventListStatus.initial,
    this.events = const <EventOutput>[],
    this.selectedEvent = const EventOutput(),
  });

  final EventListStatus status;
  final List<EventOutput> events;
  final EventOutput selectedEvent;

  EventListState copyWith({
    EventListStatus? status,
    List<EventOutput>? events,
    EventOutput? selectedEvent,
  }) {
    return EventListState(
      status: status ?? this.status,
      events: events ?? this.events,
      selectedEvent: selectedEvent ?? this.selectedEvent,
    );
  }

  const EventListState.empty() : this();

  @override
  List<Object> get props => [
        status,
        events,
        selectedEvent
      ];
}

enum EventListStatus {
  initial,
  loading,
  loaded,
  error;

  bool get isInitial => this == EventListStatus.initial;
  bool get isLoading => this == EventListStatus.loading;
  bool get isLoaded => this == EventListStatus.loaded;
  bool get isError => this == EventListStatus.error;
}
