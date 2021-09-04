import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class RestApiExample extends StatefulWidget {
  @override
  _RestApiExampleState createState() => _RestApiExampleState();
}

class _RestApiExampleState extends State<RestApiExample> {
  String data = "";

  Future<void> futureFun() async {
    Future.delayed(Duration(seconds: 4), () {
      print("work done");
    });
  }

  Future<String> getData() async {
    var url = Uri.parse(
        'http://us-central1-mobileapp-35bf2.cloudfunctions.net/getDoc');
    var response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    String data = response.body;
    return data;
  }

  @override
  void initState() {
    super.initState();

    //futureFun();
    print("INIT CALL");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: getWidgetOfPlace(),
            ),
          ),
          InkWell(
            onTap: () async {
              print("Get Data start");

              getData().then((value) {
                print("Data from server : $value");
                data = value;
                setState(() {});
              });

              print("Get Data end");
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              color: Colors.black38,
              child: Center(
                  child: Text(
                "Get Data",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              )),
            ),
          )
        ],
      ),
    ));
  }

  Widget getWidgetOfPlace() {
    return data == ""
        ? SpinKitRing(
            color: Colors.red,
            lineWidth: 13,
            size: 100,
          )
        : data == "meet"
            ? Text(
                data,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )
            : SpinKitRing(color: Colors.black38);
  }
}
