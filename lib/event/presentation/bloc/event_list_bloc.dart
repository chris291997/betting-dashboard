import 'package:bloc/bloc.dart';
import 'package:dashboard/event/data/di/event_service_locator.dart';
import 'package:equatable/equatable.dart';

part '../event/event_list_event.dart';
part '../state/event_list_state.dart';

class EventListBloc extends Bloc<EventListEvent, EventListState> {
  EventListBloc(this._eventRepository) : super(const EventListState()) {
    on<EventListEventFetched>(_onEventListEventFetched);
    on<EventSelected>(_onEventSelected);
  }

  final EventRepository _eventRepository;

  void _onEventSelected(EventSelected event, Emitter<EventListState> emit) {
    emit(state.copyWith(selectedEvent: event.event));
  }

  void _onEventListEventFetched(
      EventListEventFetched event, Emitter<EventListState> emit) async {
    emit(state.copyWith(status: EventListStatus.loading));
    try {
      final events = await _eventRepository.getEvents();

      emit(state.copyWith(status: EventListStatus.loaded, events: events));
    } catch (e) {
      emit(state.copyWith(status: EventListStatus.error));
    }
  }
}
