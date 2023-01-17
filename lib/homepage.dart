import 'dart:convert';
import 'package:cluedo/trypage.dart';
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

  void _sendMessage(Map<String, String> data/*, Map<String, String> response*/) async {
    try {
      print("start\n");

      http.Response _response = await _client.post(
          Uri.http('localhost:8008'), 
          headers: <String, String>{
            'content-type': 'application/json',
          },
          body: jsonEncode(data),
          encoding: Encoding.getByName('UTF-8')
        );

      print("test\n");
      var decodedResponse = utf8.decode(_response.bodyBytes);
      var decodedBody = _response.body;
      //response = jsonDecode(decodedBody);

      print("a"+decodedResponse);
      print("b"+decodedBody);
    } 
    catch(e) {
      print(e);
    }
    finally {
        Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => const TryPage()),
        );
    }
    //finally { // if I close the client then it is impossible to communicate with the server
    //  //client.close();
    //}
  }

  @override
  Widget build(BuildContext context) {
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
            login, // login form
            FloatingActionButton( // submit login form
              onPressed: () => _sendMessage({"username": login.usernameContollerField.text, "pin": login.pinContollerField.text}),
              tooltip: "Start",
              child: const Icon(Icons.play_circle_fill))
          ],
        ),
      ),
    );
  }
}
