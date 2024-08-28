part of '../di/service_locator.dart';

class NetworkManager {
  NetworkManager(
    this._httpService,
  ) {
    _httpService.interceptors.add(
      InterceptorsWrapper(
        // Add the token to the headers
        onRequest: (options, handler) async {
          // options.headers['Accept'] = Headers.jsonContentType;
          // final token = await _cacheService.read(StorageKey.accessToken);
          // if (token != null) {
          //   options.headers['Authorization'] = 'Bearer $token';
          // }
          handler.next(options);
        },
        onError: (error, handler) async {
          handler.reject(error);
        },
      ),
    );
  }

  final Dio _httpService;

  Future<Response<T>> get<T>(String path, {Object? data}) async {
    return await _httpService.get<T>(path, data: data);
  }

  Future<Response<T>> post<T>(String path, {Object? data}) async {
    return await _httpService.post<T>(path, data: data);
  }

  Future<Response<T>> put<T>(String path, {Object? data}) async {
    return await _httpService.put<T>(path, data: data);
  }

  Future<Response<T>> patch<T>(String path, {Object? data}) async {
    return await _httpService.patch<T>(path, data: data);
  }

  Future<Response<T>> delete<T>(String path, {Object? data}) async {
    return await _httpService.delete<T>(path, data: data);
  }
}
