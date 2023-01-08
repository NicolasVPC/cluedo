import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cluedo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark,
          primary: Color.fromARGB(255, 98, 46, 27),
          onPrimary: Colors.black,
          secondary: Color.fromARGB(255, 101, 93, 15),
          onBackground: Color.fromARGB(255, 43, 43, 43)
        ),
      ),
      home: const MyHomePage(title: 'Cluedo'),
    );
  }
}