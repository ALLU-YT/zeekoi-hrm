import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:zeekoihrm/Api/generalshiftApi.dart';
import 'package:zeekoihrm/provider/changeGeneralShiftColor..dart';
import 'package:zeekoihrm/provider/stopwatchmodelprovider.dart';

class AnimationButtonHome extends StatefulWidget {
  const AnimationButtonHome({super.key});

  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<AnimationButtonHome> {
  late SharedPreferences _prefs;

  SlidableButtonPosition buttonPosition = SlidableButtonPosition.start;

  @override
  void initState() {
    super.initState();
    _loadButtonPosition();
  }

  _loadButtonPosition() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      buttonPosition =
          SlidableButtonPosition.values[_prefs.getInt('buttonPosition') ?? 0];
    });
  }

  _saveButtonPosition(SlidableButtonPosition position) async {
    setState(() {
      buttonPosition = position;
      if (position == SlidableButtonPosition.end) {
        result = 'Button is at the right';
      } else {
        result = 'Button is on the left';
      }
    });
    _prefs.setInt('buttonPosition', position.index);
  }

  String result = ''; // Declare a variable to store the result
  String buttonLabel = 'Slide Me';
  String appContent = 'Slide to check In';
  Color buttonColor2 = const Color(0xFFFB644B);
  Image appImage = Image.asset(
    'assets/Mask group.png',
    width: 100,
  );
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ApplyLeaveProvider>(context);
    final provider = Provider.of<CheckedIn>(context);
    Future<Position> determinePosition() async {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      return await Geolocator.getCurrentPosition();
    }

    Future<String> getIPAddress() async {
      final interfaces = await NetworkInterface.list();
      for (final interface in interfaces) {
        final addresses = interface.addresses;
        for (final address in addresses) {
          // Check if this is a non-loopback IPv4 address
          if (address.type == InternetAddressType.IPv4 && !address.isLoopback) {
            return address.address;
          }
        }
      }
      return 'Unknown';
    }

    void getimage() async {
      final file = await ImagePicker().pickImage(
        imageQuality: 75,
        source: ImageSource.camera,
      );

      if (file?.path != null) {
        provider.clockInfn('clock_in', File(file!.path),
            await determinePosition(), await getIPAddress(), context);
      }
    }

    void getimage2() async {
      final file = await ImagePicker().pickImage(
        imageQuality: 75,
        source: ImageSource.camera,
      );

      if (file?.path != null) {
        provider.clockInfn('clock_out', File(file!.path),
            await determinePosition(), await getIPAddress(), context);
      }
    }

    return
        // bool? checkedin = attendance.checkclockin;

        Center(
      child: HorizontalSlidableButton(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 60,
        buttonWidth: 60,
        dismissible: false,
        initialPosition: buttonPosition,
        color: buttonColor2,
        label: Center(child: appImage),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              appContent,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.76,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
        onChanged: (position) async {
          _saveButtonPosition(position); // Save button position
          setState(() {
            if (position == SlidableButtonPosition.end) {
              context.read<ChangeGeneralShiftColor>().changeColorToBlack();
              context.read<CheckedIn>().CheckClockInorNot();
              context.read<StopwatchModel>().startTimer();
              print('object');
              getimage();
              result = 'Button is on the right';
              buttonLabel = 'Slide Right';
              appContent = 'Slide to check Out';
              appImage = Image.asset('assets/Mask group (1).png', width: 100);
              buttonColor2 = const Color.fromARGB(255, 18, 231, 22);
            } else if (position == SlidableButtonPosition.start) {
              context.read<ChangeGeneralShiftColor>().changeColorblue();
              context.read<StopwatchModel>().disposeTimer();
              getimage2();
              result = 'Button is on the left';
              appContent = 'Slide to check in';
              buttonLabel = 'Slide Me';
              buttonColor2 = const Color(0xFFFB644B);
            }
          });
        },
      ),
    );
  }
}
