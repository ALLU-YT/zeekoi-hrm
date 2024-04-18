import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService extends ChangeNotifier {
  Future<bool> login(String domain) async {
    try {
      String timestamp = DateTime.now().toString();
      final headers = {
        'Authorization':
            sha1.convert(utf8.encode('${timestamp}zonar_9335')).toString(),
        'Timestamp': timestamp
      };
      Uri url = Uri.parse('$domain/api/set/url');
      var response = await http.get(url, headers: headers);
      print(response.body);

      if (response.statusCode == 200) {
        // Parse response JSON
        Map<String, dynamic> data = jsonDecode(response.body);

        // Store token and other necessary data in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('id', data['id'].toString());
        await prefs.setString('token', data['token'] ?? ''); // Store token
        await prefs.setString('domain', domain); // Store domain

        String token =
            prefs.getString('token') ?? ''; // Provide a default value
        print(token);
        return token.isNotEmpty;
      } else {
        throw Exception('Failed to authenticate');
      }
    } catch (error) {
      print('Error: $error');
      return false; // Login failed
    }
  }
}
