import 'package:flutter/material.dart';

class LoginPageScreen4 extends StatelessWidget {
  const LoginPageScreen4({Key? key}) : super(key: key);

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
                'assets/Group 5306 (3).png',
                width: 200,
              )),
          Image.asset(
            'assets/3 1.png',
          ),
        ],
      ),
    );
  }
}
