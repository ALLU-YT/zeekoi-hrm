import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Announcements extends StatelessWidget {
  const Announcements({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Announcements',
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
          Column(
            children: [
              Container(
                width: screenWidth * .9,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF6504F9)),
                    borderRadius: BorderRadius.circular(17.65),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sample Title',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.46,
                          fontFamily: 'Biryani',
                          fontWeight: FontWeight.w700,
                          height: 0.41,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ReadMoreText(
                        'Flutter is Google’s mobile UI open source framework to build high-quality Lor3em oul did take a stab at translating the almost-not-quite-Latin. According to The Guardian, Jaspreet Singh Boparai undertook the challenge with the goal of making the text “precisely as incoherent in English as it is in Latin - and to make it incoherent in the same way”. A native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                        trimLines: 5,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/folder_shared.png',
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Shared by AbdulRahman',
                            style: TextStyle(
                              color: Color(0xFF5727A3),
                              fontSize: 10.02,
                              fontFamily: 'Biryani',
                              fontWeight: FontWeight.w600,
                              height: 0.61,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
