import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/getPayrollApiProvider.dart';
// import 'package:zeekoihrm/Api/getPayrollApiProvider.dart';
// import 'package:zeekoihrm/provider/getLeaveSumeryProvider.dart';
import 'package:zeekoihrm/re-use-code.dart/numbercnvttostring.dart';
import 'package:zeekoihrm/screens/quickaction.dart/monthpicker.dart';
import 'package:zeekoihrm/screens/quickaction.dart/payslipearning.dart';

class PaySlip extends StatefulWidget {
  const PaySlip({super.key});

  @override
  State<PaySlip> createState() => _PaySlipState();
}

class _PaySlipState extends State<PaySlip> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GetPayRollApiProvider>(context, listen: false)
        .getPayRollApiProvider(context, context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetPayRollApiProvider>(builder: (context, provider, _) {
      final Loading = provider.isLoading;
      final totalamount =
          provider.amount ?? "0"; // Default value if amount is null
      double totalAmountDouble = double.tryParse(totalamount) ?? 0.00;
      int totalAmount = totalAmountDouble.toInt();
      String? id1 = provider.id1.toString();
      print(id1);
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text(
            'Payslip',
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
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .1 - 18,
                    ),
                    const DropdownButtonExample(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .1 - 15,
                    ),
                    const MonthSelector()
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 167,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.97, -0.26),
                      end: Alignment(-0.97, 0.26),
                      colors: [Color(0xFF5E00FF), Color(0xFFE24D7B)],
                    ),
                    borderRadius: BorderRadius.circular(17.65),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Net Pay',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Biryani',
                            fontWeight: FontWeight.w700,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Loading
                            ? const Center(
                                child:
                                    CircularProgressIndicator(), // Show loading indicator
                              )
                            : Text(
                                totalamount.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 39,
                                  fontFamily: 'Biryani',
                                  fontWeight: FontWeight.w700,
                                  height: 1.0,
                                ),
                              ),
                        const SizedBox(height: 20),
                        Loading
                            ? const Center(
                                child:
                                    CircularProgressIndicator(), // Show loading indicator
                              )
                            : Text(
                                convertToWords(totalAmount),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Biryani',
                                  fontWeight: FontWeight.w700,
                                  height: 1.1,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const PayslipEarningScreen(),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<GetPayRollApiProvider>(context, listen: false)
                        .getPdf(id1);
                  },
                  child: Container(
                    width: 240,
                    height: 60.85,
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Download Payslip',
                          style: TextStyle(
                            color: Color(0xFF396CE8),
                            fontSize: 12.49,
                            fontFamily: 'Biryani',
                            fontWeight: FontWeight.w700,
                            height: 0.13,
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Image.asset(
                            'assets/download 1 (1).png',
                            width: 40,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
// Earnings................................................................

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
// ..........................................................................

