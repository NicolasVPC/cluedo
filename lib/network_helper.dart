import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper with ChangeNotifier {
  static final _client = http.Client();

  static Future<http.Response?> sendMessage(Map<String, String> data) async {
    try {
      return await _client.post(
          Uri.http('localhost:8008'), 
          headers: <String, String>{
            'content-type': 'application/json',
          },
          body: jsonEncode(data),
          encoding: Encoding.getByName('UTF-8')
        );
    } catch(e) {
      print(e);
    }
    return null;
  }
}