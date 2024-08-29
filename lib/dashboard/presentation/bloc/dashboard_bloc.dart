import 'package:bloc/bloc.dart';
import 'package:dashboard/dashboard/data/di/dashboard_service_locator.dart';
import 'package:equatable/equatable.dart';

part '../event/dashboard_event.dart';
part '../state/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(
    this._eventId,
    this._repository,
  ) : super(const DashboardState()) {
    on<DashboardInitialized>(_onInitialized);
    on<DashboardFightSelected>(_onFightSelected);
    on<DashboardFightFetched>(_onFightFetched);
  }

  final String _eventId;
  final DashboardRepositoryInterface _repository;

  void _onInitialized(
      DashboardInitialized event, Emitter<DashboardState> emit) async {
    emit(const DashboardState.empty());
  }

  void _onFightSelected(
      DashboardFightSelected event, Emitter<DashboardState> emit) {
    emit(state.copyWith(selectedOutput: event.fightId));
  }

  void _onFightFetched(
      DashboardFightFetched event, Emitter<DashboardState> emit) async {
    try {
      emit(state.copyWith(status: DashboardStatus.loading));

      final outputs =
          await _repository.getRecentConcludedFight(eventId: _eventId);

      final selectedId = state.selectedOutputId;

      final selectedOutputId =
          selectedId.isEmpty || !outputs.any((e) => e.id == selectedId)
              ? outputs.last.id
              : state.selectedOutputId;

      emit(state.copyWith(
        status: DashboardStatus.loaded,
        selectedOutput: selectedOutputId,
        outputs: outputs,
      ));
    } catch (e) {
      emit(
        state.copyWith(status: DashboardStatus.error),
      );
    }
  }
}
