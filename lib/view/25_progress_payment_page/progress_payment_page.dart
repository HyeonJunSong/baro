import 'package:baro/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget_box.dart';

class ProgressPaymentPage extends StatelessWidget {
  const ProgressPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _info(),
          ],
        ),
      ),
    );
  }

  _info() => WidgetBox(
    title: "User Information",
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Name", style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),),
              Text("Jerry Kim", style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xFF979797),
              ),),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Email", style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),),
              Text("jjery@gmail.com", style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xFF979797),
              ),),
            ],
          ),
        ),
      ]
    ),
  );


}