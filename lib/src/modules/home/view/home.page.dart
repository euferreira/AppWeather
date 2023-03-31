import 'package:app_weather/src/modules/home/view/home.controller.dart';
import 'package:app_weather/src/modules/temperatura/view/widget/average_temperature.widget.dart';
import 'package:app_weather/src/shared/utils/formatter.dart';
import 'package:app_weather/src/modules/temperatura/view/widget/temperatura.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return Temperatura(
                        maxWidth: constraint.maxWidth,
                        temperature: controller.temperatura.value!.temperatura,
                      );
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Data',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 6),
                            Obx(
                              () => Text(
                                formatDataToString(
                                  controller.temperatura.value?.data ?? DateTime.now(),
                                ),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Umidade',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 6),
                            Obx(
                              () => Text(
                                '${controller.temperatura.value?.umidade ?? 0}%',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Últimos 5 dias',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    Obx(() {
                      if (controller.isLoading.isTrue) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return SizedBox(
                        height: constraint.maxWidth * 0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listTemperatura.length,
                          itemBuilder: (context, index) {
                            return AverageTemperature(
                              temperatura: controller.listTemperatura[index],
                            );
                          },
                        ),
                      );
                    }),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
