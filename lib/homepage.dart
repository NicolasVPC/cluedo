import 'dart:convert';
import 'package:cluedo/lobbypage.dart';
import 'package:cluedo/trypage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'network_helper.dart';
import 'login.dart';
import 'request_manager.dart';

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
  var login = Login();

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
             Consumer<RequestManager>(
               builder: (context, requestManager, _) => Consumer<NetworkHelper>(
                builder: (context, networkHelper, _) => FloatingActionButton( // submit login form
                    onPressed: () {
                      NetworkHelper.sendMessage(
                        {
                          "request_type": "login",
                          "username": login.usernameContollerField.text, 
                          "pin": login.pinContollerField.text
                        }
                        ).then((response) {
                          //var decodedResponse = utf8.decode(_response!.bodyBytes);
                          var decodedBody = response!.body;
                          
                          requestManager.setRequestNewGame(jsonDecode(decodedBody));
                          
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const LobbyPage()));
                        });
                    },
                    tooltip: "Start",
                    child: const Icon(Icons.play_circle_fill))
               ),
             )
          ],
        ),
      ),
    );
  }
}
