// import 'package:bet/config/environment.dart';
import 'package:dio/dio.dart';

part '../service/http_service.dart';

part '../manager/network_manager.dart';

final networkManager = NetworkManager(
  httpService,
);
