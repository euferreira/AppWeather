import 'package:dio/dio.dart';

import '../../errors/errors.dart';
import '../../errors/network.exception.dart';

class DioExceptions implements NetworkExceptions {
  @override
  Failure exceptions(ExceptionParams params) {
    switch (params.dioError!.type) {
      case DioErrorType.response:
        switch (params.dioError!.response?.statusCode) {
          case 401:
            return Failure('Usuário não autorizado a realizar essa operação');
          case 500:
            return Failure("Erro na comunicaçao com o servidor");
          default:
            return Failure(params.dioError!.response?.data is Map<String, dynamic>
                ? params.dioError!.response?.data['message']
                : params.dioError!.response?.data);
        }
      case DioErrorType.connectTimeout:
        return Failure("Servidor demorou muito para responder");
      case DioErrorType.sendTimeout:
        return Failure("Tempo limite atingido");
      case DioErrorType.cancel:
        return Failure("Operação cancelada");
      case DioErrorType.other:
        return Failure("Sem conexão com a internet");
      default:
        return Failure("Falha na comunicaçao com o servidor");
    }
  }
}
