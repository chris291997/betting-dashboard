import 'package:dashboard/common/di/service_locator.dart';
import 'package:dashboard/common/helper/extension/json.dart';
import 'package:dashboard/event/data/di/event_service_locator.dart';
import 'package:dashboard/fight/data/di/fight_service_locator.dart';
import 'package:dashboard/fighter/data/di/fighter_service_locator.dart';
import 'package:dashboard/user/data/di/user_service_locator.dart';
import 'package:equatable/equatable.dart';

part '../data_source/remote/bet_remote_source.dart';
part '../model/input/bet_input.dart';
part '../model/output/bet_output.dart';
part '../repository/bet_repository.dart';
part '../repository/bet_repository_interface.dart';

final betRemoteSource = BetRemoteSource(networkManager);
final betRepository = BetRepository(
  betRemoteSource: betRemoteSource,
  eventRemoteSource: eventRemoteSource,
  fightRemoteSource: fightRemoteSource,
  fighterRemoteSource: fighterRemoteSource,
);
