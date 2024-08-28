import 'package:dashboard/common/di/service_locator.dart';
import 'package:dashboard/common/helper/extension/json.dart';
import 'package:dashboard/fight/data/di/fight_service_locator.dart';
import 'package:equatable/equatable.dart';

part '../data_source/remote/dashboard_remote_source.dart';
part '../model/output/dashboard_output.dart';
part '../repository/dashboard_repository.dart';
part '../repository/dashboard_repository_interface.dart';

final dashboardRemoteSource = DashboardRemoteSource(networkManager);
final dashboardRepository = DashboardRepository(
  dashboardRemoteSource,
);
