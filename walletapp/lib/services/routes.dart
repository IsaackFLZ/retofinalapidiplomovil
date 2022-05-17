import 'package:flutter/material.dart';
import 'package:walletapp/pages/coincards.dart';
import '../pages/details.dart';


class AppRoutes{
  
 Map<String,WidgetBuilder> _routes;

AppRoutes(){
  createRoutes();
}

void createRoutes(){
  _routes={

    "/":(BuildContext context) => const CoinCard(),
    "/details":(BuildContext context) => DetailsPage(),
   

  };
}
get getRoutes=>_routes;
}