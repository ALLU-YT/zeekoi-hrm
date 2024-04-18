import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginPageScreen1 extends StatefulWidget {
  const LoginPageScreen1({Key? key}) : super(key: key);

  @override
  State<LoginPageScreen1> createState() => _LoginPageScreen1State();
}

class _LoginPageScreen1State extends State<LoginPageScreen1> {
  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    print("object");
    var status = await Permission.location.status;
    if (status.isDenied) {
      _showPermissionDialog();
    }
  }

  Future<void> _showPermissionDialog() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Location Permission Required"),
          content:
              const Text("Please grant location permission to use this app."),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                _requestLocationPermission();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isDenied) {
      // Permission still denied, show dialog again
      _showPermissionDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Image.asset(
              'assets/Attendance at Your Fingertips.png',
              width: 230,
            ),
          ),
          Image.asset(
            'assets/Finger-of-person-drawing-on-tablet-screen-3D-illustration-[Converted] 1.png',
          ),
        ],
      ),
    );
  }
}
