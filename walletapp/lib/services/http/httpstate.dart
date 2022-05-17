import 'package:flutter/material.dart';

enum StateHttp { init,completed, waiting,error }

class HttpState extends ChangeNotifier {
  StateHttp _state = StateHttp.init;

  StateHttp get state => _state;

  void setState(StateHttp viewState) {
    _state = viewState;
    notifyListeners();
  }

}