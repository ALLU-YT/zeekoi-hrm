import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFF1B0044),
            fontSize: 17,
            fontFamily: 'Biryani',
            fontWeight: FontWeight.w700,
            height: 0.09,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/mail-box 1.png',
              width: 100,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Uhh... There are no notifications at the\nmoment.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF454547),
                fontSize: 13.55,
                fontFamily: 'Biryani',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
