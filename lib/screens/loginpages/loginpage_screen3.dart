import 'package:flutter/material.dart';

class LoginPageScreen3 extends StatelessWidget {
  const LoginPageScreen3({Key? key}) : super(key: key);

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
                'assets/Group 5306 (2).png',
                width: 200,
              )),
          Image.asset(
            'assets/18223196_Making_Payments_online 1.png',
          )
        ],
      ),
    );
  }
}
