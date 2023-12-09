import 'package:flutter/material.dart';
import 'package:glass_login/utils/custom_bg.dart';

import '../../utils/app_colors.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'verify_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  late PageController controller;
  late int selectedIndex;
  late double pageValue;

  @override
  void initState() {
    selectedIndex = 0;
    pageValue = 0.0;
    controller =
        PageController(initialPage: selectedIndex, viewportFraction: 1.0)
          ..addListener(() {
            setState(() {
              pageValue = controller.page!;
            });
          });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
            left: pageValue * -w,
            top: 0,
            child: Container(
              height: h,
              width: w * 3,
              decoration: const BoxDecoration(),
              child: CustomPaint(
                painter: CustomBackground(
                  firstColor: AppColors.primaryColor,
                  secondColor: AppColors.primaryDark,
                ),
              ),
            ),
          ),
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(
              parent: ClampingScrollPhysics(),
            ),
            itemCount: 3,
            controller: controller,
            itemBuilder: (context, index) {
              if (index == 0) {
                return LoginScreen(controller: controller);
              } else if (index == 1) {
                return SingUpScreen(controller: controller);
              } else {
                return VerifyScreen(controller: controller);
              }
            },
          ),
        ],
      ),
    );
  }
}
