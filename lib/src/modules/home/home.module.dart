import 'package:app_weather/src/core/app.module.dart';
import 'package:app_weather/src/modules/home/view/home.binding.dart';
import 'package:app_weather/src/modules/home/view/home.page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class HomeModule implements Module {
  @override
  List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
