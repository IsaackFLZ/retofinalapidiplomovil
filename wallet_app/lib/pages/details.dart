import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/pages/coincards.dart';

import '../model/dataresponsecoinmarketcapapi.dart';

class Details extends StatelessWidget {
  final DataResponseCoinMarketCapApi data;
  final int number;
  Details({Key? key, required this.data, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            leading: const BackButton(
              color: Colors.white,
            ),
            elevation: 0,
          ),
          body: bodypage()),
    );
  }

  Widget bodypage() {
    return Consumer<Services>(
      builder: (context, model, child) {
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Text(data.data[number].name),
                Text(data.data[number].symbol),
                Text(data.data[number].quote.cop.price.toString()),
                Text(data.data[number].quote.cop.marketCap.toString()),
                Text(data.data[number].quote.cop.percentChange1H.toString()),
                Text(data.data[number].quote.cop.percentChange24H.toString()),
              ],
            ),
          ),
        );
      },
    );
  }
}
