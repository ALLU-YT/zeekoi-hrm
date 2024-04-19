import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:zeekoihrm/Api/LeaveTrakerapi/leaveTracerApiAll.dart';
import 'package:zeekoihrm/screens/bottomnavbar.dart';
import 'package:zeekoihrm/screens/quickaction.dart/LeaveSession.dart';
import 'package:zeekoihrm/screens/quickaction.dart/LeaveTypeSheet.dart';
import 'package:zeekoihrm/screens/quickaction.dart/leavetracker.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({super.key});

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  final TextEditingController textController = TextEditingController();
  String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String result = "Select a leave Type";
  String resultsessiondata = 'Select a Session';
  String sessiondata = '';
  String buttonLabel = 'Slide Me';
  String appContent = 'Apply for leave';
  Color buttonColor2 = const Color(0xFFFB644B);
  Image appImage = Image.asset(
    'assets/Mask group.png',
    width: 100,
  );

  @override
  Widget build(BuildContext context) {
    Future<void> openCalendar() async {
      DateTime selectedDate = DateTime.now();

      // Show the date picker dialog
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      // Update the selected date if a date is chosen
      if (pickedDate != null && pickedDate != selectedDate) {
        // Format the date without milliseconds
        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

        setState(() {
          date =
              formattedDate; // Update the date variable with the selected date
        });

        // Handle the selected date, you can update your UI or perform any other actions here
        print("Selected date: $formattedDate");
      }
    }

    Future<void> openCalendarend() async {
      DateTime selectedDate = DateTime.now();

      // Show the date picker dialog
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      // Update the selected date if a date is chosen
      if (pickedDate != null && pickedDate != selectedDate) {
        // Format the date without milliseconds
        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

        setState(() {
          endDate =
              formattedDate; // Update the date variable with the selected date
        });

        // Handle the selected date, you can update your UI or perform any other actions here
        print("Selected date: $formattedDate");
      }
    }

    void openAddExpenseOverlay() {
      showModalBottomSheet(
        showDragHandle: true,
        isDismissible: true,
        useSafeArea: true,
        isScrollControlled: false,
        context: context,
        builder: (ctx) => LeaveTypeSheet(
          onSelectData: _handleSelectedData,
        ),
      );
    }

    void openAddExpenseOverlayy() {
      showModalBottomSheet(
        showDragHandle: true,
        isDismissible: true,
        useSafeArea: true,
        isScrollControlled: false,
        context: context,
        builder: (ctx) => LeaveSession(
          onSelectDataa: _handleSelectedDataa,
        ),
      );
    }

    return Consumer<LeaveTrackerApiAll>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const NavBar(),
                    type: PageTransitionType.leftToRight,
                    duration: const Duration(milliseconds: 300),
                    reverseDuration: const Duration(milliseconds: 300),
                  ),
                );
              },
            ),
          ),
          title: const Text(
            'Apply leave',
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
          children: <Widget>[
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                onTap: () {
                  openAddExpenseOverlay();
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Leave Type',
                      style: TextStyle(
                        color: Color(0xFF909090),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            result,
                            style: const TextStyle(
                              color: Color(0xFF1D2730),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: openAddExpenseOverlay,
                            icon: Image.asset(
                              'assets/bxs_up-arrow (1).png',
                              width: 20,
                              height: 20,
                            ))
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Divider(
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                onTap: () {
                  openAddExpenseOverlayy();
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Session',
                      style: TextStyle(
                        color: Color(0xFF909090),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            resultsessiondata,
                            style: const TextStyle(
                              color: Color(0xFF1D2730),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: openAddExpenseOverlayy,
                            icon: Image.asset(
                              'assets/bxs_up-arrow (1).png',
                              width: 20,
                              height: 20,
                            ))
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Divider(
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                onTap: () {
                  openCalendar();
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Start Date',
                      style: TextStyle(
                        color: Color(0xFF909090),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            date,
                            style: const TextStyle(
                              color: Color(0xFF1D2730),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: openCalendar,
                            icon: Image.asset(
                              'assets/calendar 1 (2).png',
                              width: 25,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Divider(
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                onTap: () {
                  openCalendarend();
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'End Date',
                      style: TextStyle(
                        color: Color(0xFF909090),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            endDate,
                            style: const TextStyle(
                              color: Color(0xFF1D2730),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: openCalendarend,
                            icon: Image.asset(
                              'assets/calendar 1 (2).png',
                              width: 25,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Divider(
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Reason',
                      style: TextStyle(
                        color: Color(0xFF909090),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your text',
                        hintStyle: TextStyle(fontSize: 15),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(29, 0, 0, 0), width: 1.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: HorizontalSlidableButton(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 60,
                        buttonWidth: 60,
                        color: buttonColor2,
                        dismissible: true,
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
                                height: 1.0,
                              ),
                            ),
                          ),
                        ),
                        onChanged: (position) {
                          setState(() {
                            var reason = textController.text.trim();
                            if (position == SlidableButtonPosition.end) {
                              Provider.of<LeaveTrackerApiAll>(context,
                                      listen: false)
                                  .dataConvertbacktoId(result,
                                      resultsessiondata, date, endDate, reason);
                              Provider.of<LeaveTrackerApiAll>(context,
                                      listen: false)
                                  .getLeaveTrackerSummery();
                              // Navigate to the LeaveTracker page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    // Show the Snackbar
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Apply leave successfully'),
                                        ),
                                      );
                                    });

                                    // Return the page you want to navigate to
                                    return const LeaveTracker();
                                  },
                                ),
                              );

                              // Update buttonLabel, appContent, appImage if necessary
                              buttonLabel = 'Slide Right';
                              appContent = 'Slide to check Out';
                              appImage = Image.asset(
                                'assets/Mask group (1).png',
                                width: 100,
                              );

                              buttonLabel = 'Slide Right';
                              appContent = 'Slide to check Out';
                              appImage = Image.asset(
                                'assets/Mask group (1).png',
                                width: 100,
                              );
                            }
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  void _handleSelectedData(String selectedData) {
    setState(() {
      // Update the state with the selected data
      result = selectedData;
    });
  }

  void _handleSelectedDataa(String sessiondata) {
    setState(() {
      // Update the state with the selected data
      resultsessiondata = sessiondata;
    });
  }
}
