import 'dart:async';

import 'package:app_weather/src/modules/temperatura/domain/entity/temperatura.entity.dart';
import 'package:app_weather/src/modules/temperatura/domain/itemperatura.usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rxn<TemperaturaEntity> temperatura = Rxn<TemperaturaEntity>();
  RxList listTemperatura = <TemperaturaEntity>[].obs;
  RxBool isLoading = false.obs;

  StreamController<TemperaturaEntity> temperaturaStreamController = StreamController<TemperaturaEntity>();

  final ITemperaturaUsecase usecase;

  HomeController({required this.usecase});

  @override
  void onInit() async {
    super.onInit();
    await loadData();
  }

  Future<void> loadData() async {
    isLoading(true);

    trataStream();
    final temperatureList = await usecase.getTemperaturas();

    temperatura.value = TemperaturaEntity(temperatura: 0, umidade: 0, data: DateTime.now());
    listTemperatura.assignAll(temperatureList);
    isLoading(false);
  }

  trataStream() {
    temperaturaStreamController.addStream(usecase.getTemperatura(temperaturaStreamController));
    temperaturaStreamController.stream.listen((event) {
      temperatura.value = event;
      temperatura.refresh();
      print("==> Evento: ${event.temperatura}");
    });
  }
}
