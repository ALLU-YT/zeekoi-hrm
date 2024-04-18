import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/LeaveTrakerapi/leaveTracerApiAll.dart';

typedef SelectedDataCallback = void Function(String selectedDataa);

class LeaveSession extends StatefulWidget {
  final SelectedDataCallback onSelectDataa;

  const LeaveSession({required this.onSelectDataa, Key? key}) : super(key: key);
  @override
  State<LeaveSession> createState() => _LeaveSessionState();
}

class _LeaveSessionState extends State<LeaveSession> {
  String data = '';
  @override
  Widget build(BuildContext context) {
    return Consumer<LeaveTrackerApiAll>(builder: (context, provider, _) {
      return ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .1 - 15,
                  ),
                  const Text(
                    'Choose a leave type',
                    style: TextStyle(
                      color: Color(0xFF1B0044),
                      fontSize: 16,
                      fontFamily: 'Biryani',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(); // Close bottom sheet
                    },
                    child: Container(
                      width: 65,
                      height: 25.96,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFF3F3),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.87, color: Color(0xFFC60D05)),
                          borderRadius: BorderRadius.circular(5.12),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Close',
                          style: TextStyle(
                            color: Color(0xFFC60D05),
                            fontSize: 8.68,
                            fontFamily: 'Biryani',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  ListTile(
                    onTap: () {
                      setState(() {
                        data = provider.fullday.toString();
                      });
                      widget.onSelectDataa(data); // Call the callback function
                      Navigator.of(context).pop(); // Close bottom sheet
                    },
                    title: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .1 - 30,
                        ),
                        Expanded(
                          child: Text(
                            provider.fullday.toString(),
                            style: const TextStyle(
                              color: Color(0xFF1D2730),
                              fontSize: 16,
                              fontFamily: 'Biryani',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/iconamoon_arrow-down-2-light.png',
                          width: 26,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Divider(
                  height: 0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            onTap: () {
              setState(() {
                data = provider.firsthalf.toString();
              });
              widget.onSelectDataa(data); // Call the callback function
              Navigator.of(context).pop(); // Close bottom sheet
            },
            title: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .1 - 30,
                ),
                Expanded(
                  child: Text(
                    provider.firsthalf.toString(),
                    style: const TextStyle(
                      color: Color(0xFF1D2730),
                      fontSize: 16,
                      fontFamily: 'Biryani',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/iconamoon_arrow-down-2-light.png',
                  width: 26,
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Divider(
              height: 0,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            onTap: () {
              setState(() {
                data = provider.secondhalf.toString();
              });
              widget.onSelectDataa(data); // Call the callback function
              Navigator.of(context).pop(); // Close bottom sheet
            },
            title: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .1 - 30,
                ),
                Expanded(
                  child: Text(
                    provider.secondhalf.toString(),
                    style: const TextStyle(
                      color: Color(0xFF1D2730),
                      fontSize: 16,
                      fontFamily: 'Biryani',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/iconamoon_arrow-down-2-light.png',
                  width: 26,
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Divider(
              height: 0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Divider(
              height: 0,
            ),
          ),
        ],
      );
    });
  }
}
