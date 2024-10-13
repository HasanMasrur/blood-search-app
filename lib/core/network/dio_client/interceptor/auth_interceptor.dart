import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final String token;

  AuthInterceptor({required this.token});
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add authentication logic here if needed
    // For example, add headers with an authentication token
    options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }
}
