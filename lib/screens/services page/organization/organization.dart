import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zeekoihrm/Api/userapi.dart';

class Organization extends StatefulWidget {
  const Organization({Key? key}) : super(key: key);

  @override
  State<Organization> createState() => _OrganizationState();
}

class _OrganizationState extends State<Organization> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProfile>(context, listen: false).getReporting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Organization',
            style: TextStyle(
              color: Color(0xFF1B0044),
              fontSize: 17,
              fontFamily: 'Biryani',
              fontWeight: FontWeight.w700,
              height: 0.09,
            ),
          ),
        ),
        body: Consumer<UserProfile>(builder: (context, provider, _) {
          String? rEmaill = provider.rEmail;
          String? rContactNumber = provider.rContactNumber;

          return Stack(
            children: [
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Container(
                      width: 345,
                      height: 340,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: const Color(0xFF6504F9)),
                        borderRadius: BorderRadius.circular(17.65),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          const CircleAvatar(
                            radius: 40,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            provider.rFirstName.toString(),
                            style: const TextStyle(
                              color: Color(0xFF1B0044),
                              fontSize: 24,
                              fontFamily: 'Biryani',
                              fontWeight: FontWeight.w700,
                              height: 0.07,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            provider.rDesagination.toString(),
                            style: const TextStyle(
                              color: Color(0xFF5727A3),
                              fontSize: 11,
                              fontFamily: 'Biryani',
                              fontWeight: FontWeight.w300,
                              height: 0.14,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  launchEmail(rEmaill!);
                                },
                                child: Container(
                                  width: 39,
                                  height: 39,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFC107),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/Group.png',
                                      width: 20,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _launchPhone(rContactNumber!);
                                },
                                child: Container(
                                  width: 39,
                                  height: 39,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF2F9623),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/telephone 2.png',
                                      width: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/telephone 1.png',
                                width: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                provider.rContactNumber.toString(),
                                style: const TextStyle(
                                  color: Color(0xFF1B0044),
                                  fontSize: 12,
                                  fontFamily: 'Biryani',
                                  fontWeight: FontWeight.w400,
                                  height: 0.14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/mail 1.png',
                                width: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                provider.rEmail.toString(),
                                style: const TextStyle(
                                  color: Color(0xFF1B0044),
                                  fontSize: 12,
                                  fontFamily: 'Biryani',
                                  fontWeight: FontWeight.w400,
                                  height: 0.14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.65, -0.76),
                          end: Alignment(-0.65, 0.76),
                          colors: [
                            Color(0xFF5727A3),
                            Color(0xFF6053BF),
                            Color(0xFF1B0044)
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3529263A),
                            blurRadius: 16.42,
                            offset: Offset(0, 5.97),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Reporting to",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          );
        }));
  }

  Future<void> launchEmail(String rEmail) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: rEmail,
      queryParameters: {
        'subject': 'Give Some',
        'body': 'Something...',
      },
    );

    // Await the result of the launch function
    final bool launched = await launch(emailUri.toString());

    // Check if the URL was successfully launched
    if (!launched) {
      throw 'Could not launch $emailUri';
    }
  }

  Future<void> _launchPhone(String rContactNumber) async {
    final Uri telUri = Uri(
      scheme: 'tel',
      path: rContactNumber,
    );

    if (await canLaunch(telUri.toString())) {
      await launch(telUri.toString());
    } else {
      throw 'Could not launch $telUri';
    }
  }
}
