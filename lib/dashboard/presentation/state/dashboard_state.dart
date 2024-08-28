part of '../bloc/dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.status = DashboardStatus.initial,
    this.outputs = const [],
    this.selectedOutputId = '',
  });

  final DashboardStatus status;
  final List<DashboardOutput> outputs;
  final String selectedOutputId;

  const DashboardState.empty()
      : this(
          status: DashboardStatus.initial,
          outputs: const [],
          selectedOutputId: '',
        );

  DashboardState copyWith({
    DashboardStatus? status,
    List<DashboardOutput>? outputs,
    String? selectedOutput,
  }) {
    return DashboardState(
      status: status ?? this.status,
      outputs: outputs ?? this.outputs,
      selectedOutputId: selectedOutput ?? this.selectedOutputId,
    );
  }

  DashboardOutput get selectedOutput {
    return outputs.firstWhere(
      (output) => output.id == selectedOutputId,
      orElse: () => DashboardOutput.empty,
    );
  }

  @override
  List<Object> get props => [
        status,
        outputs,
        selectedOutputId,
      ];
}

enum DashboardStatus {
  initial,
  loading,
  loaded,
  error;

  bool get isInitial => this == DashboardStatus.initial;
  bool get isLoading => this == DashboardStatus.loading;
  bool get isLoaded => this == DashboardStatus.loaded;
  bool get isError => this == DashboardStatus.error;
}
