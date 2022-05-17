import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_app/model/responde.dart';
import 'package:wallet_app/services/http/httpstate.dart';



abstract class HttpBase extends HttpState {
  Future<Response> coinlist();
 
  
  Response decodeResponse(http.Response response) {
    switch (response.statusCode) {
      case 401:
        setState(StateHttp.error);
        return Response<String>(
            ("Unauthorized"),);

      case 404:
        setState(StateHttp.error);
        return Response<String>(
            ("Not Found"),);

      default:
        setState(StateHttp.error);
        return Response<String>(
            ("Error"),);
    }
  }
}
