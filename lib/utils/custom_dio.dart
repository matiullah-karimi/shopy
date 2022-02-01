import 'package:dio/dio.dart';
import 'package:shopy/utils/local_storage.dart';

String? csrfToken;
var customDio = Dio(
  BaseOptions(
    baseUrl: 'https://fakestoreapi.com',
    connectTimeout: 30000,
    receiveTimeout: 30000,
    headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
  ),
)..interceptors.add(QueuedInterceptorsWrapper(
    onRequest: (options, handler) {
      print('send request：path:${options.path}，baseURL:${options.baseUrl}');
      LocalStorage.getItem('token').then((token) {
        options.headers['Authorization'] = 'Bearer ' + token;
        handler.next(options);
      }).catchError((error, stackTrace) {
        handler.reject(error, true);
      });
    },
  ));
