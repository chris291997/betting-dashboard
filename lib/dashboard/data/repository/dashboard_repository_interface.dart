part of '../di/dashboard_service_locator.dart';

abstract interface class DashboardRepositoryInterface {
  Future<List<DashboardOutput>> getRecentConcludedFight(
      {required String eventId});
  Future<DashboardOutput> getCurrentFight({required String eventId});
}
