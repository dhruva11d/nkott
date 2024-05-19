












import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class SportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yakshagana Page'),
      ),
      body: Center(
        child: Text('This is Yakshagana Page'),
      ),
    );
  }
}