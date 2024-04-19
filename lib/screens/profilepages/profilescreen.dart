import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/userapi.dart';
import 'package:zeekoihrm/provider/cameraaccess_provider.dart';
import 'package:zeekoihrm/screens/profilepages/profilepageBasicInformation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger the getFirstName method when the widget is initialized
    Provider.of<UserProfile>(context, listen: false).getFirstName();
    Provider.of<UserProfile>(context, listen: false).getProfile();
    Provider.of<UserProfile>(context, listen: false).getEmail();
    Provider.of<UserProfile>(context, listen: false).getDepartment();
    Provider.of<UserProfile>(context, listen: false).getDepartment();
    // Provider.of<UserProfile>(context, listen: false)
    //     .requestFilesAndMediaPermission(context);
  }

  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    final name = Provider.of<UserProfile>(context, listen: false);
    String? names = name.firstName;
    print('ss --- $names');
    final provider = Provider.of<UserProfile>(listen: false, context);
    void getimage() async {
      final file = await ImagePicker().pickImage(
        // imageQuality: 75,
        source: ImageSource.gallery,
      );

      if (file?.path != null) {
        provider.UpdateUserProfile(
            File(
              file!.path,
            ),
            names!);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(
              color: Color(0xFF1B0044),
              fontSize: 17,
              fontFamily: 'Biryani',
              fontWeight: FontWeight.w700,
              height: 0.09,
            ),
          ),
        ),
        body: ListView(
          children: [
            Column(children: [
              Container(
                  width: 162,
                  height: 162,
                  decoration: const ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFF6202FD), Color(0xFFDC4982)],
                    ),
                    shape: OvalBorder(),
                  ),
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: OvalBorder(
                          side: BorderSide(width: 5, color: Colors.white),
                        ),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            getimage();
                          },
                          child: context
                                      .watch<CameraAccessProvider>()
                                      .selectedImage !=
                                  null
                              ? CircleAvatar(
                                  radius: 20,
                                  backgroundImage: MemoryImage(
                                    context
                                        .watch<CameraAccessProvider>()
                                        .image!,
                                  ),
                                )
                              : Consumer<UserProfile>(
                                  builder: (context, userProfile, child) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(70.0),
                                      child: Image.network(
                                        userProfile.Profile ??
                                            '', // Insert default URL here if Profile is null
                                        fit: BoxFit.cover,
                                        height: double.infinity,

                                        loadingBuilder:
                                            (context, child, progress) {
                                          if (progress == null) {
                                            return child;
                                          } else {
                                            return const CircularProgressIndicator();
                                          }
                                        },
                                        errorBuilder:
                                            (context, error, stackTrace) {
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
                      ),
                    ),
                  )),
              const SizedBox(
                height: 25,
              ),
              Consumer<UserProfile>(
                builder: (context, userProfile, child) {
                  return Text(
                    userProfile.firstName ??
                        'Loading...', // Display 'Loading...' if firstName is null
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
              const Text(
                'Project Manager',
                style: TextStyle(
                  color: Color(0xFF5727A3),
                  fontSize: 11,
                  fontFamily: 'Biryani',
                  fontWeight: FontWeight.w300,
                  height: 2.0,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ]),

            // Assuming SlidableContainer is intended to be placed here
            const SlidableContainer(),
          ],
        ));
  }
}
