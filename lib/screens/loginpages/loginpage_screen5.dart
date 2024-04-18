import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/authorization.dart';
import 'package:zeekoihrm/screens/loginpages/loginpage_screen6.dart';

class LoginPage5_RippleAnimation extends StatefulWidget {
  const LoginPage5_RippleAnimation({Key? key}) : super(key: key);

  @override
  State<LoginPage5_RippleAnimation> createState() =>
      _LoginPage5_RippleAnimationState();
}

class _LoginPage5_RippleAnimationState
    extends State<LoginPage5_RippleAnimation> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = "https://";
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiService>(context);
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 170,
              ),
              Center(
                child: RippleAnimation(
                  size: const Size(150, 150),
                  key: UniqueKey(),
                  duration: const Duration(milliseconds: 2300),
                  ripplesCount: 5,
                  color: const Color.fromARGB(95, 155, 177, 231),
                  repeat: true,
                  minRadius: 100,
                  child: Image.asset(
                    'assets/HRM LOGO 1 (1).png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enter your domain URL',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Biryani',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 40.93,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 0.87, color: const Color(0xFFBFBEBE)),
                      ),
                      padding: const EdgeInsets.only(left: 12, bottom: 5),
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          prefixStyle: TextStyle(
                            color: Color(0xFF626262),
                            fontSize: 13.11,
                            fontFamily: 'Biryani',
                            fontWeight: FontWeight.w400,
                          ),
                          hintStyle: TextStyle(
                            color: Color(0xFF626262),
                            fontSize: 13.11,
                            fontFamily: 'Biryani',
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF396CE8),
                    backgroundColor: const Color(0xFFE8EFFE),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFF396CE8)),
                      borderRadius: BorderRadius.circular(11.02),
                    ),
                    elevation: 4,
                  ),
                  onPressed: () async {
                    String url = controller.text.trim();
                    bool loggedIn = await provider.login(url);
                    if (loggedIn) {
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
                        MaterialPageRoute(
                            builder: (context) => const LoginPage6Screen()),
                      );
                    } else {
                      // Handle login failure
                    }
                  },
                  child: const SizedBox(
                    width: 185,
                    height: 50.85,
                    child: Center(
                      child: Text(
                        'Verify',
                        style: TextStyle(
                          color: Color(0xFF396CE8),
                          fontSize: 12.49,
                          fontFamily: 'Biryani',
                          fontWeight: FontWeight.w700,
                          height: 0.13,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Center(
                child: Image.asset(
                  'assets/zonar logo dark 1 (1).png',
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text(
                  'Developed by Zeekoi Enterprise Solutions',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 9,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
