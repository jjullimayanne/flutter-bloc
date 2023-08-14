import 'package:bloc_project/http/interceptors/logging_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: Duration(seconds: 5),
);

// const String baseUrl = 'http://192.168.58.1:8080/transactions';
final Uri baseUrl = Uri.parse('http://177.125.116.152:8080/transactions');
