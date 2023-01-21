import 'package:flutter/material.dart';

import 'request_newgame.dart';

class RequestManager with ChangeNotifier {
  RequestNewgame? _requestNewgame;
  final String _dummy = "dummy";

  void setRequestNewGame(Map<String, dynamic> json) { 
    _requestNewgame = RequestNewgame.fromJson(json); 
    notifyListeners();
  }

  RequestNewgame? getRequestNewGame() => _requestNewgame;

  String getDummy() => _dummy;
}
