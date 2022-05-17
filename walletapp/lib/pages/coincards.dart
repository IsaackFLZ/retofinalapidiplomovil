import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import '../model/dataresponsecoinmarketcapapi.dart';
import '../services/servicesconfig.dart';
import '../services/http/httpbase.dart';
import '../services/http/httpstate.dart';
import '../model/responde.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Services extends HttpBase {
  Services() {
    setState(StateHttp.waiting);
  }
  @override
  Future<Response> coinlist() async {
    http.Client client = http.Client();
    try {
      http.Response response = await client.get(
        Uri.parse(ServicesConfig.baseUrl),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },

      ).timeout(Duration(seconds: 10));
      print(response.body);
      print(Uri.parse(ServicesConfig.baseUrl));
      final Response responseData = decodeResponse(response);

      
      return responseData;
    } on SocketException catch (e) {
      setState(StateHttp.error);
      return Response<String>(
        ("Error"),
      );
    }
  }

  @override
  Response decodeResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        setState(StateHttp.completed);
        return Response<DataResponseCoinMarketCapApi>(
          DataResponseCoinMarketCapApi.fromJson(json.decode(response.body)),
        );
      case 401:
        setState(StateHttp.error);
        return Response<String>(
          ("Unauthorized"),
        );

      case 404:
        setState(StateHttp.error);
        return Response<String>(
          ("Not Found"),
        );

      default:
        setState(StateHttp.error);
        return Response<String>(
          ("Error"),
        );
    }
  }
}

class CoinCard extends StatelessWidget {
  final DataResponseCoinMarketCapApi coin;

  const CoinCard({Key key, this.coin}) : super(key: key);

    
  @override
  Widget build(BuildContext context) {
    return Provider <Services>(
      create: (_) => Services(),
      child: Scaffold(
        body: ListView.builder(
      itemCount: coin.data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
            title: Text(coin.data[index].name),
            subtitle: Text(coin.data[index].symbol),
            trailing: Text(coin.data[index].quote.cop.price.toString()),
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: coin.data[index]);
            },
          ),
          
        )
          );
          
      },
    ))
        
    );
    
  }
}



