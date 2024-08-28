part of '../di/dashboard_service_locator.dart';

class DashboardRepository implements DashboardRepositoryInterface {
  const DashboardRepository(
    this._remoteSource,
  );

  final DashboardRemoteSource _remoteSource;

  @override
  Future<List<DashboardOutput>> getRecentConcludedFight(
      {required String eventId}) async {
    return _remoteSource.getRecentConcludedFight(eventId: eventId);
  }

  @override
  Future<DashboardOutput> getCurrentFight({required String eventId}) async {
    return _remoteSource.getCurrentFight(eventId: eventId);
  }
}
