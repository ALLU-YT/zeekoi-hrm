import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Privacy & Security',
            style: TextStyle(
              color: Color(0xFF1B0044),
              fontSize: 17,
              fontFamily: 'Biryani',
              fontWeight: FontWeight.w700,
              height: 0.09,
            ),
          ),
          backgroundColor: Colors
              .white, // Assuming you want a white background for the app bar
        ),
        body: ListView(children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Policies',
              style: TextStyle(
                color: Color(0xFF5727A3),
                fontSize: 15,
                fontFamily: 'Biryani',
                fontWeight: FontWeight.w700,
                height: 0.14,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              onTap: () {
                const url =
                    'https://zeekoi.com/zerp/zonar-hr-terms-and-conditions/'; // Replace with your URL
                launch(url);
              },
              leading: Image.asset(
                'assets/Frame 9 (1).png',
                width: 30,
              ),
              title: const Text(
                'Terms of service',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Biryani',
                  fontWeight: FontWeight.w500,
                  height: 0.14,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Divider(
              height: 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              onTap: () {
                const url = "https://zeekoi.com/zerp/zonar-hr-privacy-policy/";
                launch(url);
              },
              leading: Image.asset(
                'assets/Frame 5.png',
                width: 30,
              ),
              title: const Text(
                'Privacy Policy',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Biryani',
                  fontWeight: FontWeight.w500,
                  height: 0.14,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Divider(
              height: 0,
            ),
          ),
        ]));
  }
}
