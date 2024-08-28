part of '../bloc/event_list_bloc.dart';

sealed class EventListEvent extends Equatable {
  const EventListEvent();

  @override
  List<Object> get props => [];
}

class EventListEventFetched extends EventListEvent {}

class EventSelected extends EventListEvent {
  const EventSelected(this.event);

  final EventOutput event;

  @override
  List<Object> get props => [event];
}
