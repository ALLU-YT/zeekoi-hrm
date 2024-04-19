import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zeekoihrm/Api/generalshiftApi.dart';
import 'package:zeekoihrm/Api/userapi.dart';
import 'package:zeekoihrm/provider/bottomsheetfunction.dart';
import 'package:zeekoihrm/provider/cameraaccess_provider.dart';
import 'package:zeekoihrm/screens/home%20page/courcel.dart';
import 'package:zeekoihrm/screens/home%20page/generalshift.dart';
import 'package:zeekoihrm/screens/notificationScreen.dart';
import 'package:zeekoihrm/screens/profilepages/profilescreen.dart';
import 'package:zeekoihrm/screens/quickaction.dart/leavetracker.dart';
import 'package:zeekoihrm/screens/quickaction.dart/payslip.dart';
import 'package:zeekoihrm/screens/services%20page/attendance/attendance.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProfile>(context, listen: false).getProfile();
    Provider.of<UserProfile>(context, listen: false).getMemo();
    Provider.of<CheckedIn>(context, listen: false).CheckClockInorNot();
    Provider.of<CheckedIn>(context, listen: false).getBirthDay();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CheckedIn>(context, listen: false);

    provider.getBirthDay();

    final birthdayList = provider.birthdayList;
    int number = provider.totalNumberOfTodayBirthdays;
    print(number);
    Brightness currentBrightness = Theme.of(context).brightness;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                child: context.watch<CameraAccessProvider>().selectedImage !=
                        null
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
                'Home',
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const GeneralShift(),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: 190,
                decoration: ShapeDecoration(
                  color: currentBrightness == Brightness.dark
                      ? const Color.fromARGB(255, 253, 253, 253)
                      : const Color(0xFFFFF6D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          'Quick Actions',
                          style: TextStyle(
                            color: Color(0xFF191919),
                            fontSize: 13.67,
                            fontFamily: 'Biryani',
                            fontWeight: FontWeight.w700,
                            height: 0.12,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .1 - 15,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.read<ButtonState>().closeFunction();
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: const PaySlip(),
                                          type: PageTransitionType.fade,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          reverseDuration: const Duration(
                                              milliseconds: 300)));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .1 +
                                          25,
                                  height: 60,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFBE7A8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.97),
                                    ),
                                  ),
                                  child: Center(
                                      child: Image.asset(
                                    'assets/Frame 2 (4).png',
                                    width: 35,
                                    height: 35,
                                  )),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              const Text(
                                'Payslip',
                                style: TextStyle(
                                  color: Color(0xFF1C1B1F),
                                  fontSize: 13.67,
                                  fontFamily: 'Biryani',
                                  fontWeight: FontWeight.w700,
                                  height: 0.12,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .1 + 10,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.read<ButtonState>().closeFunction();
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: const LeaveTracker(),
                                          type: PageTransitionType.fade,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          reverseDuration: const Duration(
                                              milliseconds: 500)));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .1 +
                                          25,
                                  height: 60,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFBE7A8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.97),
                                    ),
                                  ),
                                  child: Center(
                                      child: Image.asset(
                                    'assets/Frame 3 (1).png',
                                    width: 35,
                                    height: 35,
                                  )),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              const Text(
                                'Leave',
                                style: TextStyle(
                                  color: Color(0xFF1C1B1F),
                                  fontSize: 13.67,
                                  fontFamily: 'Biryani',
                                  fontWeight: FontWeight.w700,
                                  height: 0.12,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .1 + 10,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.read<ButtonState>().closeFunction();
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: const AttendanceScreen(),
                                          type: PageTransitionType.fade,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          reverseDuration: const Duration(
                                              milliseconds: 300)));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .1 +
                                          25,
                                  height: 60,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFBE7A8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.97),
                                    ),
                                  ),
                                  child: Center(
                                      child: Image.asset(
                                    'assets/Frame 4 (1).png',
                                    width: 35,
                                    height: 35,
                                  )),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              const Text(
                                'Attendance',
                                style: TextStyle(
                                  color: Color(0xFF1C1B1F),
                                  fontSize: 13.67,
                                  fontFamily: 'Biryani',
                                  fontWeight: FontWeight.w700,
                                  height: 0.12,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //Bday Form
              birthdayList.isEmpty
                  ? Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: 79,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFE24D7B)),
                          borderRadius: BorderRadius.circular(19),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .1 - 20,
                          ),
                          Image.asset(
                            'assets/birthday-cake 1 (1).png',
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .1 - 20,
                          ),
                          const Text(
                            'Birthday',
                            style: TextStyle(
                              color: Color(0xFFFF004E),
                              fontSize: 14.54,
                              fontFamily: 'Biryani',
                              fontWeight: FontWeight.w700,
                              height: 0.14,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .1 + 20,
                          ),
                          Text(
                            '$number Birthdays today!',
                            style: const TextStyle(
                              color: Color(0xFF191919),
                              fontSize: 12,
                              fontFamily: 'Biryani',
                              fontWeight: FontWeight.w400,
                              height: 0.16,
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 25,
              ),

              ///birthdat container////////////////////////////////////////////////////////////////////////////////
              Container(
                width: MediaQuery.of(context).size.width * .9,
                // height: 400,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFE24D7B)),
                    borderRadius: BorderRadius.circular(19),
                  ),
                ),
                // After the Bday
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 25,
                          ),
                          Image.asset(
                            'assets/birthday-cake 1 (1).png',
                            width: 45,
                            height: 45,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            'Birthday',
                            style: TextStyle(
                              color: Color(0xFFFF004E),
                              fontSize: 14.54,
                              fontFamily: 'Biryani',
                              fontWeight: FontWeight.w700,
                              height: 0.14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        itemCount: birthdayList
                            .length, // Use the length of birthdayList
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final birthday = birthdayList[
                              index]; // Get the birthday at the current index

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width * .8,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFFEFF4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(29),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .1 -
                                            25,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[300],
                                      ),
                                      child: ClipOval(
                                        child: birthday.img.isNotEmpty
                                            ? Image.network(
                                                birthday.img,
                                                fit: BoxFit.cover,
                                              )
                                            : const Icon(
                                                Icons.person,
                                                size: 30,
                                                color: Colors.grey,
                                              ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 13,
                                  ),
                                  Expanded(
                                    child: Text(
                                      birthday
                                          .name, // Use birthday object to get the name
                                      style: const TextStyle(
                                        color: Color(0xFF191919),
                                        fontSize: 11.54,
                                        fontFamily: 'Biryani',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () async {
                                        encodeQueryParameters(
                                            Map<String, String> params) {
                                          return params.entries
                                              .map((MapEntry<String, String>
                                                      e) =>
                                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                              .join('&');
                                        }

                                        final Uri emailUri = Uri(
                                          scheme: 'mailto',
                                          path: birthday
                                              .email, // Use birthday object to get the email
                                          query: encodeQueryParameters(<String,
                                              String>{
                                            'subject': 'Birthday Wishes',
                                            'body': 'SomeThing...',
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                    .3 +
                                                20,
                                        height: 36,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFFF004E),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(29),
                                          ),
                                          shadows: const [
                                            BoxShadow(
                                              color: Color(0x3F000000),
                                              blurRadius: 4,
                                              offset: Offset(0, 2),
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Image.asset(
                                              'assets/mingcute_send-fill.png',
                                              width: 20,
                                              height: 20,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'Send wishes',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontFamily: 'Biryani',
                                                fontWeight: FontWeight.w600,
                                                height: 0.20,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 55,
                    height: 55,
                    child: Container(
                      width: 41,
                      height: 41,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFFCEFD4),
                        shape: OvalBorder(),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/announcement 1 (2).png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    'Announcements',
                    style: TextStyle(
                      color: Color(0xFF191919),
                      fontSize: 13.54,
                      fontFamily: 'Biryani',
                      fontWeight: FontWeight.w700,
                      height: 0.14,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SliderScreen(),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
