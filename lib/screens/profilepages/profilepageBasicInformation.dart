import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/authentication%20..dart';
import 'package:zeekoihrm/Api/userapi.dart';

class SlidableContainer extends StatefulWidget {
  const SlidableContainer({Key? key}) : super(key: key);

  @override
  State<SlidableContainer> createState() => _SlidableContainerState();
}

class _SlidableContainerState extends State<SlidableContainer> {
  int _currentState = 1;

  void _onClick() {
    setState(() {
      if (_currentState == 1) {
        _currentState = 2;
      } else if (_currentState == 2) {
        _currentState = 3;
      } else {
        _currentState = 1;
      }
    });
  }

  void _onClickBack() {
    setState(() {
      if (_currentState == 2) {
        _currentState = 1;
      }
    });
  }

  void _onClickBacked() {
    setState(() {
      if (_currentState == 3) {
        _currentState = 2;
      }
    });
  }

  String email = ''; // Define a variable to hold the email
  @override
  void initState() {
    super.initState();
    // Trigger the getFirstName method when the widget is initialized

    Provider.of<UserProfile>(context, listen: false).getEmail();
    Provider.of<UserProfile>(context, listen: false).getfullname();
    Provider.of<UserProfile>(context, listen: false).getPhoneNumber();
    Provider.of<UserProfile>(context, listen: false).getDob();
    Provider.of<UserProfile>(context, listen: false).getGender();

    Provider.of<UserProfile>(context, listen: false).getDesagination();
  }

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController ConformnewPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final updateprovider = Provider.of<AuthProvider>(context);
    if (_currentState == 1) {
      return Consumer<UserProfile>(builder: (context, userprofile, child) {
        String email = userprofile.email ?? 'Loading...';
        String fullName = userprofile.fullname ?? 'Loading...';
        String phonumber = userprofile.mobile ?? 'Null..';
        String dob = userprofile.dob ?? "Loading...";
        String gender = userprofile.gender ?? "Loading...";

        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 46,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2F2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 135,
                  ),
                  const Text(
                    'Basic Information',
                    style: TextStyle(
                      color: Color(0xFF1B0044),
                      fontSize: 15,
                      fontFamily: 'Biryani',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: _onClick,
                    icon: Image.asset(
                      'assets/arrow_back_ios.png',
                      width: 12,
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                customListTile('assets/Frame 15.png', fullName),
                customListTile('assets/Frame 15 (1).png', email),
                customListTile('assets/Frame 15 (3).png', phonumber),
                customListTile('assets/event.png', dob),
                customListTile('assets/for_you.png', gender),
                customListTile('assets/Frame 15 (4).png', 'Married'),
                customListTile('assets/Frame 15 (5).png', 'Blood group'),
              ],
            ),
          ],
        );
      });
    } else if (_currentState == 2) {
      return Consumer<UserProfile>(builder: (context, userprofile, child) {
        String basicSalary = userprofile.basicSalary ?? "Loading...";
        String dob = userprofile.dob ?? "Loading...";
        String getDepartment = userprofile.department ?? "Loading...";
        String getDesagination = userprofile.designation ?? "Loading...";
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 46,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2F2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: _onClickBack,
                    icon: Image.asset(
                      'assets/arrow_back_ios (1).png',
                      width: 12,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .2 + 25,
                  ),
                  const Expanded(
                    child: Text(
                      'HRM Details',
                      style: TextStyle(
                        color: Color(0xFF1B0044),
                        fontSize: 15,
                        fontFamily: 'Biryani',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  IconButton(
                    onPressed: _onClick,
                    icon: Image.asset(
                      'assets/arrow_back_ios.png',
                      width: 12,
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                customListTile('assets/deployed_code.png', getDepartment),
                customListTile('assets/person.png', getDesagination),
                customListTile(
                    'assets/account_balance_wallet.png', 'rs $basicSalary'),
                customListTile('assets/for_you.png', dob),
              ],
            ),
          ],
        );
      });
    } else {
      return Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 46,
            decoration: const BoxDecoration(
              color: Color(0xFFF2F2F2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: _onClickBacked,
                  icon: Image.asset(
                    'assets/arrow_back_ios (1).png',
                    width: 12,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .1 + 5,
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Edit Password',
                      style: TextStyle(
                        color: Color(0xFF1B0044),
                        fontSize: 15,
                        fontFamily: 'Biryani',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                IconButton(
                  onPressed: _onClick,
                  icon: Image.asset(
                    'assets/arrow_back_ios.png',
                    width: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          ///Passwod Generate........................................................
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Current Password',
                        style: TextStyle(
                          color: Color(0xFF3E3E3E),
                          fontSize: 15.38,
                          fontFamily: 'Biryani',
                          fontWeight: FontWeight.w400,
                          height: 0.10,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Transform.rotate(
                        angle: -1.57,
                        child: Container(
                          width: 32.47,
                          height: 3.42,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(270.04),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 180,
                        height: 35,
                        child: TextField(
                          controller:
                              currentPasswordController, // Controller for current password field
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(bottom: 10, left: 10),
                            filled: true,
                            fillColor: const Color(0xFFF2EFEF),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(270.04),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('New Password       ',
                        style: TextStyle(
                          color: Color(0xFF3E3E3E),
                          fontSize: 15.38,
                          fontFamily: 'Biryani',
                          fontWeight: FontWeight.w400,
                          height: 0.10,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Transform.rotate(
                        angle: -1.57,
                        child: Container(
                          width: 32.47,
                          height: 3.42,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(270.04),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 180,
                        height: 35,
                        child: TextField(
                          controller:
                              newPasswordController, // Controller for new password field
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(bottom: 10, left: 10),
                            filled: true,
                            fillColor: const Color(0xFFF2EFEF),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(270.04),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('confirm password',
                        style: TextStyle(
                          color: Color(0xFF3E3E3E),
                          fontSize: 15.38,
                          fontFamily: 'Biryani',
                          fontWeight: FontWeight.w400,
                          height: 0.10,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Transform.rotate(
                        angle: -1.57,
                        child: Container(
                          width: 32.47,
                          height: 3.42,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(270.04),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 180,
                        height: 35,
                        child: TextField(
                          controller:
                              ConformnewPasswordController, // Controller for new password field
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(bottom: 10, left: 10),
                            filled: true,
                            fillColor: const Color(0xFFF2EFEF),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(270.04),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    String currentPassword = currentPasswordController.text;
                    String newPassword = newPasswordController.text;
                    String conformnewPasswordController =
                        ConformnewPasswordController.text;
                    updateprovider.updatePassword(context, currentPassword,
                        newPassword, conformnewPasswordController);
                  },
                  child: Container(
                    width: 198,
                    height: 46.85,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE8EFFE),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFF396CE8)),
                        borderRadius: BorderRadius.circular(11.02),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Change Password',
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
                )
              ],
            ),
          )
        ],
      );
    }
  }

  Widget customListTile(String leadingImage, String text) {
    return ListTile(
      title: Row(
        children: [
          Image.asset(
            leadingImage,
            width: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Transform.rotate(
              angle: -1.57,
              child: Container(
                width: 32.47,
                height: 3.42,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(270.04),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF3E3E3E),
                fontSize: 15.38,
                fontFamily: 'Biryani',
                fontWeight: FontWeight.w400,
                height: 0.10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
