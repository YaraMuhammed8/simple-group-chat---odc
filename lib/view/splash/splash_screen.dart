import 'dart:async';

import 'package:chatodc/core/styles/colors/app_colors.dart';
import 'package:chatodc/view/chat/chat_screen.dart';
import 'package:chatodc/view/enter_name/enter_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/navigation.dart';
import '../../services/local/shared_preference/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Widget destinationScreen;
    if (CacheHelper.getData(key: "name") != null) {
      destinationScreen = ChatScreen();
    } else {
      destinationScreen = EnterNameScreen();
    }
    Timer(
        const Duration(seconds: 3),
        () => NavigationUtils.navigateAndClearStack(
            context: context, destinationScreen: destinationScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wechat_rounded,
            color: AppColors.primaryColor,
            size: 60.h,
          ),
          SizedBox(
            height: 20.h,
          ),
          const CircularProgressIndicator()
        ],
      )),
    );
  }
}
