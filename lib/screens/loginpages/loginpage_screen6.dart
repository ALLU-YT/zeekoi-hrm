import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/authentication%20..dart';
import 'package:zeekoihrm/screens/bottomnavbar.dart';

class LoginPage6Screen extends StatefulWidget {
  const LoginPage6Screen({Key? key}) : super(key: key);

  @override
  State<LoginPage6Screen> createState() => _LoginPage6ScreenState();
}

class _LoginPage6ScreenState extends State<LoginPage6Screen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login 3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * .5 + 45,
                ),
                SizedBox(
                  width: screenWidth * 0.9,
                  height: 45,
                  child: Container(
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          const Color(0xFF2E2F30),
                          Colors.white.withOpacity(0),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 0.87,
                          color: Color(0xFFBFBEBE),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter a valid username";
                                }
                                return null;
                              },
                              controller: usernameController,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                                hintText: "username",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                SizedBox(
                  width: screenWidth * 0.9,
                  height: 45,
                  child: Container(
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          const Color(0xFF2E2F30),
                          Colors.white.withOpacity(0),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 0.87,
                          color: Color(0xFFBFBEBE),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter a valid Password";
                              }
                              return null;
                            },
                            controller:
                                passwordController, // You need to provide your own controller
                            style: const TextStyle(color: Colors.white),
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200),
                              hintText: "Password",
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.06,
                ),
                GestureDetector(
                  onTap: () async {
                    String username = usernameController.text.trim();
                    String password = passwordController.text.trim();
                    bool singIn = await provider.signin(username, password);
                    if (singIn) {
                      // Show circular progress indicator
                      showDialog(
                        context: context,
                        barrierDismissible:
                            false, // prevents dismissing dialog with tap
                        builder: (BuildContext context) {
                          return const Center(
                            child:
                                CircularProgressIndicator(), // Circular progress indicator
                          );
                        },
                      );

                      // Navigate to another page after a short delay (for demonstration)
                      // Replace this with your actual navigation code
                      await Future.delayed(
                          const Duration(seconds: 2)); // Simulate delay
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NavBar()),
                      );
                    } else {
                      // Handle login failure
                    }
                  },
                  child: Center(
                    child: RippleAnimation(
                      size: Size(screenWidth * 0.25, screenWidth * 0.25),
                      key: UniqueKey(),
                      duration: const Duration(milliseconds: 5000),
                      ripplesCount: 25,
                      color: const Color(0x99D1D1D1),
                      repeat: true,
                      minRadius: screenWidth *
                          0.05, // Specify width and height for the size
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(screenWidth * 0.5),
                        child: Center(
                          child: Image.asset(
                            'assets/Group 5308.png',
                            width: screenWidth * 0.2,
                            height: screenWidth * 0.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.040,
                ),
                Text(
                  'Developed by Zeekoi Enterprise Solutions',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.022,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
