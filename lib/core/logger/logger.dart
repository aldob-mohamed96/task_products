import '../enum/enums.dart';

// Compare this snippet from lib/features/domain/usecases/usecases.dart:
// import 'package:dartz/dartz.dart';
class Logger {
// singletone instance
  static final Logger logger = Logger._internal();

  Logger._internal();

  static void log(String data, {LogLevel level = LogLevel.error}) {
    String datetime =
        '${DateTime.now().day.toString()}-${DateTime.now().month.toString()}-${DateTime.now().year.toString()} ${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}:${DateTime.now().second.toString()}';
    ''''
    =========$datetime ============ Type is  ${level.toString()}  ========== =====================
    #                                                                                            #
    #        $data                                                                               #
    #                                                                                            #
    =-=-=-=-=-=-=-=-=-= End LOG DATA =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

     ''';
  }
}
