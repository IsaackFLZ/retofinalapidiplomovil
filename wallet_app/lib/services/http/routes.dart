import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/pages/coincards.dart';
import 'package:wallet_app/pages/details.dart';
import 'package:wallet_app/main.dart';

class AppRoutes {
  late Map<String, WidgetBuilder> _routes;
  
  var data;


  AppRoutes() {
    createRoutes();
  }

  void createRoutes() {
    _routes = {
      "/": (BuildContext context) => CoinCard(coin: data,),
      "/details": (BuildContext context) => Details(data: data, number: 0),
    };
  }

  get getRoutes => _routes;

}

