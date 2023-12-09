import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

import '../../utils/app_colors.dart';
import '../widgets/otp_form.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key, required this.controller});
  final PageController controller;
  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  String? verifyCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.fromSize(
        size: MediaQuery.sizeOf(context),
        child: Stack(
          children: [
            Positioned(
              left: 30,
              right: 30,
              bottom: 30,
              // padding: const EdgeInsets.all(30),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.whiteColor.withOpacity(.8),
                ),
                child: Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Confirm the code\n',
                      style: TextStyle(
                        color: AppColors.primaryHighContrast,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: 329,
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.primaryColor,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: OtpForm(
                          callBack: (code) {
                            verifyCode = code;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: TextButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          widget.controller.animateToPage(0,
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.ease);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: AppColors.whiteColor,
                        ),
                        child: Text(
                          'confirm',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Resend  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primaryHighContrast,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TimerCountdown(
                          spacerWidth: 0,
                          enableDescriptions: false,
                          colonsTextStyle: TextStyle(
                            color: AppColors.primaryHighContrast,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          timeTextStyle: TextStyle(
                            color: AppColors.primaryHighContrast,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          format: CountDownTimerFormat.minutesSeconds,
                          endTime: DateTime.now().add(
                            const Duration(
                              minutes: 2,
                              seconds: 0,
                            ),
                          ),
                          onEnd: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: InkWell(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          widget.controller.animateToPage(1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        child: Text(
                          'A 6-digit verification code has been sent to info@aidendesign.com',
                          style: TextStyle(
                            color: AppColors.primaryDark,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
