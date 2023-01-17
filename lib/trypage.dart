import 'package:flutter/material.dart';

class TryPage extends StatelessWidget
{
  const TryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test page'),
      ),
      body: const Center(
        child: Text('test!'),
        )
      );
  }
  
}