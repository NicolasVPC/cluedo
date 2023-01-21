import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'request_manager.dart';

class LobbyPage extends StatelessWidget
{
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RequestManager>(
      builder: (context, requestManager, _) => Scaffold(
        appBar: AppBar(
          title: const Text('Lobby'),
        ),
        body: Center(
          child: Text(requestManager.getDummy()),
          )
        )
      );
  }
  
}