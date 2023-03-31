import 'package:app_weather/src/shared/dio/api.client.dio.dart';
import 'package:get/instance_manager.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiClientDio>(
      () => ApiClientDio(),
      fenix: true,
    );
  }
}
