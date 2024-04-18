import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:zeekoihrm/screens/bottomnavbar.dart';

// import 'package:zeekoihrm/screens/bottomnavbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeekoihrm/Api/LeaveTrakerapi/l.dart';
import 'package:zeekoihrm/Api/LeaveTrakerapi/leaveReq.dart';
import 'package:zeekoihrm/Api/LeaveTrakerapi/leaveTracerApiAll.dart';
// import 'package:zeekoihrm/Api/LeaveTrakerapi/leaveTrackerPostMethod.dart';
import 'package:zeekoihrm/Api/attendancelistApiProvider.dart';
import 'package:zeekoihrm/Api/authentication%20..dart';
import 'package:zeekoihrm/Api/authorization.dart';
import 'package:zeekoihrm/Api/generalshiftApi.dart';
import 'package:zeekoihrm/Api/getPayrollApiProvider.dart';
import 'package:zeekoihrm/Api/userapi.dart';
import 'package:zeekoihrm/provider/bottomsheetfunction.dart';
import 'package:zeekoihrm/provider/cameraaccess_provider.dart';
import 'package:zeekoihrm/provider/changeGeneralShiftColor..dart';
import 'package:zeekoihrm/provider/stopwatchmodelprovider.dart';
import 'package:zeekoihrm/screens/bottomnavbar.dart';
import 'package:zeekoihrm/screens/loginpages/loginpage_indexScreen.dart';
// import 'package:zeekoihrm/screens/loginpages/loginpage_indexScreen.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var KDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ButtonState()),
          ChangeNotifierProvider(create: (context) => Lapi()),
          ChangeNotifierProvider(create: (context) => CameraAccessProvider()),
          ChangeNotifierProvider(
              create: (context) => ChangeGeneralShiftColor()),
          ChangeNotifierProvider(create: (context) => ApiService()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => UserProfile()),
          ChangeNotifierProvider(create: (context) => CheckedIn()),
          ChangeNotifierProvider(create: (context) => StopwatchModel()),
          ChangeNotifierProvider(
              create: (context) => AttendanceListApiProvider()),
          ChangeNotifierProvider(create: (context) => GetPayRollApiProvider()),
          ChangeNotifierProvider(create: (context) => LeaveTrackerApiAll()),
          ChangeNotifierProvider(create: (context) => LeaveReq()),
        ],
        child: MaterialApp(
          darkTheme: ThemeData.dark().copyWith(
            colorScheme: KDarkColorScheme,
            textTheme: ThemeData().textTheme.copyWith(
                  // Define your custom text styles here
                  displaySmall: const TextStyle(
                    color: Color.fromARGB(255, 250, 250, 250),
                    fontSize: 13.67,
                    fontFamily: 'Biryani',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                  ),
                  // You can define more text styles as needed
                ),
          ),
          theme: ThemeData().copyWith(
            colorScheme: kColorScheme,
            textTheme: ThemeData().textTheme.copyWith(
                  // Define your custom text styles here
                  displaySmall: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 13.67,
                    fontFamily: 'Biryani',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                  ),
                  // You can define more text styles as needed
                ),
          ),
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          home: const AuthenticationWrapper(),
          // home: const NavBar(),
        ));
  }
}

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({super.key});

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  void checkUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('token');
    print(accessToken);
    setState(() {
      _isLoading = false;
    });

    if (accessToken != null) {
      // User is logged in, navigate to navbar screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavBar()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // You can show a loading indicator here if needed
      return const CircularProgressIndicator();
    } else {
      // If user is not logged in, navigate to login screen
      return const LoginPage_indexScreen();
    }
  }
}
