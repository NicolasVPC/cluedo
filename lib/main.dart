import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:provider/provider.dart';
import 'network_helper.dart';
import 'request_manager.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RequestManager()),
        ChangeNotifierProvider(create: (_) => NetworkHelper())
      ],
      child: MaterialApp(
        title: 'Cluedo',
        theme: ThemeData(
          // This is the theme of your application.
          colorScheme: const ColorScheme.dark(
            brightness: Brightness.dark,
            primary: Color.fromARGB(255, 98, 46, 27),
            onPrimary: Colors.black,
            secondary: Color.fromARGB(255, 101, 93, 15),
            onBackground: Color.fromARGB(255, 43, 43, 43)
          ),
        ),
        home: const MyHomePage(title: 'Cluedo'),
      ),
    );
  }
}