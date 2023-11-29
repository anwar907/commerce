import 'package:api_repository/utils/const.dart';
import 'package:dio/dio.dart';

class Configuration {
  static Dio initialize() {
    final option = Dio(BaseOptions(
      baseUrl: SourceUrl.baseUrl,
      persistentConnection: true,
      receiveTimeout: const Duration(milliseconds: 3000),
      connectTimeout: const Duration(milliseconds: 5000),
    ));

    return option;
  }
}
