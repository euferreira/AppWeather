import 'package:app_weather/src/modules/temperatura/domain/entity/temperatura.entity.dart';
import 'package:app_weather/src/modules/temperatura/domain/itemperatura.usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rxn<TemperaturaEntity> temperatura = Rxn<TemperaturaEntity>();
  RxList listTemperatura = <TemperaturaEntity>[].obs;
  RxBool isLoading = false.obs;

  final ITemperaturaUsecase usecase;

  HomeController({required this.usecase});

  @override
  void onInit() async {
    super.onInit();
    await loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading(true);
      final data = await usecase.getTemperatura();
      final temperatureList = await usecase.getTemperaturas();

      temperatura.value = data;
      listTemperatura.assignAll(temperatureList);
      isLoading(false);
    } catch (e) {
      print(e);
    }
  }
}
