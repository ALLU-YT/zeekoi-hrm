import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  Future<bool> signin(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "";
    String id = prefs.getString('id') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $token",
      };

      print(id);
      final body = {
        'grant_type': 'password',
        'client_id': id,
        'client_secret': token,
        'username': username,
        'password': password,
      };
      print(password);
      print(username);
      final response = await http.post(
        Uri.parse('$domain/oauth/token'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final accessToken = responseData['access_token'];
        prefs.setString('access_token', accessToken);

        return true;
        // Handle successful sign-in here
      } else {
        throw Exception('Failed to sign in');
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<bool> updatePassword(BuildContext context, String currentPassword,
      String newPassword, String conformNewPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    // Show a confirmation dialog
    bool confirmUpdate = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Password Update"),
          content: const Text("Are you sure you want to update your password?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Return true if user confirms
              },
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(false); // Return false if user cancels
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );

    if (confirmUpdate != true) {
      // User canceled password update
      return false;
    }

    try {
      // Check if new password and confirm password match
      if (newPassword != conformNewPassword) {
        // Show alert box if passwords don't match
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Password Mismatch"),
              content:
                  const Text("New password and confirm password do not match."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
        return false;
      }

      final headers = {'Authorization': 'Bearer $accessToken'};
      final body = {
        'current_password': currentPassword,
        'new_password': newPassword,
        'confirm_password': conformNewPassword,
      };

      final response = await http.post(
        Uri.parse('$domain/api/user/updatePassword'),
        headers: headers,
        body: body,
      );

      print(response.body);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData);
        // Password updated successfully
        // Show a snackbar to inform the user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password updated successfully"),
            duration: Duration(seconds: 2),
          ),
        );
        return true;
      } else {
        // Password update failed
        throw Exception('Failed to update password');
      }
    } catch (e) {
      print('Error: $e');
      // Show a snackbar to inform the user about the error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to update password. Please try again."),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }
  }

  Future<void> logout(BuildContext context) async {
    // Show a confirmation dialog
    bool confirmLogout = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(true); // Return true if user confirms logout
              },
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Close the dialog without returning any value
              },
              child: const Text("No"),
            ),
          ],
        );
      },
    );

    if (confirmLogout == true) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(
          'access_token'); // Remove 'access_token' from SharedPreferences
      // Clear application data (only available on Android and iOS)
      if (Platform.isAndroid || Platform.isIOS) {
        await Future.delayed(const Duration(seconds: 1));
        if (Platform.isAndroid) {
          // Replace 'your_app_package_name' with your actual package name
          await Process.run('pm', ['clear', 'your_app_package_name']);
        } else {
          // Erase simulator data for iOS
          await Process.run('xcrun', ['simctl', 'erase', 'all']);
        }
      }

      // Show a snack bar after logout
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Logged out successfully"),
        ),
      );
    }
  }
}
