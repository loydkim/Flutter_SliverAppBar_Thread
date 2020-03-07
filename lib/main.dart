import 'package:flutter/material.dart';
import 'package:pageviewwithgrid/Features.dart';
import 'package:pageviewwithgrid/MainGridList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
        buttonColor: Colors.orange
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Features(),
          GridSubject(),
          MainGridList()
        ],
      )
    );
  }
}
