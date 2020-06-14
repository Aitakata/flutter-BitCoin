import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _preco = "0";

  Future<void> _atualizarValor() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);
    // print(response.body);
    setState(() {
      _preco = jsonDecode(response.body)['BRL']['buy'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        padding: EdgeInsets.all(32),
        color: Colors.blue[300],
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/bitcoin.png"),
            Padding (
              padding: EdgeInsets.only(top:30,bottom: 30),
              child: Text("R\$ ${_preco}",
                style: TextStyle(fontSize: 32),),
            ),
            RaisedButton(
              child: Text("Atualizar"),
              onPressed: _atualizarValor,
            ),
          ],
        ),
      )
    );
  }
}
