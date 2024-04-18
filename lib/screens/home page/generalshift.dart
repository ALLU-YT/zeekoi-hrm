import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/generalshiftApi.dart';
import 'package:zeekoihrm/provider/changeGeneralShiftColor..dart';
import 'package:zeekoihrm/provider/stopwatchmodelprovider.dart';
import 'package:zeekoihrm/screens/home%20page/animationButton.dart';

class GeneralShift extends StatefulWidget {
  const GeneralShift({super.key});

  @override
  State<GeneralShift> createState() => _GeneralShiftState();
}

class _GeneralShiftState extends State<GeneralShift> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckedIn>(builder: (context, value, child) {
      final startTime = value.startTimee;
      final endTime = value.endTime;

      return Container(
        width: MediaQuery.of(context).size.width * .9,
        height: 245,
        decoration: ShapeDecoration(
          color: context.watch<ChangeGeneralShiftColor>().colors,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<StopwatchModel>(builder: (context, stopwatchmodel, _) {
                  return StreamBuilder<int>(
                      stream: stopwatchmodel.rawTime,
                      initialData: 0,
                      builder: (context, snapshot) {
                        final int milliseconds = snapshot.data!;
                        final int hours = (milliseconds ~/
                            (1000 * 60 * 60)); // Convert milliseconds to hours

                        return Container(
                          width: MediaQuery.of(context).size.width * .1 + 18,
                          height: 50.88,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFFD9302C)),
                              borderRadius: BorderRadius.circular(9.18),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '$hours',
                              style: const TextStyle(
                                color: Color(0xFFDB342A),
                                fontSize: 14.18,
                                fontFamily: 'Biryani',
                                fontWeight: FontWeight.w700,
                                height: 0.11,
                              ),
                            ),
                          ),
                        );
                      });
                }),
                const Padding(
                  padding: EdgeInsets.all(3),
                  child: Text(
                    ':',
                    style: TextStyle(
                      color: Color(0xFFDB342A),
                      fontSize: 11.41,
                      fontFamily: 'Biryani',
                      fontWeight: FontWeight.w700,
                      height: 0.14,
                    ),
                  ),
                ),
                Consumer<StopwatchModel>(builder: (context, stopwatchmodel, _) {
                  return StreamBuilder<int>(
                      stream: stopwatchmodel.rawTime,
                      initialData: 0,
                      builder: (context, snapshot) {
                        final int minutes = (snapshot.data! ~/ 1000) ~/
                            60; // Convert milliseconds to minutes
                        return Container(
                          width: MediaQuery.of(context).size.width * .1 + 18,
                          height: 50.88,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFFD9302C)),
                              borderRadius: BorderRadius.circular(9.18),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              minutes.toString(),
                              style: const TextStyle(
                                color: Color(0xFFDB342A),
                                fontSize: 14.18,
                                fontFamily: 'Biryani',
                                fontWeight: FontWeight.w700,
                                height: 0.11,
                              ),
                            ),
                          ),
                        );
                      });
                }),
                const Padding(
                  padding: EdgeInsets.all(3),
                  child: Text(
                    ':',
                    style: TextStyle(
                      color: Color(0xFFDB342A),
                      fontSize: 11.41,
                      fontFamily: 'Biryani',
                      fontWeight: FontWeight.w700,
                      height: 0.14,
                    ),
                  ),
                ),
                Consumer<StopwatchModel>(builder: (context, stopwatchmodel, _) {
                  return StreamBuilder<int>(
                      stream: stopwatchmodel.rawTime,
                      initialData: 0,
                      builder: (context, snapshot) {
                        final int milliseconds = snapshot.data!;
                        final int seconds = ((milliseconds ~/ 1000) % 60);

                        return Container(
                          width: MediaQuery.of(context).size.width * .1 + 18,
                          height: 50.88,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFFD9302C)),
                              borderRadius: BorderRadius.circular(9.18),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              seconds.toString(),
                              style: const TextStyle(
                                color: Color(0xFFDB342A),
                                fontSize: 14.18,
                                fontFamily: 'Biryani',
                                fontWeight: FontWeight.w700,
                                height: 0.11,
                              ),
                            ),
                          ),
                        );
                      });
                }),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              value.nameShift.toString(),
              style: const TextStyle(
                color: Color(0xFFDB342A),
                fontSize: 13.67,
                fontFamily: 'Biryani',
                fontWeight: FontWeight.w400,
                height: 0.12,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              '$startTime AM - $endTime PM',
              style: const TextStyle(
                color: Color(0xFFDB342A),
                fontSize: 13.67,
                fontFamily: 'Biryani',
                fontWeight: FontWeight.w400,
                height: 0.12,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const AnimationButtonHome()
          ],
        ),
      );
    });
  }
}
