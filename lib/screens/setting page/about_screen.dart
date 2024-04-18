import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScren extends StatelessWidget {
  const AboutScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'About',
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
              'Version',
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
                leading: Image.asset(
                  'assets/help_clinic.png',
                  width: 15,
                ),
                title: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                  child: Text(
                    '1.2.0 (beta)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontFamily: 'Biryani',
                      fontWeight: FontWeight.w400,
                      height: 0.14,
                    ),
                  ),
                )),
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
                const url =
                    'https://play.google.com/store/apps/dev?id=4855857158956203933&pli=1';
                launch(url);
              },
              leading: Image.asset(
                'assets/Zonar App logo 1.png',
                width: 30,
              ),
              title: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Zonar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 0.12,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 82,
                        height: 20,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFD9302C),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Center(
                          child: Text(
                            'CLOUD ERP ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.42,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Unified Business Ecosystem',
                      style: TextStyle(
                        color: Color(0xFF7A86A1),
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.05,
                      ),
                    ),
                  )
                ],
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
