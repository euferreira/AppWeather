import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'client.dio.dart';

class ApiClientDio extends ClientDio {
  ApiClientDio();

  @override
  String get baseUrl => dotenv.env['API_URL'] ?? "";
}
