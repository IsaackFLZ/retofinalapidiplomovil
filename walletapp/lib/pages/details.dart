import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  var datas;
  DetailsPage({Key key, this.datas}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Text('BTC: ${datas.data.quote.USD.price}'),
      ),
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
