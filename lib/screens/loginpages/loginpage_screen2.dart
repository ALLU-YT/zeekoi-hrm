import 'package:flutter/material.dart';

class LoginPageScreen2 extends StatelessWidget {
  const LoginPageScreen2({Key? key}) : super(key: key);

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
                'assets/Group 5306 (1).png',
                width: 230,
              )),
          Image.asset(
            'assets/12556086_4992942 1.png',
          )
        ],
      ),
    );
  }
}
