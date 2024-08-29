part of '../../di/dashboard_service_locator.dart';

class DashboardRemoteSource {
  const DashboardRemoteSource(this._manager);

  final NetworkManager _manager;

  static const String dashboardPath = '/dashboard';
  static const String recentConcludedFight = '/recent-concluded';
  static const String currentFight = '/current-fight';

  Future<List<DashboardOutput>> getRecentConcludedFight(
      {required String eventId}) async {
    final response = await _manager.get(
      '$dashboardPath/$eventId$dashboardPath',
    );

    final data = response.data['recentAndCurrentFight'] as List<dynamic>?;

    if (data == null || data.isEmpty) {
      return [];
    }

    return data
        .map((json) => DashboardOutput.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<DashboardOutput> getCurrentFight({required String eventId}) async {
    final response = await _manager.get(
      '$dashboardPath/$eventId$currentFight',
    );

    return DashboardOutput.fromJson(response.data);
  }
}
