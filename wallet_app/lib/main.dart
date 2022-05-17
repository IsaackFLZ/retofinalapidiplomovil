import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wallet_app/model/dataresponsecoinmarketcapapi.dart';
import 'package:wallet_app/services/servicesconfig.dart';
import 'package:wallet_app/services/http/httpbase.dart';
import 'package:wallet_app/pages/coincards.dart';
import './services/http/httpstate.dart';
import 'package:wallet_app/model/responde.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Services()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            
          ),
          initialRoute: "/",
          routes: {
            "/": (context) => MyHomePage(
                  title: 'CRYPTO CURRENCY LIST',
                ),
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Consumer<Services>(
          builder: ((context, servicesdatacoin, child) {
            return FutureBuilder<Response>(
                future: servicesdatacoin.state == StateHttp.waiting
                    ? servicesdatacoin.coinlist()
                    : null,
                builder: (context, AsyncSnapshot<Response> snapshot) {
                  if (snapshot.hasData) {
                    var data =
                        snapshot.data!.getData as DataResponseCoinMarketCapApi;
                      return CoinCard(coin: data);
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                });
          }),
        ));
  }
}
