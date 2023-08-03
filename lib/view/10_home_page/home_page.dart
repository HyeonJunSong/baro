import 'package:baro/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(top: 73.h, bottom: 38.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _introductionText(),
            _wallpaperImage(),
            _startButton(),
          ],
        ),
      ),
    );
  }

  Widget _introductionText() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Leisure goods,",
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: colorPrimaryDark,
            ),
          ),
            Text(
            "Easy Borrow",
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: colorPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _wallpaperImage() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        "assets/images/home_wallpaper.png",
        width: 317.w,
      ),
    );
  }

  Widget _startButton() {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed("/Progress");
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48.r),
        ),
        backgroundColor: colorPrimary,
        fixedSize: Size(327.w, 48.h),
      ),
      child: Text(
        "start",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}