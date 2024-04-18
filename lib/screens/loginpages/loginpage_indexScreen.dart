import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zeekoihrm/screens/loginpages/loginScreen_screen4.dart';
import 'package:zeekoihrm/screens/loginpages/loginpage_screen1.dart';
import 'package:zeekoihrm/screens/loginpages/loginpage_screen2.dart';
import 'package:zeekoihrm/screens/loginpages/loginpage_screen3.dart';
import 'package:zeekoihrm/screens/loginpages/loginpage_screen5.dart';

class LoginPage_indexScreen extends StatefulWidget {
  const LoginPage_indexScreen({Key? key}) : super(key: key);

  @override
  State<LoginPage_indexScreen> createState() => _LoginPage_indexScreenState();
}

class _LoginPage_indexScreenState extends State<LoginPage_indexScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: const [
              LoginPageScreen1(),
              LoginPageScreen2(),
              LoginPageScreen3(),
              LoginPageScreen4(),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * .1 + 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DotsIndicator(
                      dotsCount: 4,
                      position: currentIndex, // Corrected here
                      decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
              bottom: 50,
              left: 280,
              child: Column(
                children: [
                  if (currentIndex == 0)
                    GestureDetector(
                      onTap: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                      child: Center(
                        child: RippleAnimation(
                          size: Size(screenWidth * 0.20, screenWidth * 0.20),
                          key: UniqueKey(),
                          duration: const Duration(seconds: 2),
                          ripplesCount: 10,
                          color: const Color.fromARGB(43, 71, 132, 189),
                          repeat: true,
                          minRadius: screenWidth * 0.05,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.5),
                            child: Center(
                                child: Container(
                              width: 61,
                              height: 61,
                              decoration: const ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    Color(0xFF40A3FF),
                                    Color(0xFFD766F7),
                                    Color(0xFFFB8027)
                                  ],
                                ),
                                shape: OvalBorder(),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/arrow_forward_ios (1).png',
                                  width: 25,
                                ),
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                  if (currentIndex == 2)
                    GestureDetector(
                      onTap: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                      child: Center(
                        child: RippleAnimation(
                          size: Size(screenWidth * 0.20, screenWidth * 0.20),
                          key: UniqueKey(),
                          duration: const Duration(seconds: 2),
                          ripplesCount: 10,
                          color: const Color.fromARGB(43, 71, 132, 189),
                          repeat: true,
                          minRadius: screenWidth * 0.05,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.5),
                            child: Center(
                                child: Container(
                              width: 61,
                              height: 61,
                              decoration: const ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    Color(0xFF39A9A7),
                                    Color(0xFF565B72)
                                  ],
                                ),
                                shape: OvalBorder(),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/arrow_forward_ios (1).png',
                                  width: 25,
                                ),
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                  if (currentIndex == 1)
                    GestureDetector(
                      onTap: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                      child: Center(
                        child: RippleAnimation(
                          size: Size(screenWidth * 0.20, screenWidth * 0.20),
                          key: UniqueKey(),
                          duration: const Duration(seconds: 2),
                          ripplesCount: 10,
                          color: const Color.fromARGB(43, 71, 132, 189),
                          repeat: true,
                          minRadius: screenWidth * 0.05,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.5),
                            child: Center(
                                child: Container(
                              width: 61,
                              height: 61,
                              decoration: const ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    Color(0xFF222E93),
                                    Color(0xFFE8B662)
                                  ],
                                ),
                                shape: OvalBorder(),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/arrow_forward_ios (1).png',
                                  width: 25,
                                ),
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 60,
              child: Column(
                children: [
                  if (currentIndex == 3)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: const LoginPage5_RippleAnimation(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFDF0EC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.02),
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xFF4865A9),
                          ),
                        ),
                        elevation: 4,
                      ),
                      child: const SizedBox(
                        width: 198,
                        height: 50.85,
                        child: Center(
                          child: Text(
                            'Let’s Get Started',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ))
        ],
      ),
    );
  }
}
