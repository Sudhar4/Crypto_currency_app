import 'package:currency_app/curr.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';
//import 'package:currency_app/curr.dart';
//import 'package:nav_app/nav.dart';
void main() async {
 List c=await getcurrencies();
  runApp(curr(c));
}

class curr extends StatelessWidget{
List c;
curr(this.c);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home:currencyv(c),
    );
  }
}

Future<List> getcurrencies() async{
  String appurl="https://api.coinmarketcap.com/v1/ticker/";
  http.Response response=await http.get(appurl);
  return json.decode(response.body);
}
