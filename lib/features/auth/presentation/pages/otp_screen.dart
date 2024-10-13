import 'dart:async';
import 'dart:developer';
import 'package:bloodsearchapp/config/const/app/app_colors.dart';
import 'package:bloodsearchapp/config/navigation/route_name.dart';
import 'package:bloodsearchapp/config/ulilities/extensions/context_extensions.dart';
import 'package:bloodsearchapp/core/widgets/custom_button.dart';
import 'package:bloodsearchapp/core/widgets/input_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({
    super.key,
  });

  @override
  OtpVerifyScreenState createState() => OtpVerifyScreenState();
}

class OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  late Timer _timer;
  int _secondsRemaining = 180; // 3 minutes
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          log('Timer finished!');
        }
      });
    });
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    _timer.cancel();

    super.dispose();
  }

// 01740000463
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;

    return PopScope(
      canPop: _secondsRemaining != 0 ? false : true,
      onPopInvoked: (value) async {
        if (_secondsRemaining != 0) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('Sending OTP'),
                  content: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return DialogContent(
                        secondsRemaining: _secondsRemaining,
                        phoneNumber: '',
                      );
                    },
                  ),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {
                        setState(() {
                          _secondsRemaining = 0;
                          _timer.cancel();
                        });
                        Navigator.of(context).pop();
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: const Text('Leave'),
                    ),
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                );
              },
            );
          });
        }
      },
      child: Scaffold(
        backgroundColor: context.isDarkMode ? AppColors.black : AppColors.white,
        appBar: AppBar(
          backgroundColor:
              context.isDarkMode ? AppColors.black : AppColors.white,
          title: Text("Verify Number",
              style: Theme.of(context).textTheme.headlineSmall),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                100.verticalSpace,
                Text.rich(
                  TextSpan(
                    text: "A code has been sent to your number\n",
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: '01863742138',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            " Please enter the code below to verify your Phone Number",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * .06),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    length: 6,
                    controller: pinController,
                    focusNode: focusNode,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(
                        fontSize: 22,
                        color: isDark
                            ? const Color.fromRGBO(30, 60, 87, 1)
                            : Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: borderColor),
                      ),
                    ),
                    separatorBuilder: (index) => const SizedBox(width: 8),
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (pin) {
                      debugPrint('onCompleted: $pin');
                    },
                    onChanged: (value) {
                      debugPrint('onChanged: $value');
                    },
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                          color: focusedBorderColor,
                        ),
                      ],
                    ),
                    focusedPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: const TextStyle(
                        fontSize: 22,
                        color: Color.fromRGBO(30, 60, 87, 1),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: borderColor),
                      ),
                    ),
                    submittedPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(
                        fontSize: 22,
                        color: !isDark
                            ? const Color.fromRGBO(30, 60, 87, 1)
                            : Colors.white,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: focusedBorderColor)),
                    ),
                    errorPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(
                        fontSize: 22,
                        color: !isDark
                            ? const Color.fromRGBO(30, 60, 87, 1)
                            : Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.timer),
                    const SizedBox(width: 5),
                    Text(
                      '$minutes:${seconds.toString().padLeft(2, '0')}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 25),
                CustomButton(
                    title: "Verify",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // Navigator.pushReplacementNamed(
                        //     context, RouteName.otpVerifyScreen);
                      }
                    }),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DialogContent extends StatefulWidget {
  final int secondsRemaining;
  final String phoneNumber;

  const DialogContent({
    super.key,
    required this.secondsRemaining,
    required this.phoneNumber,
  });

  @override
  DialogContentState createState() => DialogContentState();
}

class DialogContentState extends State<DialogContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('We will send OTP to this ${widget.phoneNumber}.'),
        const SizedBox(height: 10),
        Text('Please wait ${widget.secondsRemaining} seconds.'),
      ],
    );
  }
}
