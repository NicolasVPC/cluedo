import 'package:flutter/material.dart';

class Login extends StatefulWidget {
    final TextEditingController _usernameContollerField = TextEditingController();
    final TextEditingController _pinContollerField = TextEditingController();

    TextEditingController get usernameContollerField => _usernameContollerField;

    TextEditingController get pinContollerField => _pinContollerField;

    Login({super.key});

    @override
    State<Login> createState() => _LoginState();

    String getUsername() => _usernameContollerField.text;
    String getPin() => _pinContollerField.text;
}

class _LoginState extends State<Login>{
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Inserisci il tuo nome ed un pin per la partita:',
          ),
          Form(child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: widget.usernameContollerField,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: widget.pinContollerField,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'pin',
                ),
              ),
            ),
          ],)
          ),
        ],
      ),
    );
  }
}