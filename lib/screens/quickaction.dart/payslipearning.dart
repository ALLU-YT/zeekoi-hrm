import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/getPayrollApiProvider.dart';
// import 'package:zeekoihrm/Api/getPayrollApiProvider.dart';
// import 'package:zeekoihrm/provider/getLeaveSumeryProvider.dart';

class PayslipEarningScreen extends StatefulWidget {
  const PayslipEarningScreen({Key? key}) : super(key: key);

  @override
  State<PayslipEarningScreen> createState() => _PayslipEarningScreenState();
}

class _PayslipEarningScreenState extends State<PayslipEarningScreen> {
  var isTrue = true;
  var istruee = true;
  String arrowimage = 'assets/emojione-monotone_down-arrow (4).png';

  void onPressed() {
    setState(() {
      isTrue = !isTrue;
    });
  }

  void onPressedd() {
    setState(() {
      istruee = !istruee;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Provider.of<GetPayRollApiProvider>(context, listen: false)
  //       .getPayRollApiProvider();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetPayRollApiProvider>(
      builder: (context, provider, _) {
        final basicSalary = provider.basicSalary;
        final payrollList = provider.payrollList;
        final deductionList = provider.deductionList;
        final totalAmount = provider.totalAmount;
        final deductionAmount = provider.deductionTotal;
        final LOADING = provider.isLoading;
        return Column(
          children: [
            GestureDetector(
              onTap: onPressed,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: const Color(0xFFECE2FD),
                  borderRadius: BorderRadius.circular(11.42),
                ),
                child: LOADING
                    ? const SizedBox(
                        height: 2,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1 -
                                          25),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: Image.asset(
                                  'assets/earning 1.png',
                                  width: 25,
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 26),
                                child: Text(
                                  'Earnings',
                                  style: TextStyle(
                                    color: Color(0xFF1B0044),
                                    fontSize: 12.38,
                                    fontFamily: 'Biryani',
                                    fontWeight: FontWeight.w700,
                                    height: 0.15,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                totalAmount.toStringAsFixed(2),
                                style: const TextStyle(
                                  color: Color(0xFF1B0044),
                                  fontSize: 14,
                                  fontFamily: 'Biryani',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              IconButton(
                                onPressed: onPressed,
                                icon: Image.asset(
                                  isTrue
                                      ? arrowimage
                                      : "assets/emojione-monotone_down-arrow (2).png",
                                  width: 20,
                                ),
                              ),
                            ],
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 400),
                            opacity: isTrue ? 0.0 : 1.0,
                            child: Visibility(
                              visible: !isTrue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(22, 0, 22, 0),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'Basic salary',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF1B0044),
                                                          fontSize: 12.38,
                                                          fontFamily: 'Biryani',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0.15,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        basicSalary.toString(),
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xFF1B0044),
                                                          fontSize: 12.38,
                                                          fontFamily: 'Biryani',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0.15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 0, 0),
                                                    child: DottedLine(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            for (var payroll in payrollList)
                                              if (payroll
                                                      .essentialsAllowances !=
                                                  null)
                                                for (var allowance in payroll
                                                    .essentialsAllowances!)
                                                  for (var i = 0;
                                                      i <
                                                          allowance[
                                                                  'allowance_names']
                                                              .length;
                                                      i++)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                '${allowance['allowance_names'][i]}',
                                                                style:
                                                                    const TextStyle(
                                                                  color: Color(
                                                                      0xFF1B0044),
                                                                  fontSize:
                                                                      12.38,
                                                                  fontFamily:
                                                                      'Biryani',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 0.15,
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              Text(
                                                                '${allowance['allowance_amounts'][i]}',
                                                                style:
                                                                    const TextStyle(
                                                                  color: Color(
                                                                      0xFF1B0044),
                                                                  fontSize:
                                                                      12.38,
                                                                  fontFamily:
                                                                      'Biryani',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 0.15,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 10.0,
                                                          ),
                                                          const Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    0, 0, 0, 0),
                                                            child: DottedLine(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: onPressedd,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: const Color(0xFFECE2FD),
                  borderRadius: BorderRadius.circular(11.42),
                ),
                child: LOADING
                    ? const SizedBox(
                        height: 2,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1 -
                                          25),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: Image.asset(
                                  'assets/Groupddddd.png',
                                  width: 25,
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 26),
                                child: Text(
                                  'Deductions',
                                  style: TextStyle(
                                    color: Color(0xFF1B0044),
                                    fontSize: 12.38,
                                    fontFamily: 'Biryani',
                                    fontWeight: FontWeight.w700,
                                    height: 0.15,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                deductionAmount.toString(),
                                style: const TextStyle(
                                  color: Color(0xFF1B0044),
                                  fontSize: 14,
                                  fontFamily: 'Biryani',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              IconButton(
                                onPressed: onPressed,
                                icon: Image.asset(
                                  istruee
                                      ? arrowimage
                                      : "assets/emojione-monotone_down-arrow (2).png",
                                  width: 20,
                                ),
                              ),
                            ],
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 400),
                            opacity: istruee ? 0.0 : 1.0,
                            child: Visibility(
                              visible: !istruee,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(22, 0, 22, 0),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            for (var deduction in deductionList)
                                              if (deduction
                                                      .essentialsDeductions !=
                                                  null)
                                                for (var deductions in deduction
                                                    .essentialsDeductions!)
                                                  for (var i = 0;
                                                      i <
                                                          deductions[
                                                                  'deduction_names']
                                                              .length;
                                                      i++)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                '${deductions['deduction_names'][i]}',
                                                                style:
                                                                    const TextStyle(
                                                                  color: Color(
                                                                      0xFF1B0044),
                                                                  fontSize:
                                                                      12.38,
                                                                  fontFamily:
                                                                      'Biryani',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 0.15,
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              Text(
                                                                '${deductions['deduction_amounts'][i]}',
                                                                style:
                                                                    const TextStyle(
                                                                  color: Color(
                                                                      0xFF1B0044),
                                                                  fontSize:
                                                                      12.38,
                                                                  fontFamily:
                                                                      'Biryani',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 0.15,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 10.0,
                                                          ),
                                                          const Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    0, 0, 0, 0),
                                                            child: DottedLine(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
