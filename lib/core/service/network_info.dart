import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract interface class NetworkInfo {
  Future<bool> get isConnected;
  // listen to connection changes
  StreamSubscription<InternetStatus> get isConnectedStream;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection _internetConnectionChecker;
  NetworkInfoImpl({required InternetConnection internetConnectionChecker})
      : _internetConnectionChecker = internetConnectionChecker;

  @override
  Future<bool> get isConnected async =>
      await _internetConnectionChecker.hasInternetAccess;

  @override
  StreamSubscription<InternetStatus> get isConnectedStream =>
      _internetConnectionChecker.onStatusChange.listen((InternetStatus status) {
        switch (status) {
          case InternetStatus.connected:
            break;
          case InternetStatus.disconnected:
            break;
        }
      });

  
}
