import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:zeekoihrm/Api/LeaveTrakerapi/leaveTracerApiAll.dart';
import 'package:zeekoihrm/Api/getPayrollApiProvider.dart';

class MonthSelector extends StatefulWidget {
  const MonthSelector({super.key});

  @override
  _MonthSelectorState createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  // Initial month
  String currentMonth = '01'; // Initial month is January ('01')

  // List of month names
  List<String> monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentDateAndFetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 46,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF5727A3)),
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Image.asset(
              'assets/Vector (2).png',
              width: 13,
            ),
            onPressed: () {
              Provider.of<GetPayRollApiProvider>(context, listen: false)
                  .fetchData();
              changeMonth(-1); // Decrement month
            },
          ),
          const Spacer(),
          Text(
            monthNames[int.parse(currentMonth) - 1], // Display month name
            style: const TextStyle(
              color: Color(0xFF1B0044),
              fontSize: 15,
              fontFamily: 'Biryani',
              fontWeight: FontWeight.w700,
              height: 0.11,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Image.asset(
              'assets/Vector (1).png',
              width: 13,
            ),
            onPressed: () {
              Provider.of<GetPayRollApiProvider>(context, listen: false)
                  .fetchData();
              changeMonth(1); // Increment month
            },
          ),
        ],
      ),
    );
  }

  // Method to update the displayed month
  void changeMonth(int monthChange) {
    List<String> months = [
      '01', // January
      '02', // February
      '03', // March
      '04', // April
      '05', // May
      '06', // June
      '07', // July
      '08', // August
      '09', // September
      '10', // October
      '11', // November
      '12', // December
    ];

    int currentIndex = months.indexOf(currentMonth);
    int newIndex = (currentIndex + monthChange) % months.length;

    setState(() {
      currentMonth = months[newIndex];
    });

    // Update data for the new month
    _fetchDataForMonth('2024', currentMonth); // Update the year accordingly
  }

  // Method to fetch data for the selected month
  void _fetchDataForMonth(String year, String month) async {
    final getPayroll =
        Provider.of<GetPayRollApiProvider>(context, listen: false);

    await getPayroll.getPayRollApiProvider(year, month);
  }

  // Method to get the current date and fetch data for the current month
  void _getCurrentDateAndFetchData() {
    DateTime now = DateTime.now();
    String currentMonth = now.month.toString().padLeft(2, '0');
    setState(() {
      this.currentMonth = currentMonth;
    });

    _fetchDataForMonth('2024', currentMonth); // Update the year accordingly
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key? key}) : super(key: key);

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = '2024'; // Initial dropdown value

  // List of years
  final List<String> years = ['2022', '2023', '2024', '2025'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3 + 9,
      height: 46,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF5727A3)),
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: DropdownButton<String>(
        padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
        value: dropdownValue,
        icon: Image.asset(
          'assets/Vector (4).png',
          width: 25,
        ),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 0,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? value) {
          Provider.of<GetPayRollApiProvider>(context, listen: false)
              .fetchData();
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });

          // Call method to fetch data for the selected month and year
          _fetchDataForMonth(
              value!, '01'); // Assuming January is the default month
        },
        items: years.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  // Method to fetch data for the selected month and year
  void _fetchDataForMonth(String year, String month) async {
    final getPayroll =
        Provider.of<GetPayRollApiProvider>(context, listen: false);

    await getPayroll.getPayRollApiProvider(year, month);
  }
}
