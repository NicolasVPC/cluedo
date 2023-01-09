import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _client = http.Client(); // my client to connect
  var login = Login();

  void _sendMessage(Map<String, String> data) async {
    try {
      var response = await _client.post(
          Uri.http('localhost:8008', 'whatsit/create'),
          body: data);
      var decodedResponse = utf8.decode(response.bodyBytes);
      print(decodedResponse);
      //var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map; //name=doodle&color=blue
      //var uri = Uri.parse(decodedResponse['uri'] as String);
      //print(await client.get(uri));
      // error but don't understand why
    } 
    catch(e) {
      print(e);
    } 
    // finally { // if I close the client then it is impossible to communicate with the server
    //   client.close();
    // }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            login,
            FloatingActionButton(
              onPressed: () => _sendMessage({"username": login.usernameContollerField.text, "pin": login.pinContollerField.text}),
              tooltip: "test",
              child: const Icon(Icons.abc))
          ],
        ),
      ),
    );
  }
}
