import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zeekoihrm/Api/authentication%20..dart';
import 'package:zeekoihrm/Api/userapi.dart';
import 'package:zeekoihrm/provider/cameraaccess_provider.dart';
import 'package:zeekoihrm/screens/loginpages/loginpage_screen6.dart';
import 'package:zeekoihrm/screens/notificationScreen.dart';
import 'package:zeekoihrm/screens/profilepages/profilescreen.dart';
import 'package:zeekoihrm/screens/setting%20page/about_screen.dart';
import 'package:zeekoihrm/screens/setting%20page/privacy_security.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    Provider.of<UserProfile>(context, listen: false).getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(PageTransition(
                  child: const ProfileScreen(),
                  type: PageTransitionType.fade,
                ));
              },
              child: context.watch<CameraAccessProvider>().selectedImage != null
                  ? CircleAvatar(
                      radius: 20,
                      backgroundImage: MemoryImage(
                        context.watch<CameraAccessProvider>().image!,
                      ),
                    )
                  : Consumer<UserProfile>(
                      builder: (context, userProfile, child) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(70.0),
                          child: Image.network(
                            userProfile.Profile ??
                                '', // Insert default URL here if Profile is null
                            width: 45, // Use 'Loading...' if Profile is null
                            fit: BoxFit.cover,
                            height: 45,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) {
                                return child;
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 40,
                                height: 40,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: CircleBorder(),
                                ),
                                child: const Icon(Icons.person),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Settings',
              style: TextStyle(
                color: Color(0xFF1B0044),
                fontSize: 17,
                fontFamily: 'Biryani',
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: Image.asset(
                'assets/Frame 1.png',
                width: 30,
              ), // Icon on the right
              onPressed: () {
                Navigator.of(context).push(PageTransition(
                    child: const NotificationScreen(),
                    type: PageTransitionType.fade));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Support',
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
              onTap: () async {
                encodeQueryParameters(Map<String, String> params) {
                  return params.entries
                      .map((MapEntry<String, String> e) =>
                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                      .join('&');
                }

                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: 'ameen.33.ns@gmail.com',
                  query: encodeQueryParameters(<String, String>{
                    'subject': 'Give Some',
                    'body': 'SomeThing...'
                  }),
                );
                if (await canLaunchUrl(emailUri)) {
                  launchUrl(emailUri);
                } else {
                  throw Exception('Could not launch $emailUri');
                }
              },
              leading: Image.asset(
                'assets/Frame 5 (2).png',
                width: 30,
              ),
              title: Text('Contact Your Payroll Admin',
                  style: Theme.of(context).textTheme.displaySmall),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Divider(
              height: 0,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child:
                Text('Others', style: Theme.of(context).textTheme.displaySmall),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const PrivacySecurityScreen(),
                        type: PageTransitionType.fade));
              },
              leading: Image.asset(
                'assets/Frame 9.png',
                width: 30,
              ),
              title: Text('Privacy & Security',
                  style: Theme.of(context).textTheme.displaySmall),
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
              onTap: () async {
                encodeQueryParameters(Map<String, String> params) {
                  return params.entries
                      .map((MapEntry<String, String> e) =>
                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                      .join('&');
                }

                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: 'info@zeekoi.info',
                  query: encodeQueryParameters(<String, String>{
                    'subject': 'Give Some',
                    'body': 'SomeThing...'
                  }),
                );
                if (await canLaunchUrl(emailUri)) {
                  launchUrl(emailUri);
                } else {
                  throw Exception('Could not launch $emailUri');
                }
              },
              leading: Image.asset(
                'assets/Frame 8.png',
                width: 30,
              ),
              title: Text('App Feedback',
                  style: Theme.of(context).textTheme.displaySmall),
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
              leading: Image.asset(
                'assets/Frame 7.png',
                width: 30,
              ),
              title: Text('Rate App',
                  style: Theme.of(context).textTheme.displaySmall),
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
                Navigator.push(
                    context,
                    PageTransition(
                        child: const AboutScren(),
                        type: PageTransitionType.fade));
              },
              leading: Image.asset(
                'assets/Frame 6.png',
                width: 30,
              ),
              title: Text('About',
                  style: Theme.of(context).textTheme.displaySmall),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Divider(
              height: 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 50, 100, 20),
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  // Set a flag to indicate loading
                  isLoading = true;
                });

                AuthProvider authProvider =
                    Provider.of<AuthProvider>(context, listen: false);

                // Call the logout method
                await authProvider.logout(context);

                setState(() {
                  // Set the flag back to false after logout is completed
                  isLoading = false;
                });

                // Navigate to the login screen
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage6Screen(),
                  ),
                  (route) => false, // Remove all routes from stack
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFFEF4A51), // Set button color to red
                minimumSize: const Size(100, 50), // Set width and height
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Biryani',
                  fontWeight: FontWeight.w400,
                  height: 0.14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
