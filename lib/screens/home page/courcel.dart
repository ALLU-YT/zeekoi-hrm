import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/userapi.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProfile>(builder: (context, provider, _) {
      final memoList = provider.memoModelList;

      if (memoList.isEmpty) {
        return Center(
            child: Container(
          width: MediaQuery.of(context).size.width * .9,
          height: 196,
          decoration: BoxDecoration(
            color: const Color(0xFFFFEBC4),
            borderRadius: BorderRadius.circular(19),
          ),
          child: const Center(child: Text("No data")),
        ));
      } else {
        return Column(
          children: [
            CarouselSlider(
              items: memoList.map((memo) {
                return Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 196,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBC4),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(memo.name),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Center(
                            child: Text(
                              memo.description, // Display description here
                              style: const TextStyle(
                                color: Color(0xFF191919),
                                fontSize: 14,
                                fontFamily: 'Biryani',
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: memoList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: currentIndex == entry.key ? 17 : 7,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 3.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == entry.key
                          ? const Color.fromARGB(255, 2, 6, 240)
                          : const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      }
    });
  }
}
