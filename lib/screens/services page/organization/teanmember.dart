import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThemeMemberview extends StatelessWidget {
  const ThemeMemberview({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: screenWidth * 0.9,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFF6504F9)),
                      borderRadius: BorderRadius.circular(17.65),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 86,
                            height: 86,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Abad Sait',
                                style: TextStyle(
                                  color: Color(0xFF1B0044),
                                  fontSize: 24,
                                  fontFamily: 'Biryani',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                'Project Manager',
                                style: TextStyle(
                                  color: Color(0xFF5727A3),
                                  fontSize: 11,
                                  fontFamily: 'Biryani',
                                  fontWeight: FontWeight.w300,
                                  height: 0.14,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      encodeQueryParameters(
                                          Map<String, String> params) {
                                        return params.entries
                                            .map((MapEntry<String, String> e) =>
                                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                            .join('&');
                                      }

                                      final Uri emailUri = Uri(
                                        scheme: 'mailto',
                                        path: 'ameen.33.ns@gmail.com',
                                        query: encodeQueryParameters(<String,
                                            String>{
                                          'subject': 'Give Some',
                                          'body': 'SomeThing...'
                                        }),
                                      );
                                      if (await canLaunchUrl(emailUri)) {
                                        launchUrl(emailUri);
                                      } else {
                                        throw Exception(
                                            'Could not launch $emailUri');
                                      }
                                    },
                                    child: Container(
                                      width: 39,
                                      height: 39,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFFFC107),
                                        shape: OvalBorder(),
                                      ),
                                      child: Center(
                                          child: Image.asset(
                                        'assets/Group.png',
                                        width: 20,
                                      )),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      String phoneNumber =
                                          '9995598212'; // Replace with the desired telephone number

                                      final Uri telUri = Uri(
                                        scheme: 'tel',
                                        path: phoneNumber,
                                      );

                                      if (await canLaunchUrl(telUri)) {
                                        launchUrl(telUri);
                                      } else {
                                        throw Exception(
                                            'Could not launch $telUri');
                                      }
                                    },
                                    child: Container(
                                      width: 39,
                                      height: 39,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFF2F9623),
                                        shape: OvalBorder(),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          'assets/telephone 2.png',
                                          width: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            'assets/12333.png',
                            width: 25,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            '+91 8113892003',
                            style: TextStyle(
                              color: Color(0xFF1B0044),
                              fontSize: 12,
                              fontFamily: 'Biryani',
                              fontWeight: FontWeight.w400,
                              height: 0.14,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            'assets/mailbox.png',
                            width: 25,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'abad@zeekoi.info',
                            style: TextStyle(
                              color: Color(0xFF1B0044),
                              fontSize: 11,
                              fontFamily: 'Biryani',
                              fontWeight: FontWeight.w400,
                              height: 0.14,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
