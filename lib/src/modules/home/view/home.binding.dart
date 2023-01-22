import 'package:app_weather/src/modules/home/view/home.controller.dart';
import 'package:app_weather/src/modules/temperatura/domain/usecase/temperatura.usecase.dart';
import 'package:app_weather/src/modules/temperatura/infra/datasource/temperatura.datasource.dart';
import 'package:app_weather/src/modules/temperatura/infra/repository/temperatura.repository.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      final datasource = TemperaturaDatasource();
      final repository = TemperaturaRepository(datasource);

      return HomeController(
        usecase: TemperaturaUsecase(
          repository,
        ),
      );
    });
  }
}
