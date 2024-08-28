part of '../bloc/dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class DashboardInitialized extends DashboardEvent {}

class DashboardFightSelected extends DashboardEvent {
  const DashboardFightSelected(this.fightId);
  final String fightId;
}

class DashboardFightFetched extends DashboardEvent {}
