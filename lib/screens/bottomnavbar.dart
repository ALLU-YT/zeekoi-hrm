import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/provider/bottomsheetfunction.dart';
import 'package:zeekoihrm/screens/Requests/Requests.dart';
import 'package:zeekoihrm/screens/home%20page/home.dart';
import 'package:zeekoihrm/screens/quickaction.dart/applyLeave.dart';
import 'package:zeekoihrm/screens/services%20page/organization/organization.dart';
import 'package:zeekoihrm/screens/services%20page/organization/servicesscreen.dart';
import 'package:zeekoihrm/screens/setting%20page/settingscreen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0; // Change this to the desired starting index
  String _selectedImagePath = 'assets/home 1 (2).png';
  String _selectedImagePath1 = 'assets/more 1 (4).png';
  String _selectedImagePath3 = 'assets/check 1.png';
  String _selectedImagePath4 = 'assets/setting 1.png';

  final List<Widget> _screens = [
    const HomeScreen(), // Placeholder for screen at index 0
    const ServicesScreen(), // Placeholder for screen at index 1
    Container(),
    const Approvals(), // Placeholder for screen at index 2
    const SettingScreen(), // Placeholder for screen at index 4
  ];

  void OnTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 0) {
        _selectedImagePath = 'assets/home 1 (3).png';
      } else {
        _selectedImagePath = 'assets/home 1 (2).png';
      }
      if (index == 1) {
        _selectedImagePath1 = 'assets/more 1 (2).png';
      } else {
        _selectedImagePath1 = 'assets/more 1.jpg';
      }

      if (index == 3) {
        _selectedImagePath3 = 'assets/check 1 (1).png';
      } else {
        _selectedImagePath3 = 'assets/check 1.png';
      }
      if (index == 4) {
        _selectedImagePath4 = 'assets/setting 1 (1).png';
      } else {
        _selectedImagePath4 = 'assets/setting 1.png';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_currentIndex],
          Positioned(
              top: MediaQuery.of(context).size.height * .7,
              child: context.watch<ButtonState>().isVisible
                  ? Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(22),
                          topLeft: Radius.circular(22),
                        ),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 35,
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<ButtonState>().closeFunction();
                                  Navigator.of(context).push(PageTransition(
                                      child: const ApplyLeave(),
                                      type: PageTransitionType.fade));
                                },
                                icon: Image.asset(
                                  'assets/Frame 3 (2).png',
                                  width: 40,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  context.read<ButtonState>().closeFunction();
                                  Navigator.of(context).push(PageTransition(
                                      child: const Organization(),
                                      type: PageTransitionType.fade));
                                },
                                icon: Image.asset(
                                  'assets/Frame 3 (3).png',
                                  width: 40,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  context.read<ButtonState>().closeFunction();
                                  Navigator.of(context).push(PageTransition(
                                      child: const Organization(),
                                      type: PageTransitionType.fade));
                                },
                                icon: Image.asset(
                                  'assets/Frame 3 (4).png',
                                  width: 40,
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 28,
                              ),
                              Text(
                                'Apply Leave',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.76,
                                  fontFamily: 'Biryani',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '    My team',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.76,
                                  fontFamily: 'Biryani',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Reporting to',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.76,
                                  fontFamily: 'Biryani',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 37,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Container()),
          Positioned(
            bottom: 0,
            child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          OnTapped(0);
                        },
                        icon: Image.asset(_selectedImagePath, width: 30),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          OnTapped(1);
                        },
                        icon: Image.asset(_selectedImagePath1,
                            width: 30 // Adjust width dynamically
                            ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          context.read<ButtonState>().toggleVisibility();
                        },
                        icon: Image.asset(
                            context.watch<ButtonState>().selectedImagePath2,
                            width: 40),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          OnTapped(3);
                        },
                        icon: Image.asset(_selectedImagePath3, width: 30),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          OnTapped(4);
                        },
                        icon: Image.asset(_selectedImagePath4, width: 30),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.08,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color:
                              _currentIndex == 0 ? Colors.blue : Colors.black,
                          fontSize: MediaQuery.of(context).size.width *
                              0.03, // Adjust font size dynamically
                          fontFamily: 'Biryani',
                          fontWeight: FontWeight.w700,
                          height: 0.20,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.07,
                      ),
                      Text(
                        'Services',
                        style: TextStyle(
                          color:
                              _currentIndex == 1 ? Colors.blue : Colors.black,
                          fontSize: MediaQuery.of(context).size.width *
                              0.03, // Adjust font size dynamically
                          fontFamily: 'Biryani',
                          fontWeight: FontWeight.w700,
                          height: 0.20,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.09,
                      ),
                      Container(
                        height: 2,
                        width: 30,
                        color: context.read<ButtonState>().isVisible
                            ? const Color.fromARGB(255, 33, 150, 243)
                            : const Color.fromARGB(255, 228, 212, 212),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.08,
                      ),
                      Text(
                        'Requests',
                        style: TextStyle(
                          color:
                              _currentIndex == 3 ? Colors.blue : Colors.black,
                          fontSize: MediaQuery.of(context).size.width *
                              0.03, // Adjust font size dynamically
                          fontFamily: 'Biryani',
                          fontWeight: FontWeight.w700,
                          height: 0.20,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Settings',
                        style: TextStyle(
                          color:
                              _currentIndex == 4 ? Colors.blue : Colors.black,
                          fontSize: MediaQuery.of(context).size.width *
                              0.03, // Adjust font size dynamically
                          fontFamily: 'Biryani',
                          fontWeight: FontWeight.w700,
                          height: 0.20,
                        ),
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
