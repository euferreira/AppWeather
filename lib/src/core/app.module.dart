import 'package:app_weather/src/modules/home/home.module.dart';
import 'package:get/route_manager.dart';

abstract class Module {
  late List<GetPage> pages;
}

class AppModule implements Module {
  @override
  List<GetPage> pages = Routes.to.list([
    HomeModule().pages,
  ]);
}

class Routes {
  static Routes get to => Routes();

  List<T> list<T>(Iterable<Iterable<T>> list) =>
      [for (var sublist in list) ...sublist];
}
