// import 'package:bet/config/environment.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

part '../service/cache_service.dart';

part '../service/http_service.dart';

part '../manager/network_manager.dart';

const cacheService = CacheService();

final networkManager = NetworkManager(
  httpService,
);
