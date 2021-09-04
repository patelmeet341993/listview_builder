import 'package:flutter/material.dart';
import 'package:listview_builder/screens/list_demo.dart';
import 'package:listview_builder/screens/rest_api_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: RestApiExample(),
    );
  }
}
